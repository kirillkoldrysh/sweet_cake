<!-- File: src/Template/Songs/index.ctp -->

<h1>Songs</h1>
<?= $this->Html->link('Add Song', ['action' => 'add']) ?>
<table>
    <tr>
        <th>Title</th>
        <th>Created</th>
    </tr>

    <!-- Here is where we iterate our $songs query object, printing out article info -->

    <?php foreach ($songs as $song) : ?>
    <tr>
        <td>
            <?= $this->Html->link($song->title, ['action' => 'view', $song->slug]) ?>
        </td>
        <td>
            <?= $song->created->format(DATE_RFC850) ?>
        </td>
    </tr>
    <?php endforeach; ?>
</table>