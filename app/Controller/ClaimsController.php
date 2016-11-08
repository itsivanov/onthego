<?php
App::uses('AppController', 'Controller');
/**
 * Claims Controller
 * @property Claim $Claim
 * @property Category $Category
 *
 */
class ClaimsController extends AppController {

    public $uses = array('Claim', 'Category', 'Service');
    public $components = array('Paginator');

    public function beforeFilter()
    {
        parent::beforeFilter();
    }

    public function view($mainServId, $parentServId = false, $categoryId = false, $partyId = false)
    {

        $conditions = array( 'main_service_id' => $mainServId );

        if ($parentServId) {
            $conditions['parent_service_id'] = $parentServId;
        }

        if ($categoryId) {
            $conditions['category_id'] = $categoryId;
        }

        if ($partyId) {
            $conditions['party_id'] = $partyId;
        }

        $this->Paginator->settings = array(
            'order'      => array( 'Claim.lft' => 'asc' ),
            'conditions' => $conditions,
            'recursive'  => -1,
            'limit'      => 12
        );

        $claims = $this->Paginator->paginate('Claim');

        $this->set(array(
            'claims'          => Set::extract('/Claim/.', $claims),
            'categoryId'      => $categoryId,
            'partyId'         => $partyId,
            'mainServiceId'   => $mainServId,
            'parentServiceId' => $parentServId,
            'categories'      => $this->Category->getAll(),
            'services'        => $this->Service->getHighLevelServices(),
            'parentServices'  => $this->Service->getParentServices($mainServId)
        ));

    }
}