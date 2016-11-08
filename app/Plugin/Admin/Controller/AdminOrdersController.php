<?php
App::uses('AdminAppController', 'Admin.Controller');
/**
 *@property Order $Order
 */
class AdminOrdersController extends AdminAppController
{
    const ACTIVE = 1;
    const INACTIVE = 0;

    public $uses = ['UserInfo'];

    public function beforeFilter() {
        parent::beforeFilter();
        $this->setHoverFlag('orders');
        $this->setActiveMenu(array('orders'));
    }

    public function index()
    {
        $query = $this->request->query;

        $this->Order->virtualFields['fullName'] = 'CONCAT(UserInfo.first_name, " ", UserInfo.last_name)';
//        $sets = [
//            'conditions' => [
//                'or' => [
////                    'OrderStatus.status like' => '%' . $query['search'] . '%',
//                    'UserInfo.fullName like' => '%' . $query['search'] . '%',
//                ]
//            ],
//            'joins' => [
//                [
//                    'table' => 'order_statuses',
//                    'alias' => 'OrderStatus',
//                    'conditions' => [
//                        'Order.status_id' => 'OrderStatus.id'
//                    ]
//                ]
//            ],
//            'recursive' => 2,
//            'contain' => [
//                'User' => [
//                    'Order' => [
//                        'OrderStatus'
//                    ]
//                ]
//            ],
////            'group'=> 'Order.id'
//        ];

        $conditions = ['or' => []];

        if(isset($query['search'])) {
            $conditions['or'] = [
                    'Order.fullName like    ' => '%' . $query['search'] . '%',
                    'OrderStatus.status like' => '%' . $query['search'] . '%',
                ];
        }
        $settings  = [
            'limit' => isset($query['count'])?$query['count']:10,
            'order' => ['Order.id' => 'desc'],
            'fields' => [
                'User.*', 'Order.*', 'UserInfo.*', 'OrderStatus.*'
            ],
            'conditions' => $conditions,
            'joins' => [
                [
                    'table' => 'order_statuses',
                    'alias' => 'OrderStatus',
                    'type' => 'left',
                    'conditions' => [
                        'Order.order_status_id = OrderStatus.id'
                    ]
                ],
                [
                    'table' => 'users',
                    'alias' => 'User',
                    'type' => 'left',
                    'conditions' => [
                        'Order.user_id = User.id'
                    ]
                ],
                [
                    'table' => 'user_infos',
                    'alias' => 'UserInfo',
                    'type' => 'left',
                    'conditions' => [
                        'User.id = UserInfo.user_id'
                    ]
                ]
            ],
            'contain' =>[
//                'OrderBillingInfo',
//                'OrderShippingInfo',
                'OrderItem',
//                'User' => [
//                    'UserInfo' => [
//                        'first_name',
//                        'last_name'
//                    ]
//                ],
//                'OrderStatus'
            ]
        ];

        $this->Paginator->settings = $settings;

        $list = $this->Paginator->paginate('Order');
        $this->set('list', $list);
        $this->set('query', $query);
    }

    public function newOrders() {
        $query = $this->request->query;

        $this->Order->virtualFields['fullName'] = 'CONCAT(UserInfo.first_name, " ", UserInfo.last_name)';
        $this->Order->virtualFields['days'] = 'DATEDIFF(Order.created, CURRENT_TIMESTAMP())';
        $conditions = ['or' => []];

        if(isset($query['search'])) {
            $conditions['or'] = [
                'Order.fullName like    ' => '%' . $query['search'] . '%',
                'OrderStatus.status like' => '%' . $query['search'] . '%',
            ];
        }
        $conditions['and'] = [
            'Order.days >' => '-7',
            'Order.days <' => '0'
        ];

        $settings  = [
            'limit' => isset($query['count'])?$query['count']:10,
            'order' => ['Order.id' => 'desc'],
            'fields' => [
                'User.*', 'Order.*', 'UserInfo.*', 'OrderStatus.*'
            ],
            'conditions' => $conditions,
            'joins' => [
                [
                    'table' => 'order_statuses',
                    'alias' => 'OrderStatus',
                    'type' => 'left',
                    'conditions' => [
                        'Order.order_status_id = OrderStatus.id'
                    ]
                ],
                [
                    'table' => 'users',
                    'alias' => 'User',
                    'type' => 'left',
                    'conditions' => [
                        'Order.user_id = User.id'
                    ]
                ],
                [
                    'table' => 'user_infos',
                    'alias' => 'UserInfo',
                    'type' => 'left',
                    'conditions' => [
                        'User.id = UserInfo.user_id'
                    ]
                ]
            ],
            'contain' =>[
//                'OrderBillingInfo',
//                'OrderShippingInfo',
                'OrderItem',
//                'User' => [
//                    'UserInfo' => [
//                        'first_name',
//                        'last_name'
//                    ]
//                ],
//                'OrderStatus'
            ]
        ];

        $this->Paginator->settings = $settings;

        $list = $this->Paginator->paginate('Order');
        $this->set('list', $list);
        $this->set('query', $query);
        $this->render('index');
    }


    public function edit($id)
    {
        if ($this->request->data) {
            $this->Order->id = $id;

            if ($this->Order->saveAll($this->request->data)) {
                $this->setFlash('Order is updated', 'success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->setFlash('Order is not updated', 'error');
            }
        }

        $settings = [
            'conditions' => ['Order.id' => $id],
            'contain' => [
                'OrderStatus',
                'OrderBillingInfo',
                'OrderShippingInfo',
                'OrderItem' => [
                    'Product' => [
                        'fields' => [
                            'img', 'title', 'price'
                        ]
                    ]
                ],
                'User' => [
                    'fields' => [
                        'email'
                    ],
                    'UserInfo' => [
                        'first_name',
                        'last_name'
                    ]
                ],
            ]
        ];

        $data = $this->Order->find('first', $settings);
        $this->request->data = $data;
        $statuses = $this->Order->getStatusesList();

        $this->set(compact('data', 'statuses'));
    }

    public function delete($id) {
        if ($this->Order->delete($id)) {
            $this->setFlash('Order is deleted', 'success');
        } else {
            $this->setFlash('Order is not deleted', 'error');
        }

        $this->redirect($this->referer());
    }

}