<?php
App::uses('AppModel', 'Model');
/**
 * ClaimsRequest Model
 *
 */
class ClaimRequest extends AppModel
{
    public $actsAs = array('Containable');

//    public $hasOne = array(
//        'ClaimantInformation' => array('dependent' => true),
//        'CoverageInformation' => array('dependent' => true),
//        'InsuredInformation'  => array('dependent' => true),
//        'ClientInformation'   => array('dependent' => true),
//        'LossInformation'     => array('dependent' => true)
//    );
}
