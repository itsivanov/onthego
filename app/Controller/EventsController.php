<?php
App::uses('AppController', 'Controller');
/**
 * Products Controller
 *
 */
class EventsController extends AppController {

    public $uses = ['Page', 'Event'];


    public function index() {
        $events = $this->Paginator->paginate('Event');

        $this->set([
            'events' => $events
        ]);
    }


    public function view() {
        $id = (int)$this->request->params['id'];

        $this->set([
            'event'   => $this->Event->findById($id),
            'banners' => $this->getBanners()
        ]);
    }

}


