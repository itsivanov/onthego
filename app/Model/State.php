<?php
App::uses('AppModel', 'Model');

class State extends AppModel
{
    public function getStateCode($state)
    {
        $state = $this->find('first', array(
            'conditions' => array(
                'State.name' => $state,
            ),
        ));

        return $state ? $state['State']['initials'] : false;
    }
}
