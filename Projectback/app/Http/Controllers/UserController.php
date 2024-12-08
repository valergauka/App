<?php

namespace App\Http\Controllers;

use App\Models\Group;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Redis;

class UserController extends Controller
{
    public function getUsersByGroupId(Request $request)
    {
        $groupId = $request->get('id'); // Отримайте ідентифікатор групи з параметра запиту

        // Використовуємо кешування
        $cacheKey = 'users_group_' . $groupId;
        
        // Якщо користувачі кешовані, то отримуємо їх з кешу, інакше запитуємо базу даних
        $users = Cache::remember($cacheKey, now()->addMinutes(10), function() use ($groupId) {
            $group = Group::with('users')->find($groupId);

            if (!$group) {
                return response()->json(['error' => 'Групу не знайдено'], 404);
            }

            return $group->users;
        });

        return response()->json($users);
    }

    public function update(Request $request)
    {
        $id = $request->input('id');
        $validatedData = $request->validate([
            'id' => 'required|integer|exists:users,id',
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email,' . $id,
            'password' => 'nullable|string|min:6', 
        ]);

        $user = User::find($validatedData['id']);

        // Update user details
        if ($user) {
            // Update user properties
            $user->name = $validatedData['name'];
            $user->email = $validatedData['email'];
            
            // Only update the password if it's provided
            if (isset($validatedData['password']) && !empty($validatedData['password'])) {
                $user->password = bcrypt($validatedData['password']); // Don't forget to hash the password
            }

            $user->save(); // Save the changes

            // Return a response
            return response()->json(['success' => true, 'message' => 'User updated successfully', 'user' => $user], 200);
        } else {
            return response()->json(['error' => 'User not found'], 404);
        }
    }

    public function deleteUser($id)
    {
        // Знайдіть користувача за його ідентифікатором
        $user = User::find($id);
        try {
            $user->delete();

            // Очистка кешу після видалення користувача
            Cache::forget('users_group_' . $user->group_id);

            return response()->json(['message' => 'Користувача та його записи в таблиці group_user видалено успішно']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Помилка видалення користувача'], 500);
        }
    }
}
