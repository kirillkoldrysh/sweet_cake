<!-- File: src/Template/Song/edit.ctp -->

<h1>Edit Song</h1>
<?php
    echo $this->Form->create($song);
    echo $this->Form->control('singer_id', ['type' => 'hidden']);
    echo $this->Form->control('title');
    echo $this->Form->control('song_text', ['rows' => 10]);
    echo $this->Form->button(__('Save Song'));
    echo $this->Form->end();
?>