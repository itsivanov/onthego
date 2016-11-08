<?php
/**
 * Routes configuration plugin Admin
 */
Router::connect('/admin', array( 'controller' => 'admin_pages', 'plugin' => 'admin','action' => 'dashboard'));

Router::connect('/admin/pages', array( 'controller' => 'admin_pages', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/pages/:action/*', array( 'controller' => 'admin_pages', 'plugin' => 'admin'));

Router::connect('/admin/publications', array( 'controller' => 'admin_publications', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/publications/:action/*', array( 'controller' => 'admin_publications', 'plugin' => 'admin'));

Router::connect('/admin/statics/*', array( 'controller' => 'admin_statics', 'plugin' => 'admin', 'action' => 'edit'));

Router::connect('/admin/storytabs', array( 'controller' => 'admin_storytabs', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/storytabs/:action/*', array( 'controller' => 'admin_storytabs', 'plugin' => 'admin'));

Router::connect('/admin/discounts', array( 'controller' => 'admin_discounts', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/discounts/:action/*', array( 'controller' => 'admin_discounts', 'plugin' => 'admin'));

Router::connect('/admin/news', array( 'controller' => 'admin_tidings', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/news/:action/*', array( 'controller' => 'admin_tidings', 'plugin' => 'admin'));

Router::connect('/admin/tidcategory', array( 'controller' => 'admin_tid_categories', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/tidcategory/:action/*', array( 'controller' => 'admin_tid_categories', 'plugin' => 'admin'));
Router::connect('/admin/tidcategory/:action', array( 'controller' => 'admin_tid_categories', 'plugin' => 'admin'));

Router::connect('/admin/tag', array( 'controller' => 'admin_tags', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/tag/:action/*', array( 'controller' => 'admin_tags', 'plugin' => 'admin'));

Router::connect('/admin/categories', array( 'controller' => 'admin_categories', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/categories/:action/*', array( 'controller' => 'admin_categories', 'plugin' => 'admin'));

Router::connect(
    '/admin/products/:id',
    array( 'controller' => 'admin_products', 'plugin' => 'admin', 'action' => 'index'),
    array(
        'pass' => array('id'),
        'id' => '[0-9]+'
    )
);
Router::connect('/admin/products/:action/*', array( 'controller' => 'admin_products', 'plugin' => 'admin'));

Router::connect('/admin/menus', array( 'controller' => 'admin_menus', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/menus/:action/*', array( 'controller' => 'admin_menus', 'plugin' => 'admin'));




Router::connect('/admin/testimonials', array( 'controller' => 'admin_testimonials', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/testimonials/:action/*', array( 'controller' => 'admin_testimonials', 'plugin' => 'admin'));


Router::connect('/admin/companies', array( 'controller' => 'admin_companies', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/companies/:action/*', array( 'controller' => 'admin_companies', 'plugin' => 'admin'));

Router::connect('/admin/users', array( 'controller' => 'admin_users', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/users/:action/*', array( 'controller' => 'admin_users', 'plugin' => 'admin'));

Router::connect('/admin/services', array( 'controller' => 'admin_services', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/services/:action/*', array( 'controller' => 'admin_services', 'plugin' => 'admin'));

Router::connect('/admin/orders', array( 'controller' => 'admin_orders', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/orders/new', array( 'controller' => 'admin_orders', 'plugin' => 'admin', 'action' => 'newOrders'));
Router::connect('/admin/orders/:action/*', array( 'controller' => 'admin_orders', 'plugin' => 'admin'));

Router::connect('/admin/options', array( 'controller' => 'admin_options', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/options/:action/*', array( 'controller' => 'admin_options', 'plugin' => 'admin'));
Router::connect('/admin/assignments', array( 'controller' => 'admin_contacts', 'plugin' => 'admin', 'action' => 'assignments'));
Router::connect('/admin/assignments/view/*', array( 'controller' => 'admin_contacts', 'plugin' => 'admin', 'action' => 'assignmentView'));
Router::connect('/admin/assignments/delete/*', array( 'controller' => 'admin_contacts', 'plugin' => 'admin', 'action' => 'assignmentDelete'));

Router::connect('/admin/claims', array( 'controller' => 'admin_claims', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/claims/:action/*', array('controller' => 'admin_claims', 'plugin' => 'admin'));

Router::connect('/admin/contacts', array( 'controller' => 'admin_contacts', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/contacts/:action/*', array( 'controller' => 'admin_contacts', 'plugin' => 'admin'));

Router::connect('/admin/feedbacks', array( 'controller' => 'admin_feedbacks', 'plugin' => 'admin', 'action' => 'index'));
Router::connect('/admin/feedbacks/:action/*', array( 'controller' => 'admin_feedbacks', 'plugin' => 'admin'));