<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function addComment(Request $request)
    {
        $comment = new Comment();
        $comment->comment = $request->input('comment');
        $comment->idReview = $request->input('idReview');
        $comment->idUser = $request->input('idUser');
        $comment->date = $request->input('date');
        $comment->save();
        return response()->json(['success' => true]);
    }

    public function deleteComment(Request $request)
    {
        $id = $request->get('id');
        $comment = Comment::findOrFail($id);
        $comment->delete();

        return response()->json(['success' => true]);
    }
}
