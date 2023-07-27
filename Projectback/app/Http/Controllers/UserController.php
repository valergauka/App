<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function addUser(Request $request)
    {
      $user = new User();
      $user->name = $request->input('name');
      $user->email = $request->input('email');
      $user->password = $request->input('password');
      $user->position=$request->input('position');
      $user->save();
      return response()->json(['success' => true]);
    }

    public function deleteUser(Request $request)
    {
        $user=User::query()->findOrFail($request->get('id'));
        $user->delete();
        return response()->json(['success' => true]);
    }
}
