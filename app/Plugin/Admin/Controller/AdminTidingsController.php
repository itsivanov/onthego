<?php
App::uses('AdminAppController', 'Admin.Controller');

/**
 * Pages Controller
 * @property AdminPage $AdminPage
 */
class AdminTidingsController extends AdminAppController
{
    public $uses = array('Tiding','TidCategory','Tag','TagsTiding','TidComment');

    public $paginate = array(
        'limit' => 10,
        'order' => array(
            'Tiding.id' => 'asc'
        )
    );

    const ACTIVE = 1;
    const INACTIVE = 0;

    public function beforeFilter()
    {
        parent::beforeFilter();
    }

    public function index()
    {


        $this->set(array(
            'list' => $this->Tiding->find('all')
        ));
    }

    public function add()
    {
        $this->setActiveMenu(array('news'));
        if ($this->request->data) {
            $data = $this->request->data;
            if (isset($data['Tiding']['title']) && strlen($data['Tiding']['title']) > 0) {
                $data['Tiding']['slug'] = strtolower(Inflector::slug($data['Tiding']['title'], '-'));
            }
            if ($this->Tiding->save($data["Tiding"])) {
                $newTiding = $this->Tiding->getLastInsertId();
                if(isset($data["Tag"]) && count($data["Tag"])>0) {
                    foreach ($data["Tag"] as $tag) {
                        if(! $this->TagsTiding->find("first",array("conditions"=>array("tag_id"=>$tag["tag_id"],"tiding_id"=>$newTiding)))){
                            $this->TagsTiding->saveAll(array("tag_id"=>$tag["tag_id"],"tiding_id"=>$newTiding));
                        }
                    }
                }

                $this->setFlash(array('title' => 'News', 'msg' => 'News is created'), 'success');
                $this->redirect("/admin/news/index/");

            } else {
                $this->setFlash('News is not created', 'error');
            }
        }
        $this->set(array(
            'tidcategories' => $this->TidCategory->getAllActiveForNews(),
            'tags' => Set::extract("/Tag/.", $this->Tag->find("all")),
            'title'=> 'Add'
        ));
    }

    public function edit($id)
    {
        $this->setActiveMenu(array('news'));

        if ($this->request->data) {
            $this->Tiding->id = $id;
            $data = $this->request->data;
            if (isset($data['Tiding']['title']) && strlen($data['Tiding']['title']) > 0) {
                $data['Tiding']['slug'] = strtolower(Inflector::slug($data['Tiding']['title'], '-'));
            }

//            $this->Tiding->unbindModel(array("Tag"));
            if ($this->Tiding->save($data))
            {
                if(isset($data["Tag"]) && count($data["Tag"])>0) {
                    foreach ($data["Tag"] as $tag) {
                        if(! $this->TagsTiding->find("first",array("conditions"=>array("tag_id"=>$tag["tag_id"],"tiding_id"=>$id)))){
                            $this->TagsTiding->saveAll(array("tag_id"=>$tag["tag_id"],"tiding_id"=>$id));
                        }
                    }
                }
                $this->setFlash('News is saved', 'success');
            } else {
                $this->setFlash('News is not saved', 'error');
            }
        }
        $data = $this->Tiding->read('', $id);
        $this->request->data = $data;
        $this->set(array(
            'tidcategories' => $this->TidCategory->getAllActiveForNews(),
            'tags' => Set::extract("/Tag/.",$this->Tag->find("all")),
            'title'=> 'Edit'
        ));

        $this->render('add');
    }

    public function activate($id)
    {
        $this->Tiding->id = $id;
        $page = $this->Tiding->read('active');
        if ($page['Tiding']['active'] == self::ACTIVE) {
            $this->Tiding->saveField('active', self::INACTIVE);
            $this->setFlash('News is blocked', 'success');
        } else {
            $this->Tiding->saveField('active', self::ACTIVE);
            $this->setFlash('News is active', 'success');
        }
        $this->redirect(array('action' => 'index'));
    }

    public function delete($id)
    {
        if ($this->Tiding->delete($id)) {
            $this->setFlash('News is deleted', 'success');
        } else {
            $this->setFlash('News is not deleted', 'error');
        }
        $this->redirect(array('action' => 'index'));
    }

    public function comments($id)
    {

        $this->set(array(
            'list' => $this->TidComment->find('all',array("conditions"=>array("tiding_id"=>$id)))
        ));
//        $this->render("comments");
    }

    public function delete_comment($id)
    {
        if ($this->TidComment->delete($id)) {
            $this->setFlash('Comment is deleted', 'success');
        } else {
            $this->setFlash('Comment is not deleted', 'error');
        }

        $this->redirect($_SERVER[HTTP_REFERER]);
    }

    public function activate_comments($id)
    {
        $this->TidComment->id = $id;
        $page = $this->TidComment->read('active');
        if ($page['TidComment']['active'] == self::ACTIVE) {
            $this->TidComment->saveField('active', self::INACTIVE);
            $this->setFlash('Comment is blocked', 'success');
        } else {
            $this->TidComment->saveField('active', self::ACTIVE);
            $this->setFlash('Comment is active', 'success');
        }
        $this->redirect($_SERVER[HTTP_REFERER]);
    }

}
