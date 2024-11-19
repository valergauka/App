<?php

namespace App\Http\Controllers;

use App\Models\Approve;
use App\Models\Comment;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function create(Request $request)
    {
        $comment = new Comment();
        $comment->comment = $request->input('comment');
        $comment->user_id = $request->input('user_id');
        $comment->review_id = $request->input('review_id');
        $comment->save();


        return response()->json(['success' => true]);
    }


    public function comments(Request $request) {
        $reviewId = $request->input('reviewId');
        $comments = Comment::where('review_id', $reviewId)
            ->with('user') // Eager load the associated user
            ->get();
        return response()->json($comments);
    }


    public function deleteComment($id)
    {// Знайдіть користувача за його ідентифікатором
        $comment = Comment::find($id);
        try {
            //$user->groups()->detach();

            // Видаліть самого користувача
            $comment->delete();

            return response()->json(['message' => 'Користувача та його записи в таблиці group_user видалено успішно']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Помилка видалення користувача'], 500);
        }}
}
