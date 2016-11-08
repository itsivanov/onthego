<?php
App::uses('AppModel', 'Model');
/**
 * Product Model
 *
 */
class Tiding extends AppModel
{
    public $validate = array(
        'title' => array(
            array(
                'rule' => 'notEmpty',
                'required' => true,
                'message' => 'Title cannot be empty'
            ),
            array(
                'rule' => 'isUnique',
                'required' => true,
                'message' => 'This title is already taken'
            )
        ),
        'slug' => array(
            array(
                'rule' => 'notEmpty',
                'required' => true,
                'message' => 'Seo url cannot be empty'
            ),
            array(
                'rule' => 'isUnique',
                'required' => true,
                'message' => 'This seo url is already taken'
            )
        )
    );
    public $actsAs = array('Containable');
    public $belongsTo = array('TidCategory' => array('fields' =>array('title')));
    public $hasAndBelongsToMany = array('Tag');
    public $hasMany = array(
        'TidComment' => array(
            'className' => 'TidComment',
            'conditions' => array('TidComment.active' => '1'),
            'order' => 'TidComment.created DESC'
        )
    );
    public function getActiveListNews()
    {
        $data = $this->find('all', array('conditions' => array('Tiding.active' => 1)));
        return (is_array($data) && count($data) > 0)?$data:false;

    }
    public function getListOfLastNews()
    {
        $data = $this->find('all', array('conditions' => array('Tiding.active' => 1),'limit' => 5,'order'=>array('Tiding.created'=>'DESC')));
        return (is_array($data) && count($data) > 0)?$data:false;

    }

    public function getNewsBySlug($slug)
    {
        if (!isset($slug) || empty($slug) || strlen((string)$slug) == 0 ) { return false; }
        $data = $this->find('first', array('conditions' => array('Tiding.active' => 1,'Tiding.slug' => $slug)));
        return (is_array($data) && count($data) > 0)?$data:false;
    }
}
