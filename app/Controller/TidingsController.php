<?php
/**
 * Static content controller.
 *
 * This file will render views from views/pages/
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('AppController', 'Controller');
/**
 * Static content controller
 *
 * Override this controller by placing a copy in controllers directory of an application
 *
 * @package       app.Controller
 * @link http://book.cakephp.org/2.0/en/controllers/pages-controller.html
 */
define('BLOG_MAIN_PAGINATE', 10);

class TidingsController extends AppController
{

    /**
     * This controller does not use a model
     *
     * @var array
     */
    public $uses = array('Tiding', 'TidCategory','TidComment', 'Tag');
    public $components = array('RequestHandler', 'ArrayWalk', 'Paginator');
    public $helpers = array('Js' => array('Jquery'), 'Html', 'Form');
    public $paginate = array(
        'limit' => BLOG_MAIN_PAGINATE,
        'order' => array(
            'Tiding.created' => 'asc'
        )
    );

    public function beforeRender()
    {
        parent::beforeRender();
        $this->set(array(
            'last_posts' => $this->Tiding->getListOfLastNews(),
            'last_comments' => $this->TidComment->getListOfLastComments()
        ));
    }

    public function index()
    {
        $active_sort = 'last';
//        if (isset($this->request->params['pass'][0]) && $this->request->params['pass'][0] == 'old') {
//            $active_sort = 'old';
        $this->paginate = array(
            'limit' => BLOG_MAIN_PAGINATE,
            'order' => array(
                'Tiding.created' => 'DESC'
            )
        );
//        }
        $this->Paginator->settings = $this->paginate;
        $news = $this->Paginator->paginate('Tiding', array('Tiding.active' => 1));
        $this->set(array(
            'news' => $news,
            'active_sort' => $active_sort,
            'tidcategories' => $this->TidCategory->getAllActiveForNews()
        ));
        if ($this->request->is('ajax')) {
            $this->render('ajax', 'ajax'); // View, Layout
        }
    }

    public function view()
    {
        if (!isset($this->request->params['slug'])) {
            $this->redirect('/blog');
        }
        $news = $this->Tiding->getNewsBySlug($this->request->params['slug']);
        if (!$news) {
            $this->redirect('/blog');
        }
        $this->set(array(
            'news' => $this->Tiding->getNewsBySlug($this->request->params['slug']),
            'categories' => $this->TidCategory->getAllActiveForNews()
        ));

    }

    public function category()
    {
        $active_sort = 'last';
        if (isset($this->request->params['pass'][0])) {
            $tag = urldecode($this->request->params['pass'][0]);
            $category = $this->TidCategory->find('first', array(
                'conditions' => array('TidCategory.title' => $tag)
            ));
            $this->paginate = array(
                'limit' => BLOG_MAIN_PAGINATE,
                'order' => array(
                    'Tiding.created' => 'DESC')
            );
        }

        $this->Paginator->settings = $this->paginate;
        $news = $this->Paginator->paginate('Tiding', array('Tiding.active' => 1, 'tid_category_id' => $category['TidCategory']['id']));
        if (!(boolean)$news) {
            $this->redirect('/blog');
        }
        $this->set(array(
            'news' => $news,
            'active_sort' => $active_sort,
            'tidcategories' => $this->TidCategory->getAllActiveForNews(),
            'name_category' => $tag
        ));

        if ($this->request->is('ajax')) {
            $this->render('ajax', 'ajax'); // View, Layout
        } else{ $this->render('index');}
    }

    public function tag()
    {
        $active_sort = 'last';
        if (isset($this->request->params['pass'][0])) {
            $tag = urldecode($this->request->params['pass'][0]);


            $this->paginate = array(
                'limit' => BLOG_MAIN_PAGINATE,
                'conditions' => [
                    'Tiding.active' => 1
                ],
                'joins'=>array(
                    array(
                        'type'=>'inner',
                        'table'=>'tags_tidings',
                        'alias'=>'TidingTags',
                        'conditions'=>array(
                            'TidingTags.tiding_id = Tiding.id',
                        )
                    ),
                    array(
                        'type'=>'inner',
                        'table'=>'tags',
                        'alias'=>'Tags',
                        'conditions'=>array(
                            'TidingTags.tag_id = Tags.id',
                            'Tags.title'=> $tag // your criteria for tag id = 33
                        )

                    )
                ),
                'order' => array(
                    'Tiding.created' => 'DESC'
                ),
                'group' => [
                    'Tiding.id'
                ]
            );
        }

        $this->Paginator->settings = $this->paginate;
        $news = $this->Paginator->paginate('Tiding');
        if (!(boolean)$news) {
            $this->redirect('/blog');
        }
        $this->set(array(
            'news' => $news,
            'active_sort' => $active_sort,
        ));

        if ($this->request->is('ajax')) {
            $this->render('ajax', 'ajax'); // View, Layout
        } else{ $this->render('index');}
    }

    public function search()
    {

        if (!isset($this->request->query['s']) && strlen($this->request->query['s']) <= 0) {
            $this->redirect('/blog');
        }
        $tag = urldecode($this->request->query['s']);

        $this->Paginator->settings = $this->paginate;
        $news = $this->Paginator->paginate('Tiding', array('Tiding.active' => 1,
            'Tiding.title LIKE "%' . $tag . '%" or Tiding.content LIKE "%' . $tag . '%" or Tiding.full_content LIKE "%' . $tag . '%"'
        ));
        if (!(boolean)$news) {
            $this->redirect('/blog');
        }

        $this->set(array(
            'news' => $news,
            'query_s' => $tag
        ));

        if ($this->request->is('ajax')) {
            $this->render('ajax', 'ajax'); // View, Layout
        } else{ $this->render('index');}    }

    public function like($id)
    {
        if ($this->request->params['isAjax']) {
            if (!is_numeric($id)) {
                throw new NotFoundException();
            }

            if (!isset($_COOKIE['post_' . $id])) {
                $result = $this->Tiding->updateAll(
                    array('Tiding.likes' => 'Tiding.likes + 1'),
                    array('Tiding.id' => $id)
                );
                if ($result) {
                    setcookie('post_' . $id, $id);
                }

                $data = $this->Tiding->find('first', array(
                    'conditions' => array('Tiding.id' => $id),
                ));
                exit(json_encode(array(
                    'error' => false,
                    'msg_title' => 'Your like is accepted',
                    'msg' => 'Thanks',
                    'likes' => $data['Tiding']['likes']
                )));
            } else {
                exit(json_encode(array(
                    'error' => false,
                    'msg_title' => 'Your likes is do not accept',
                    'msg' => 'Thanks! But you try like this post again -_-',
                )));
            }

        } else {
            $this->redirect($this->referer());
        }
        exit;
    }

    public function add_comment(){
        $this->autoRender = false;

        $err        = false;
        $err_msg    = '';
        $validation = array();

        if($this->data != null){
            $this->TidComment->set($this->data);
            if($this->TidComment->validates()){
                if($this->TidComment->save()){
//                    $email = ClassRegistry::init('Option')->GetOptionByName('email');
//
//                    $this->Email->to 		= $email[0]['Option']['value'];
//                    $this->Email->subject 	= "You've got new comment";
//                    $this->Email->from 		= $this->data['TidComment']['email'];
//                    $this->Email->sendAs 	= 'both';
//                    $this->Email->smtpOptions = array(
//                        'port'=>'465',
//                        'timeout'=>'30',
//                        'auth' => true,
//                        'host' => 'ssl://smtp.gmail.com',
//                        'username'=>'vt.api.test@gmail.com',
//                        'password'=>'tusxvslffjlcplfa',
//                    );
//                    $this->Email->delivery = 'smtp';
//                    $this->Email->send(('<p>Dear Admin,</p>
//                    <p>You got new comment in our <a href="' . env('SERVER_NAME') . '" target="_blank">system.</a></p>
//                    <p>Subject: New comment</p>
//                    <p>Thanks and have a nice day!</p>'));
                }
                else
                {
                    $err        = true;
                    $err_msg    = 'Error! Cant`t save comment.';
                }
            }else{
                $err        = true;
                $err_msg    = 'Error! Not valid data.';
                $validate = $this->validateErrors($this->TidComment);

                foreach($validate as $key => $value)
                    $validation[$key] = $value[0];
            }
        }else{
            $err = true;
            $err_msg = 'Error! No data for processing.';
        }
        $response = array(
            'err'        => $err,
            'err_msg'    => $err_msg,
            'validation' => json_encode($validation)
        );
        return json_encode($response);
    }
}

