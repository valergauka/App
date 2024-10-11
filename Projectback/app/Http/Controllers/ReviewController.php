<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\File;
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
     public function getReviews()
    {
        // Витягуємо reviews разом з пов'язаними approves
        $reviews = Review::with(['user:name,id', 'category:title,id', 'approve'])->get();

        return response()->json($reviews);
    }


public function reviewStatus(Request $request) {
    $id = $request->input('id');
    $togg = $request->input('togg');
    $userId = $request->input('userId'); 
    $reviews = [];

    if ($togg === 1) {
        // Крок 1: Отримуємо всі review_id для користувача
        $responsibleReviews = ResponsibleForReview::where('user_id', $userId)
            ->pluck('review_id'); // Отримуємо тільки поле review_id

        foreach ($responsibleReviews as $reviewId) {
            $reviewQuery = Review::with([
                    'user:id,name',        // Завантажуємо дані про користувача
                    'category:id,title',   // Завантажуємо дані про категорію
                    'approve',             // Завантажуємо approve
                    'file',                // Завантажуємо файли
                    'responsibleUsers.user' // Додано для отримання відповідального
                ])
                ->where('id', $reviewId);

            if ($id !== 0) {
                $reviewQuery->where('status_id', $id); // Фільтруємо за статусом
            }

            $review = $reviewQuery->first(); // Отримуємо перший запис

            if ($review) {
                $reviews[] = $review; // Додаємо відгук до масиву $reviews
            }
        }
    } else {
        // Якщо toggle вимкнений
        $reviewQuery = Review::with('user:name,id', 'category:title,id', 'approve', 'file');

        if ($id !== 0) {
            $reviewQuery->where('status_id', $id); // Фільтруємо за статусом
        }

        $reviews = $reviewQuery->get();
    }

    // Додаємо поле responsable
    foreach ($reviews as &$review) {
        $review->responsable = $review->responsibleUsers->map(function ($responsible) {
            return $responsible->user; // Отримуємо відповідального користувача
        });
    }

    return response()->json($reviews);
}

    public function updateStatus(Request $request)
    {
        $id = $request->input('reviewId');
        $userId = $request->input('userId'); // ID нового відповідального
        $responsible = ResponsibleForReview::where('review_id', $id)->first();
        $responsible->delete();
        $newResponsible = new ResponsibleForReview();
        $newResponsible->user_id = $userId; // ID нового відповідального
        $newResponsible->review_id = $id; // Встановлення review_id для нового відповідального
        $newResponsible->save();
        
        return response()->json($responsible);
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
        $reviewId = $review->id;

        return response()->json($reviewId);
    }

    public function assignUser(Request $request){
        $resp = new ResponsibleForReview();
        $resp ->user_id = $request->input('userId');
        $resp ->review_id = $request->input('reviewId');
        $resp->save();
        $id = $resp->id;

        return response()->json($id);
    }


    public function deleteReview(Request $request)
    {
        $id = $request->input('id');
        $review = Review::find($id);
        $folderPath = storage_path('storage/app/uploads/' . $id);
        if (File::exists($folderPath)) {
            // Видалення папки
            File::deleteDirectory($folderPath);
            echo "Папка з ID review $id була успішно видалена.";
        } else {
            echo "Папка з ID review $id не існує.";
        }


        if ($review) {
            // Use exists method to check if any approve records match the query
            $hasApproves = Approve::where('review_id', $id)->exists();

            if ($hasApproves) {
                // Delete associated approve records
                Approve::where('review_id', $id)->delete();
            }

            // Delete the review
            $review->delete();

            return response()->json(['success' => true]);
        } else {
            // Handle the case where the review with the given ID doesn't exist
            return response()->json(['success' => false, 'message' => 'Review not found'], 404);
        }

    }


}
