<?php

use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Models\Category;
use App\Models\Group;
use App\Models\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Review;
use App\Models\Comment;
use App\Models\Op;
use App\Models\User;
use App\Models\ApproveReview;
use App\Http\Controllers\UserController;
use App\Http\Controllers\OpController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\ApproveController;
use App\Http\Controllers\CommentController;
use App\Models\state;
use App\Models\StateReview;
use App\Http\Controllers\StateReviewController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();});



Route::get('/status', function (){
    $status = Status::all();
    return $status;});

Route::post('/review/status', [ReviewController::class, 'reviewStatus']);
Route::get('/category', function (){
    $categories = Category::all();
    return $categories;});

Route::get('/reviews', [ReviewController::class, 'getReviews']);
Route::post("/reviewCreate", [ReviewController::class, 'reviewCreate']);
Route::post('/updateStatus', [ReviewController::class, 'updateStatus']);
Route::post("/reviewDelete", [ReviewController::class, 'deleteReview']);
// Route::post('/getReviewsByStatus', [ReviewController::class, 'getReviewsByStatus']);





Route::get('/approve', function (){
    $approve = \App\Models\Approve::all();
    return $approve;});
Route::post('/createApprove', [ApproveController::class, 'create']);
Route::post('/approveReview', [ApproveController::class, 'approveReview']);
Route::post('/updateApprove', [ApproveController::class, 'updateApprove']);
Route::post('/approveDelete', [ApproveController::class, 'destroy']);






//admin
Route::get('/op', function (){
    $op = Op::all();
    return $op;});
Route::post('/createOp', [OpController::class, 'createOp']);
Route::delete("/deleteOp", [OpController::class, 'deleteOp']);


//Route::get('/comment', function (){
//    $comment = Comment::all();
//    return $comment;});
//







Route::post('/login',  [AuthController::class, 'login']);
Route::post('/register',  [AuthController::class, 'register']);
Route::post('/logout', [AuthController::class, 'logout']);
Route::post('/user', [AuthController::class, 'userCreate']);
//Route::post('/check-logout', [AuthController::class, 'checkLogout']);
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/groupUser', [UserController::class, 'getUserGroups']);
Route::post('/users/groups', [UserController::class, 'getUserGroupsEdit']);
Route::get('/getUsersByGroupId', [UserController::class, 'getUsersByGroupId']);
Route::post('/users/groups/edit', [UserController::class, 'updateRoles']);
Route::delete('/users/{id}', [UserController::class, 'deleteUser']);
Route::post('/forgot-password', [ForgotPasswordController::class,'sendResetLinkEmail']);

Route::post('/upload-files', [FileController::class, 'uploadFiles']);
Route::get('files/{reviewId}',  [FileController::class, 'getFilesByReviewId']);

Route::post('/createComment', [CommentController::class, 'create']);
Route::post('/reviews/comments', [CommentController::class,'comments']);
Route::delete('/comment/{id}',[CommentController::class, 'deleteComment']);
