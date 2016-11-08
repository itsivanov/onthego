<?php
App::uses('AdminAppController', 'Admin.Controller');
/**
 *@property Product $Product
 */

class AdminProductsController extends AdminAppController
{
    public $uses = ['Product', 'Category'];

    const ACTIVE = 1;
    const INACTIVE = 0;

    public function beforeFilter()
    {
        parent::beforeFilter();
        $this->setHoverFlag('products');
        $this->setActiveMenu(array('products'));
    }

    public function index($categoryId)
    {
        $settings  = [
            'conditions' => ['Category.id' => $categoryId],
            'order' => ['position' => 'asc'],
            'recursive' => 0
        ];


        $list = $this->Product->find('all', $settings);
        $this->set('category', $this->Category->read('', $categoryId));
        $this->set('list', $list);
    }

    public function add($categoryId)
    {
        if ($this->request->data) {
            $this->request->data['Product']['category_id'] = $categoryId;
            if ($this->Product->saveAll($this->request->data)) {
                $this->setFlash('Product is created', 'success');
                $this->redirect(array('action' => 'index', $categoryId));
            } else {
                $this->setFlash('Product is not created', 'error');
            }
        } else {
            $this->request->data['Product']['category_id'] = $categoryId;
        }
        $this->set('category', $this->Category->read('', $categoryId));
        $this->render('edit');
    }

    public function edit($id)
    {
        if ($this->request->data) {
            $this->Product->id = $id;

            $this->Product->ProductImages->deleteAll(['product_id' => $id], false);

            if ($this->Product->saveAll($this->request->data)) {
                $data = $this->Product->read('', $id);
                $this->setFlash('Product is updated', 'success');
                $this->redirect(array('action' => 'index', $data['Product']['category_id']));
            } else {
                $this->setFlash('Product is not updated', 'error');
            }
        }
        $data = $this->Product->getProduct($id);//find('first', ['conditions' => ['Product.id' => $id], 'recursive' => 1]);
        $this->request->data = $data;

        $this->set('category', $this->Category->read('', $data['Product']['category_id']));
        $this->set(compact('data'));
    }

    public function delete($id)
    {
        if ($this->Product->delete($id)) {
            $this->setFlash('Product is deleted', 'success');
        } else {
            $this->setFlash('Product is not deleted', 'error');
        }

        $this->redirect($this->referer());
    }

    public function savePositions()
    {
        $this->Product->saveAll($this->request->data, ['dontUpdateImage' => true]);
        $this->redirect($this->referer());
    }

}