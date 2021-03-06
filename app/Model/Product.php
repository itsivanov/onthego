<?php
App::uses('AppModel', 'Model');

/**
 * Product Model
 *
 */

class Product extends AppModel {

    public $recursive = -1;

    public $belongsTo = [
        'Category'
    ];

    public $hasMany = [
        'ProductImages' => array(
            'order' => [
                'priority' => 'asc'
            ],
        ),
        'ProductComments'
    ];

    public $hasAndBelongsToMany = [
    ];


    public function getProduct($id)
    {
        $settings = [
            'conditions' => [
                'Product.id' => $id
            ],
            'recursive' => 1
        ];

        return $this->find('first', $settings);
    }

    public function getProductByUrl($url)
    {
        $settings = [
            'conditions' => [
                'Product.url' => $url
            ],
            'recursive' => 1
        ];

        return $this->find('first', $settings);
    }

    public function getProductsByCategory($cId)
    {
        $settings = [
            'conditions' => [
                'Product.active' => true,
                'Category.id' => $cId
            ],
            'order' => [
                'Product.title' => 'asc'
            ],
            'recursive' => 0
        ];

        return $this->find('all', $settings);
    }

    public function beforeSave($options = [])
    {
        if (!empty($this->data['Product']['url'])) {
            $this->data['Product']['url'] = str_replace([' ', '//'], ['-', '/'], '/'.$this->data['Product']['url']);
        }

        if (empty($options['dontUpdateImage'])) {
            if (empty($this->data['ProductImages'])) {
                $this->data['Product']['img'] = null;
            }
            if (empty($this->data['Product']['img']) && !empty($this->data['ProductImages'])) {
                usort($this->data['ProductImages'], function ($imageA, $imageB) {
                    return ($imageA['ProductImages']['priority'] ?: 0) - ($imageB['ProductImages']['priority'] ?: 0);
                });
                $img = array_values($this->data['ProductImages'])[0];
                if (!empty($img['ProductImages']['img'])) {
                    $this->data['Product']['img'] = $img['ProductImages']['img'];
                }
            }
//        if (empty($this->data['Product']['img'])) {
//            $this->data['Product']['active'] = 0;
//        }
        }

        parent::beforeSave();
    }
}
