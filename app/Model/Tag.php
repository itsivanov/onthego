<?php
App::uses('AppModel', 'Model');

class Tag extends AppModel
{
    public $actsAs = array('Containable');
    public $hasAndBelongsToMany = array('Tiding');
    public $validate = array(
        'title' => array(
            array(
                'rule' => 'notEmpty',
                'required' => true,
                'message' => 'Title cannot be empty',
                'on'=>'create'
            )
        )
    );

    public function getAllActiveForNews()
    {
        $data = Set::extract('/'.$this->name.'/.', $this->find('all', array('conditions' => array('active' => 1),
            'fields' => array('id','title'))));
        return is_array($data) && count($data) >0?$data:false;
    }
}
