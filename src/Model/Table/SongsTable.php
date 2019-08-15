<?php
// src/Model/Table/SongsTable.php
namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Utility\Text;
use Cake\Validation\Validator;

class SongsTable extends Table
{
    public function initialize(array $config)
    {
        $this->addBehavior('Timestamp');
    }

    public function beforeSave($event, $entity, $options)
    {
        if ($entity->isNew() && !$entity->slug) {
            $sluggedTitle = Text::slug(strtolower($entity->title));
            // trim slug to maximum length defined in schema
            $entity->slug = substr($sluggedTitle, 0, 191);
        }
    }

    /**
     * method tells CakePHP how to validate data
     * when the save() method is called.
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->allowEmptyString('title', false)
            ->minLength('title', 10)
            ->maxLength('title', 255)

            ->allowEmptyString('song_text', false)
            ->minLength('song_text', 10);

        return $validator;
    }
}