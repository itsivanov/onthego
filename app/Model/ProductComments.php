<?php

class ProductComments extends AppModel {

    public $name = 'ProductComments';

//    public $actsAs = [
//        'Captcha' => [
//            'field' => ['captcha'],
//            'error' => 'Incorrect captcha code value'
//        ]
//    ];

    public $validate = [
        'name' => [
            [
                'rule' => 'notEmpty',
                'required' => true,
                'message' => 'Name cannot be left blank',
            ],
            ['rule' => '/^(\w*)\s?(\w*)?+$/', 'message' => 'This Name has incorrect format!'],
        ],
        'email' => [
            [
                'rule' => 'notEmpty',
                'message' => 'This field cannot be left blank'
            ],
            [
                'rule' => 'email',
                'message' => 'Please enter a valid email address'
            ]
        ],
        'text' => [
            'rule' => 'notEmpty',
            'required' => true,
            'message' => 'Message cannot be left blank',
        ]
    ];

    public function afterSave($created, $saveOptions = []){
        try {
            $options = ClassRegistry::init('Option')->get();
            $from = empty($options['email'])? 'info@products-onthego.com' : $options['email'];
            $bcc = [];
            $to = '';
            if ($options['notify-to']) {
                $bcc = explode(',', $options['notify-to']);
                while (empty($to) && !empty($bcc)) {
                    $to = array_shift($bcc);
                }
            }
            if (!empty($to)) {
                $email = new CakeEmail();
                $email->from([$from => 'Products On The Go Message']);
                $email->to($to);
                $email->subject('New message on Products On The Go');
                if (!empty($bcc)) {
                    $email->bcc($bcc);
                }
                $email->send("Full name: {$this->data['Contact']['first_name']}\r\n"
                    . "Email: {$this->data['Contact']['email']}\r\n"
                    . "Phone: {$this->data['Contact']['phone']}\r\n"
                    . "Comment: {$this->data['Contact']['msg']}\r\n"
                );
            }
        } catch (Exception $e){

        }
    }
}

?>