<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\File;
use App\Models\Approve;
use App\Models\Category;
use App\Models\Review;
use App\Models\Status;
use App\Models\User;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
     public function getReviews()
    {
        // Витягуємо reviews разом з пов'язаними approves
        $reviews = Review::with(['user:name,id', 'category:title,id', 'approve'])->get();

        return response()->json($reviews);
    }


    public function reviewStatus(Request $request){
        $id = $request->input('id');

        if ($id === 0) {
            $reviews = Review::with('user:name,id', 'category:title,id', 'approve','file')->get();
        } else {
            $reviews = Review::with('user:name,id', 'category:title,id', 'approve', 'file')->where('status_id', $id)->get();
        }

        return response()->json($reviews);

    }



    public function updateStatus(Request $request)
    {
        $id = $request->input('id');
        $review = Review::find($id);
        $review->status_id = 3;
        $review->save();
        return response()->json(['success' => true]);

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

    // public function getReviewsByStatus(Request $request)
    // {
    //     $statusId = $request->input('id');
    //     if ($statusId === 0) {
    //         // Отримати всі огляди, якщо status_id === 0
    //         $reviews = Review::all();
    //     } else {
    //         // Отримати огляди за певним статусом
    //         $reviews = Review::where('status_id', $statusId)->get();
    //     }
        
    //     return response()->json($statusId);
    // }
    


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
