<?php

namespace App\Http\Controllers;

use App\Models\StateReview;
use Illuminate\Http\Request;

class StateReviewController extends Controller
{

    public function addStateReview(Request $request)
    {
        $states = new StateReview();
        $states->idState = $request->input('idState');
        $states->idReview = $request->input('idReview');
        $states->save();
        return response()->json(['success' => true]);
    }

    public function deleteStateReview(Request $request)
    {
        $state=StateReview::query()->findOrFail($request->get('id'));
        $state->delete();
        return response()->json(['success' => true]);
    }
}
