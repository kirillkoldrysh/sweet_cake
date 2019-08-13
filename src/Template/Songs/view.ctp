<!-- File: src/Template/Songs/view.ctp -->

<h1><?= h($song->title) ?></h1>
<pre><?= h($song->song_text) ?></pre>
<p><small>Created: <?= $song->created->format(DATE_RFC850) ?></small></p>
<p><?= $this->Html->link('Edit', ['action' => 'edit', $song->slug]) ?></p>