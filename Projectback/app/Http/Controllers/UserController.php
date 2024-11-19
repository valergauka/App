<?php

namespace App\Http\Controllers;

use App\Models\Group;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Review;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function getUsersByGroupId(Request $request)
    {
        $groupId = $request->get('id'); // Отримайте ідентифікатор групи з параметра запиту

        // Знайдіть групу за ідентифікатором
        $group = Group::with('users')->find($groupId);

        if (!$group) {
            return response()->json(['error' => 'Групу не знайдено'], 404);
        }

        // Отримайте користувачів цієї групи
        $users = $group->users;

        return response()->json($users);
    }

    public function getUserGroups(Request $request)
    {
        $user = $request->input('user');
        return response()->json($user);
        // Ваш код для визначення ролі користувача, наприклад:
        $role = $this->determineUserRole($user);

        // Повернення ролі користувача
        //return response()->json(['role' => $role]);
    }

    public function getUserGroupsEdit(Request $request)
    {
        $idUser = $request->input('id');
        $user = User::findOrFail($idUser);
        $groups = $user->groups;

        return response()->json($groups);
    }

    private function determineUserRole($user)
    {
        // Отримайте список ролей користувача з таблиці group_user
        $userRoles = $user->groups->pluck('group_id')->toArray();

        // Тут ви можете визначити роль користувача на основі $userRoles
        // Наприклад, перевірте наявність певної ролі у списку
        if (in_array(1, $userRoles)) {
            return 1; // Роль користувача
        } elseif (in_array(2, $userRoles)) {
            return 2; // Роль комісії
        } elseif (in_array(3, $userRoles)) {
            return 3; // Роль адміна
        } else {
            return 0; // Роль не визначена або інша логіка
        }
    }

    public function updateRoles(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:users,id',
            'roles' => 'required|array',
            'roles.*' => 'exists:groups,id',
        ]);

        $userId = $request->input('id');
        $newRoles = $request->input('roles');

        $user = User::find($userId);

        try {
            // Видаляємо всі старі ролі користувача
            $user->groups()->detach();

            // Додаємо нові ролі
            $user->groups()->attach($newRoles);

            return response()->json(['message' => 'Ролі користувача оновлено успішно']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Не вдалося оновити ролі користувача'], 500);
        }
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
    {// Знайдіть користувача за його ідентифікатором
        $user = User::find($id);
        try {
            //$user->groups()->detach();

            // Видаліть самого користувача
            $user->delete();

            return response()->json(['message' => 'Користувача та його записи в таблиці group_user видалено успішно']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Помилка видалення користувача'], 500);
        }}




}
