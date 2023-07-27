<?php

namespace App\Http\Controllers;

use App\Models\ApproveReview;
use App\Models\User;
use Illuminate\Http\Request;

class ApproveController extends Controller
{
    public function addApprove(Request $request)
    {
        $approve = new ApproveReview();
        $approve->idReview = $request->input('idReview');
        $approve->committeMNDate = $request->input('committeMNDate');
        $approve->committeMNNumber = $request->input('committeMNNumber');
        $approve->committeSCDate =$request->input('committeSCDate');
        $approve->committeSCNumber =$request->input('committeSCNumber');
        $approve->orderDate =$request->input('orderDate');
        $approve->orderNumber =$request->input('orderNumber');
        $approve->resolution =$request->input('resolution');
        $approve->save();
        return response()->json(['success' => true]);
    }
    public function deleteApprove(Request $request)
    {
        $approve=ApproveReview::query()->findOrFail($request->get('id'));
        $approve->delete();
        return response()->json(['success' => true]);
    }
}
