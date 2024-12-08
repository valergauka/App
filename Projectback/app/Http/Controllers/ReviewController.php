<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Redis;
use App\Models\Approve;
use App\Models\Category;
use App\Models\Review;
use App\Models\Status;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\ResponsibleForReview;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function reviewStatus(Request $request)
    {
        $id = $request->input('id');
        $togg = $request->input('togg');
        $userId = $request->input('userId');

        // Ключ кешу для збереження даних
        $cacheKey = "review_status_{$id}_{$togg}_{$userId}";
        $cacheTTL = 600; // Кеш зберігається протягом 10 хвилин

        // Перевіряємо наявність даних у кеші
        $reviews = Cache::remember($cacheKey, $cacheTTL, function () use ($id, $togg, $userId) {
            $reviews = [];

            if ($togg === 1) {
                $responsibleReviews = ResponsibleForReview::where('user_id', $userId)->pluck('review_id');

                foreach ($responsibleReviews as $reviewId) {
                    $reviewQuery = Review::with([
                        'user:id,name',
                        'category:id,title',
                        'approve',
                        'file',
                        'responsibleUsers.user'
                    ])->where('id', $reviewId);

                    if ($id !== 0) {
                        $reviewQuery->where('status_id', $id);
                    }

                    $review = $reviewQuery->first();

                    if ($review) {
                        $reviews[] = $review;
                    }
                }
            } else {
                $reviewQuery = Review::with('user:id,name', 'category:id,title', 'approve', 'file');

                if ($id !== 0) {
                    $reviewQuery->where('status_id', $id);
                }

                $reviews = $reviewQuery->get();
            }

            // Обробляємо відповідальних для кожного огляду
            foreach ($reviews as &$review) {
                $review->responsable = $review->responsibleUsers->map(function ($responsible) {
                    return $responsible->user;
                });
            }

            return $reviews;
        });

        return response()->json($reviews);
    }

    public function updateStatus(Request $request)
    {
        $id = $request->input('id');
        $status_id = $request->input('statusId');
        $review = Review::find($id);

        if ($review) {
            $review->status_id = $status_id; // Оновлюємо статус
            $review->save();

            // Оновлюємо кеш після оновлення статусу
            $cacheKey = "review_status_{$status_id}_0_{$review->user_id}";
            Cache::forget($cacheKey);
        }
    }

    public function reviewCreate(Request $request)
    {
        $review = new Review();
        $review->educLevel = $request->input('educLevel');
        $review->branch = $request->input('branch');
        $review->speciality = $request->input('speciality');
        $review->specialisation = $request->input('specialisation');
        $review->nameOp = $request->input('nameOp');
        $review->guarantor = $request->input('guarantor');
        $review->structural = $request->input('structural');
        $review->faculty = $request->input('faculty');
        $review->date = $request->input('date');
        $review->category_id = $request->input('category_id');
        $review->status_id = $request->input('status_id');
        $review->user_id = $request->input('user_id');
        $review->save();

        // Очищаємо кеш для нових оглядів
        Cache::forget("review_status_{$review->status_id}_0_{$review->user_id}");

        return response()->json($review->id);
    }

    public function assignUser(Request $request)
    {
        $existingResponsible = ResponsibleForReview::where('review_id', $request->input('reviewId'))->first();

        if ($existingResponsible) {
            $existingResponsible->user_id = $request->input('userId');
            $existingResponsible->save();
        } else {
            $resp = new ResponsibleForReview();
            $resp->user_id = $request->input('userId');
            $resp->review_id = $request->input('reviewId');
            $resp->save();
        }

        // Очищаємо кеш після зміни відповідального
        $review = Review::find($request->input('reviewId'));
        Cache::forget("review_status_{$review->status_id}_0_{$review->user_id}");

        return response()->json(['success' => true, 'message' => 'Відповідальний призначений успішно.']);
    }

    public function deleteReview(Request $request)
    {
        $id = $request->input('id');
        $review = Review::find($id);

        if ($review) {
            $hasApproves = Approve::where('review_id', $id)->exists();

            if ($hasApproves) {
                Approve::where('review_id', $id)->delete();
            }

            $review->delete();
        }

        // Очищення кешу для видалених оглядів
        Cache::forget("review_status_{$id}_0_{$request->input('userId')}");

        return response()->json(['success' => true]);
    }
}
