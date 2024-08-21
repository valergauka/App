<?php

namespace App\Http\Controllers;

use App\Models\Op;
use Illuminate\Http\Request;

class OpController extends Controller
{
    public function createOp(Request $request)
    {
        $op = new Op();
        $op->branch = $request->input('branch');
        $op->speciality = $request->input('speciality');

        // Перевіряємо, чи передане значення 'specialisation'
        // Якщо значення 'specialisation' не передане, ми присвоюємо пустий рядок
        $op->specialisation = $request->input('specialisation');

        $op->op = $request->input('op');
        $op->save();
        return response()->json(['success' => true]);
    }


    public function deleteOp(Request $request)
    {
        $op = Op::findOrFail($request->get('id'));
        $op->delete();
        return response()->json(['success' => true]);
    }

}
