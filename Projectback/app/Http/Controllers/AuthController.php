<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{

    public function login(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        // Спочатку перевіряємо, чи існує користувач з вказаною адресою електронної пошти
        $user = User::where('email', $email)->first();

        if (!$user) {
            // Якщо користувача з вказаною поштою не знайдено, повертаємо помилку
            return response()->json(['message' => 'Користувача з такою поштою не знайдено'], 401);
        }

        // Якщо користувач з вказаною поштою існує, перевіряємо правильність пароля
        if (Hash::check($password, $user->password)) {
            // Пароль правильний
            Auth::login($user);
            $userGroup = $user->groups;
            return response()->json(['user' => $user, 'userGroup' => $userGroup]);
        } else {
            // Пароль невірний, повертаємо помилку
            return response()->json(['message' => 'Неправильний пароль'], 401);
        }
    }

    // Метод для реєстрації
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required', // Ім'я є обов'язковим полем
            'email' => [
                'required',
                'email',
                'regex:/^[A-Za-z]\.[A-Za-z]+@chnu\.edu\.ua$/',
                'unique:users',
            ],
            'password' => 'required|min:5', // Мінімальна довжина пароля
        ], [
            'name.required' => 'Поле ім\'я є обов\'язковим',
            'email.required' => 'Поле email є обов\'язковим',
            'email.email' => 'Введіть дійсний email',
            'email.regex' => 'Email не відповідає стандарту',
            'email.unique' => 'Ця пошта вже існує в системі',
            'password.required' => 'Поле пароль є обов\'язковим',
            'password.min' => 'Мінімальна довжина пароля - 5 символів',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }


        // Створення користувача
        $user = new User();
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = Hash::make($request->input('password')); // Збереження хешованого пароля
        $user->save();

        // Приєднання користувача до групи (якщо це необхідно)
         $user->groups()->attach(1);

        // Отримання інформації про користувача та групу
        $userGroup = $user->groups->first(); // Припускається, що у вас є відповідний зв'язок у моделі User

        // Авторизація новоствореного користувача
        Auth::login($user);

        return response()->json(['user' => $user, 'userGroup' => $userGroup]);
    }

    public function userCreate(Request $request) {
        // Перевірка валідації та інші дані

        $user = new User();
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = Hash::make($request->input('password'));

        if ($user->save()) {
             // Приєднання користувача до групи за замовчуванням

            $roles = $request->input('roles'); // Отримайте вибрані ролі з запиту
            if ($roles) {
                // Приєднайте користувача до вибраних ролей
                foreach ($roles as $roleId) {
                    $user->groups()->attach($roleId);
                }
            }

            Auth::login($user);
            return response()->json(['message' => 'Користувача успішно створено', 'user' => $user]);
        } else {
            return response()->json(['message' => 'Помилка при створенні користувача'], 500);
        }
    }

    public function logout(Request $request)
    {
        // Виконайте перевірку виходу на сервері, наприклад, перевірте токен чи підтвердження
        // Якщо видаляємо сесію, зробіть це:
        Auth::logout();
        \Log::info('Сесія зберігається', ['session_id' => Session::getId()]);
        return response()->json(['message' => 'Користувач вийшов з системи']);
    }

    


}
