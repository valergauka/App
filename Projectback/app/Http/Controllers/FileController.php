<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\File;

class FileController extends Controller
{
    public function uploadFiles(Request $request)
    {
        $uploadedFiles = [];

        if ($request->hasFile('files')) {
            foreach ($request->file('files') as $file) {
                // Збереження файлу та отримання інформації про нього
                $path = $file->store('uploads'); // Збереження файлу у вказаній директорії
                $name = $file->getClientOriginalName(); // Отримання оригінальної назви файлу

                // Збереження інформації про файл у базі даних
                $uploadedFiles[] = File::create([
                    'name' => $name,
                    'path' => $path
                ]);
            }
        }


        return response()->json($uploadedFiles);
    }
}
