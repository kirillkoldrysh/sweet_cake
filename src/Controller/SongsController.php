<?php
// src/Controller/SongsController.php

namespace App\Controller;

class SongsController extends AppController
{
    public function initialize()
    {
        parent::initialize();

        $this->loadComponent('Paginator');

        // FlashComponent provides a way to set one-time 
        // notification messages to be displayed after 
        // processing a form or acknowledging data
        $this->loadComponent('Flash');
    }

    public function index()
    {
        $songs = $this->Paginator->paginate($this->Songs->find());
        $this->set(compact('songs'));
    }

    public function view($slug = null)
    {
        $song = $this->Songs->findBySlug($slug)->firstOrFail();
        $this->set(compact('song'));
    }

    public function add()
    {
        $song = $this->Songs->newEntity();
    }
}