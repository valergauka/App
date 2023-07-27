<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Programlb extends Controller
{
    //
    function proglb(Request $request) {
        return $request->input();
    }

}
