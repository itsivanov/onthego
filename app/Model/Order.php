<?php
App::uses('AppModel', 'Model');
App::uses('CakeSession', 'Model/Datasource');

/**
 * Order Model
 *
 */
class Order extends AppModel {

    public $belongsTo = [
        'OrderStatus',
        'User'
    ];

    public $hasOne = [
        'OrderBillingInfo',
        'OrderShippingInfo'
    ];

    public $hasMany = [
        'OrderItem'
    ];

    public $actsAs = [
        'Containable',
        'Captcha' => [
            'field' => ['captcha'],
            'error' => 'Incorrect captcha code value'
        ]
    ];

    public $validate = [
//        'user_id' => [
//            [
//                'rule' => 'notEmpty', 'message' => 'Company name cannot be left blank'
//            ]
//        ],
        'phone' => [
            [
                'rule' => 'notEmpty', 'message' => 'Company name cannot be left blank'
            ]
        ],
        'full_name' => [
            [
                'rule' => 'notEmpty', 'message' => 'Company name cannot be left blank'
            ]
        ],
        'address' => [
            [
                'rule' => 'notEmpty', 'message' => 'Company name cannot be left blank'
            ]
        ]
    ];

    public function findListByUser($uId)
    {
        $settings = [
            'conditions' => [
                'Order.user_id' => $uId
            ],
            'recursive' => 1
        ];

        return $this->find('all', $settings);
    }

    public function countNewOrders()
    {
        $settings = [
            'conditions' => [
                'Order.order_status_id' => 1
            ]
        ];

        return $this->find('count', $settings);
    }

    public function getStatusesList()
    {
        return $this->OrderStatus->find('list', ['fields' => ['id', 'status']]);
    }

    public function getStatusesListCMS()
    {
        return $this->OrderStatus->find('list', ['fields' => ['status', 'id']]);
    }

    public function getOrdersStatistic($days = 0)
    {

    }
}
