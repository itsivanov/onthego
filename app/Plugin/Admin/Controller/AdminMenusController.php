<?php

/**
 * @property Menu $Menu
 * @property SiteMenu $SiteMenu
 * @property Page $Page
 */

class AdminMenusController extends AdminAppController {

    public $name = 'AdminMenus';

    public $uses = array('SiteMenu', 'Menu', 'Page');

    public $helpers = array('Admin.ExtTree');

    public function beforeRender() {
        $this->setHoverFlag('menus');
        $this->setActiveMenu(['menus']);
    }

    public function index() {
        $this->setActiveMenu(array('menus'));
        $this->set('menus', $this->SiteMenu->find('all', array('conditions' => array('active' => 1))));
    }

    public function edit($id = null) {
        $this->setActiveMenu(array('menus'));
    }

    public function menu($id)
    {
        $this->setActiveMenu(array('menus'));

        $menuName = $this->SiteMenu->read("name", $id);

        $this->set('menu_id', $id);
        $this->set("menuName", $menuName['SiteMenu']['name']);
        //$this->set('static_pages', $this->Page->getAllActivePages());
        $menus = $this->Menu->get($id, false, true);
        $this->set('menu', $menus);
    }

    public function add_item($id = null) {
        if($this->request->data) {
            if($menu_id = $this->Menu->SaveMenuItem($this->request->data)) {
                $this->request->data = null;
                $this->setFlash('Item successfully added', 'success');
                $this->redirect('menu/'.$menu_id);
            }
        }
        $this->setActiveMenu(array('menus'));

        $this->set('action', 'add');
        $pages = array();
        foreach ($this->Page->getAllActivePages() as $key => $val) {
            $pages['/'.$key] = $val;
        }
        $this->set('pages', $pages);
        $this->set('menu_id', $id);

        $this->render('edit_item');
    }

    public function edit_item($id = null, $item_id = null) {
        if($this->request->data) {
            if($id = $this->Menu->SaveMenuItem($this->request->data)) {
                $this->request->data = null;
                $this->setFlash('Item successfully edited', 'success');
                $this->redirect('menu/'.$id);
            }
        }

        $pages = [];
        foreach ($this->Page->getAllActivePages() as $key => $val) {
            $pages['/'.$key] = $val;
        }
        $this->set('pages', $pages);
        $this->request->data = $this->Menu->read(null, $item_id);

        $this->set('menu_id', $id);
        $this->render('edit_item');
    }

    public function delete_item($id = null, $item_id = null) {

    }

}