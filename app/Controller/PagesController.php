<?php

App::uses('AppController', 'Controller');
/**
 * Pages Controller
 *
 * @property Publication $Publication
 * @property Static $Static
 * @property Contact $Contact
 * @property Storytab $Storytab
 *
 */
class PagesController extends AppController {

    public $components = [
        'Email',
        'Messenger',
        'Captcha'
    ];

    public $uses = [
        'Category',
        'Contact',
        'Subscriber'
    ];

    public function beforeFilter()
    {
        parent::beforeFilter();
    }

    public function home()
    {
        $this->loadModel('Static');
        $this->loadModel('Category');

        $this->set([
            'about' => $this->Static->findById('about-home'),
            'categories' => $this->Category->getCategoriesList()
        ]);
    }

    public function display()
    {
//        $this->redirect('/admin');
    }

    public function about()
    {
        $this->loadModel('Publication');
        $this->loadModel('Static');

        $this->set([
            'publications' => $this->Publication->find('all'),
            'about' => $this->Static->findById('about-founder')
        ]);
    }

    public function story()
    {
        $this->loadModel('Storytab');
        $this->loadModel('Static');

        $this->set([
            'storytabs' => $this->Storytab->find('all'),
            'video' => $this->Static->findById('story-video')
        ]);
    }

    public function support()
    {

    }

    public function contact()
    {
        if ($this->request->is('post')) {
            if ($this->Contact->save($this->request->data)) {
                $this->request->data['Contact'] = '';
                $this->flashMsg('Thank you for contacting', 'info');
            }
        }
    }


    public function captcha()
    {
        $this->autoRender = false;
        $this->layout='ajax';
        if(!isset($this->Captcha)){
            $this->Captcha = $this->Components->load('Captcha', array(
                'font' => $_SERVER['DOCUMENT_ROOT'].'/app/webroot/sanchez.ttf',
                'width' => 100,
                'height' => 38,
                'characters' => 6,
                'theme' => 'random',
            ));
        }
        $this->Captcha->create();
    }

}