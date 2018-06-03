<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Donator;


class donatorController extends Controller
{
    //
    public function index() {
        $donators = Donator::all();
        return view('who-give', ['donators' => $donators]);
    }
    
}
