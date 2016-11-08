<?php
App::uses('AppModel', 'Model');
App::uses('CakeSession', 'Model/Datasource');

/**
 * Category Model
 *
 */
class Category extends AppModel {

    public $recursive = -1;

    public function getCategoriesList()
    {
        return $this->find('all', [
            'order' => 'lft'
        ]);
    }

    public function getCategory($cId)
    {
        return $this->findById($cId);
    }
}