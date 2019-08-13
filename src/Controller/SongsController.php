<?php
// src/Controller/SongsController.php

namespace App\Controller;

class SongsController extends AppController
{
    public function index()
    {
        $this->loadComponent('Paginator');
        $songs = $this->Paginator->paginate($this->Songs->find());
        $this->set(compact('songs'));
    }
}