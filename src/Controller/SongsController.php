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
        if ($this->request->is('post')) {
            
            $song = $this->Songs->patchEntity($song, $this->request->getData());

            // Hardcoding the singer_id is temporary, and will be removed later
            // when we build authentication out.
            $song->singer_id = 1;

            if ($this->Songs->save($song)) {
                $this->Flash->success(__('The song has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('Unable to add the song.'));
        }
        $this->set('song', $song);
    }
}