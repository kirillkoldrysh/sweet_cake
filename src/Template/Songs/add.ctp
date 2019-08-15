<!-- File: src/Template/Songs/add.ctp -->

<h1>Add Song</h1>
<?php
    echo $this->Form->create($song);
    // Hard code for the singer for now
    echo $this->Form->control('singer_id', ['type' => 'hidden', 'value' => 1]);
    echo $this->Form->control('title');
    echo $this->Form->control('song_text', ['rows' => 10]);
    echo $this->Form->button(__('Save Song'));
    echo $this->Form->end();
?>  