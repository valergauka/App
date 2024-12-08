<?php

namespace App\Http\Controllers;

use App\Models\Approve;
use App\Models\Review;
use Illuminate\Http\Request;

class ApproveController extends Controller
{
    // Method to create new approval entries
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

        // Return success response
        return response()->json(['success' => true]);
    }

    // Method to fetch approval data by review ID
    public function approveReview(Request $request)
    {
        $id = $request->input('id');
        $approve = Approve::where('review_id', $id)->get();
        return response()->json($approve);
    }

    // Method to update an existing approval entry
    public function updateApprove(Request $request)
    {
        try {
            // Validate the incoming request data
            $validatedData = $request->validate([
                'id' => 'required|integer|exists:approves,id',
                'review_id' => 'required|integer|exists:reviews,id',
                'committeMNDate' => 'nullable|date',
                'committeMNNumber' => 'nullable|numeric',
                'committeSCDate' => 'nullable|date',
                'committeSCNumber' => 'nullable|numeric',
                'orderDate' => 'nullable|date',
                'orderNumber' => 'nullable|numeric',
                'resolution' => 'nullable|string',
            ]);

            $approve = Approve::find($validatedData['id']);

            if ($approve) {
                $approve->update($validatedData);
                return response()->json(['success' => true]);
            } else {
                return response()->json(['error' => 'Approve not found'], 404);
            }
        } catch (\Exception $e) {
            // Log the error for debugging purposes
            \Log::error('Update Approve Error: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    // Method to delete an approval entry
    public function destroy(Request $request)
    {
        $id = $request->input('id');
        $approve = Approve::find($id);

        if ($approve) {
            $reviewId = $approve->review_id;

            // Change the status of the associated review
            $review = Review::find($reviewId);
            if ($review) {
                $review->status_id = 1; // Revert to the previous status (for example, 1 could be 'Pending')
                $review->save();
            }

            // Delete the approve entry
            $approve->delete();

            return response()->json(['success' => true]);
        } else {
            return response()->json(['error' => 'Approve not found'], 404);
        }
    }
}
