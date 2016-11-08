<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * PHP 5
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
 * @property AuthComponent $Auth
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * @property GoodAjaxComponent $GoodAjax
 * @property Page $Page
 * @property SessionComponent    $Session
 * @property MessengerComponent  $Messenger
 * @property CartComponent  $Cart
 * @property SimpleAuthComponent $SimpleAuth
 * @property Category $Category
 *
 */
class AppController extends Controller
{
    protected $_options;
    public $viewClass = 'TwigView.Twig';
    public $helpers = [
        'Session',
        'Html',
        'Form',
        'Number',
        'Minify.Minify',
        'Js'
    ];

    public $ajaxResponse = [
        'error' => false,
        'msg'   => null
    ];

    public $uses = [
        'Page',
        'Category'
    ];

    public $userId = null;

    public $components = [
        'Session',
        'DebugKit.Toolbar',
        'GoodAjax',
        'SimpleAuth',
        'Auth',
        'Paginator',
        'Messenger',
        'Cart',
        'RequestHandler'
    ];

    public function beforeFilter()
    {
        parent::beforeFilter();
        $this->SimpleAuth->initAuth();
        $this->_setMetaTags($this->_getCurrentPageKey());
        $this->_options = $this->_initOptions();

        $this->Cart->generateCart();
    }

    public function beforeRender()
    {
        parent::beforeRender();

        $this->set([
            'isMobile' => $this->RequestHandler->isMobile(),
            'footerMenu' => $this->_initDynamicMenu(2),
            'headerMenu' => $this->_initDynamicMenu(1),
            'options' => $this->_options,
            'categories' => $this->Category->getCategoriesList(),
            'cartItems' => count($this->Cart->getItems())
        ]);
    }

    private function _getCurrentPageKey()
    {
        $pageKey = isset($this->request->params['pageKey']) ? $this->request->params['pageKey'] : false;

        if (!$pageKey) {
            $url = explode('/', $this->request->url);
            $pageKey = $url[count($url) - 1];
        }
        return $pageKey;
    }

    private function _setMetaTags($pageKey)
    {
        $page = $this->Page->findByKey($pageKey);

        if (!empty($page['Page'])) {
            $this->set([
                'metaDesc' => $page['Page']['meta_description'],
                'metaKey' => $page['Page']['meta_keywords'],
                'metaTitle' => $page['Page']['meta_title'],
                'pageKey' => $page['Page']['key'],
                'page' => $page['Page']
            ]);
        } else {
            if (!$this->request->is('ajax') && !isset($this->request->params['pageKey'])) {
                throw new NotFoundException();
            }
        }
    }

    private function _clearOnSale(&$menu)
    {
        foreach ($menu as $index => $menuItem) {
            if ($menuItem['Menu']['url'] == '/products/sales') {
                if (ClassRegistry::init('Product')->findByOnSale(1)) {
                } else {
                    unset($menu[$index]);
                    continue;
                }
            }
            if (!empty($menuItem['children'])) {
                $this->_clearOnSale($menu[$index]['children']);
            }
        }

    }

    private function _initDynamicMenu($id)
    {
        $menu = ClassRegistry::init('Menu')->get($id, true);
        $this->_clearOnSale($menu);
        return $menu;
    }

    private function _initOptions()
    {
        $options = ClassRegistry::init('Option')->get();
        return $options;
    }

    public function flashMsg($msg, $type = 'success')
    {
        $allowed = ['success', 'error', 'info', 'warning'];
        $params['type'] = (in_array($type, $allowed)) ? $type : 'info';
        $this->Session->setFlash($msg, 'pnotify', $params);
    }

    protected function sendEmail($data)
    {
        App::uses('CakeEmail', 'Network/Email');
        $this->Email = new CakeEmail('smtp');
        $from = isset($data['from']) ? $data['from'] : 'info@' . $_SERVER['SERVER_NAME'];
        $template = isset($data['template']) ? $data['template'] : 'notification';

        $this->Email->emailFormat('html')
            ->template($template)
            ->to($data['to'])
            ->from($from)
            ->subject($data['subject'])
            ->viewVars($data['vars']);

        $this->Email->send();
        return true;
    }
    
    protected function sendPureEmail($from, $to, $subject, $template) {
        
        $headers = "From: " . strip_tags($from) . "\r\n";
        $headers .= "Reply-To: ". strip_tags($to) . "\r\n";
//        $headers .= "CC: susan@example.com\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        mail($to, $subject, $template, $headers);
    }


    public function formatErrors($errorsArray = array())
    {
        $msg = '';
        if ($errorsArray) {
            foreach ($errorsArray as $k => $v) {
                if (is_array($v)) {
                    foreach ($v as $f => $d) {
                        $msg .= $d.'<br />';
                    }
                } else {
                    $msg .= $v.'<br />';
                }

            }
        }

        return $msg;
    }

    protected function arrayValuesRecursive($arr)
    {
        $flat = array();

        foreach ($arr as $value) {
            if (is_array($value)) {
                $flat = array_merge($flat, $this->arrayValuesRecursive($value));
            } else {
                $flat[] = $value;
            }
        }
        return $flat;
    }

}