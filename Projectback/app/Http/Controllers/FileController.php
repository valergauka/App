<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\File;

class FileController extends Controller
{
    public function uploadFiles(Request $request) {
        $reviewId = $request->input('reviewId'); // Отримуємо reviewId з запиту

        if ($request->hasFile('files')) {
            $uploadedFiles = $request->file('files');

            $uploadedFileData = [];
            foreach ($uploadedFiles as $file) {
                // Отримуємо ім'я файлу та шлях для збереження
                $fileName = $file->getClientOriginalName();
                $filePath = $file->store('uploads/' . $reviewId);

                // Зберігаємо інформацію про файл у базі даних
                $fileModel = new File();
                $fileModel->review_id = $reviewId;
                $fileModel->file_name = $fileName;
                $fileModel->file_path = $filePath;
                $fileModel->save();

                // Add file data to the response
                $uploadedFileData[] = [
                    'name' => $fileName,
                    'path' => $filePath,
                ];
            }

            return response()->json([
                'message' => 'Файли успішно завантажено.',
                'uploadedFiles' => $uploadedFileData,
            ]);
        } else {
            return response()->json(['error' => 'Немає файлів для завантаження.'], 400);
        }
    }

    public function destroy($id)
    {
        $file = File::find($id);
        
        if ($file) {
            // Delete the file from storage
            $filePath = storage_path('app/' . $file->file_path);
            if (file_exists($filePath)) {
                unlink($filePath);
            }

            // Delete the record from the database
            $file->delete();
            return response()->json(['message' => 'File deleted successfully'], 200);
        }

        return response()->json(['message' => 'File not found'], 404);
    }

    public function getFilesByReviewId($reviewId) {
        $files = File::where('review_id', $reviewId)->get();

        return response()->json($files);
    }
}
