<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    public function addReview(Request $request)
    {
        $review = new Review();
        $review->educLevel = $request->input('educLevel');
        $review->branch = $request->input('branch');
        $review->speciality = $request->input('speciality');
        $review->specialization = $request->input('specialization');
        $review->nameOp = $request->input('nameOp');
        $review->guaranty = $request->input('guaranty');
        $review->category = $request->input('category');
        $review->structural = $request->input('structural');
        $review->faculty = $request->input('faculty');
        $review->date = $request->input('date');
        $review->save();
        return response()->json(['success' => true]);
    }

    public function deleteReview(Request $request)
    {
        $review=Review::query()->findOrFail($request->get('id'));
        $review->delete();
        return response()->json(['success' => true]);
    }

}
