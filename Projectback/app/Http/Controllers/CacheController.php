<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class CacheController extends Controller
{
// CacheController.php

public function store(Request $request)
{
    Cache::put($request->key, $request->value, now()->addMinutes($request->minutes));
    return response()->json(['message' => 'Data stored in cache']);
}

public function get(Request $request)
{
    $data = Cache::get($request->key);
    if ($data) {
        return response()->json(['data' => $data]);
    }
    return response()->json(['message' => 'Data not found in cache'], 404);
}

public function delete(Request $request)
{
    Cache::forget($request->key);
    return response()->json(['message' => 'Data deleted from cache']);
}
}
