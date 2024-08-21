<?php

namespace App\Http\Controllers;

use App\Models\Approve;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;

class ApproveController extends Controller
{

    public function create(Request $request)
{
    // Validate the incoming request data
    $validatedData = $request->validate([
        'review_id' => 'required|array',
        'committeMNDate' => 'nullable|date',
        'committeMNNumber' => 'nullable|numeric',
        'committeSCDate' => 'nullable|date',
        'committeSCNumber' => 'nullable|numeric',
        'orderDate' => 'nullable|date',
        'orderNumber' => 'nullable|numeric',
        'resolution' => 'nullable|string',
    ]);

    // Loop through each review_id and create an entry
    foreach ($validatedData['review_id'] as $id) {
        $approve = new Approve();
        $approve->review_id = $id; // Assuming review_id is an integer
        $approve->committeMNDate = $validatedData['committeMNDate'] ?? '2000-01-01';
        $approve->committeMNNumber = $validatedData['committeMNNumber'] ?? 0;
        $approve->committeSCDate = $validatedData['committeSCDate'] ?? '2000-01-01';
        $approve->committeSCNumber = $validatedData['committeSCNumber'] ?? 0;
        $approve->orderDate = $validatedData['orderDate'] ?? '2000-01-01';
        $approve->orderNumber = $validatedData['orderNumber'] ?? 0;
        $approve->resolution = $validatedData['resolution'] ?? '';
        $approve->save();

        // Find the associated review and update its status
        $review = Review::find($id);
        if ($review) {
            $review->status_id = 2; // Update to the desired status
            $review->save();
        }
    }

    return response()->json(['success' => true]);
}
    

    public function approveReview(Request $request){
        $id = $request->input('id');

        $approve = Approve::where('review_id', $id)->get();
        return response()->json($approve);
    }

    public function updateApprove(Request $request)
    {
        $id = $request->input('formData.id');
        $approveDelete=Approve::find($id);
        $approveDelete->delete();

        $approve = new Approve();
        $approve->review_id = $request->input('formData.review_id');
        $approve->resolution = $request->input('formData.resolution');
        $approve->orderNumber = $request->input('formData.orderNumber');
        $approve->orderDate = $request->input('formData.orderDate');
        $approve->committeSCNumber = $request->input('formData.committeSCNumber');
        $approve->committeSCDate = $request->input('formData.committeSCDate');
        $approve->committeMNNumber = $request->input('formData.committeMNNumber');
        $approve->committeMNDate = $request->input('formData.committeMNDate');
        $approve->save();
        return response()->json(['success' => true]);
    }




   public function destroy(Request $request) {
        $id = $request->input('id');
        $approve=Approve::find($id);
        $reviewId = $approve->review_id;

        // Змініть статус огляду на сервері. Встановіть потрібний вам новий статус.
        // Залежно від вашої моделі, цей код може бути різним.

        // Наприклад, якщо у вас є модель Review, ви можете зробити так:
        $review = Review::find($reviewId);
        $review->status_id = 1; // Припустимо, що статус 2 відповідає новому статусу.
        $review->save();

        $approve->delete();



        return response()->json(['success' => true]);
    }

}
