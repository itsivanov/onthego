<?php
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/View/Pages/home.ctp)...
 */
    Router::parseExtensions('html', 'php', 'rss', 'pdf');
    Router::connect('/thumbs/*', array('plugin' => 'thumbs', 'controller' => 'thumbs', 'action' => 'index'));

	Router::connect('/', array('controller' => 'pages', 'action' => 'home', 'pageKey' => 'home'));

/**
 * Products On The Go
 * Pages
 */
    Router::connect('/support', array('controller' => 'pages', 'action' => 'support', 'pageKey' => 'support'));
    Router::connect('/contact-us', array('controller' => 'pages', 'action' => 'contact', 'pageKey' => 'contact'));
    Router::connect('/about', array('controller' => 'pages', 'action' => 'about', 'pageKey' => 'about'));
    Router::connect('/our-story', array('controller' => 'pages', 'action' => 'story', 'pageKey' => 'our-story'));

    Router::connect('/blog/category/*', array('controller' => 'tidings', 'action' => 'category', 'pageKey' => 'blog'));
    Router::connect('/blog/tag/*', array('controller' => 'tidings', 'action' => 'tag', 'pageKey' => 'blog'));
    Router::connect('/blog/search/*', array('controller' => 'tidings', 'action' => 'search', 'pageKey' => 'blog'));
    Router::connect('/blog/like/*', array('controller' => 'tidings', 'action' => 'like', 'pageKey' => 'blog'));
    Router::connect('/blog', array('controller' => 'tidings', 'action' => 'index', 'pageKey' => 'blog'));
    Router::connect('/blog/*', array('controller' => 'tidings', 'action' => 'index', 'pageKey' => 'blog'));
    Router::connect('/one-post/:slug', array('controller' => 'tidings', 'action' => 'view', 'pageKey' => 'blog'));

    Router::connect(
        '/products/:id/*',
        array( 'controller' => 'products', 'action' => 'index', 'pageKey' => 'products'),
        array(
            'pass' => array('id'),
            'id' => '[0-9]+'
        )
    );
    Router::connect('/product/**', array( 'controller' => 'products', 'action' => 'viewByUrl', 'pageKey' => 'products'));
    Router::connect('/products/view/*', array( 'controller' => 'products', 'action' => 'view', 'pageKey' => 'products'));
    Router::connect(
        '/products/re/:id',
        array( 'controller' => 'products', 'action' => 're', 'pageKey' => 'products'),
        array(
            'pass' => array('id'),
            'id' => '[0-9]+'
        )
        );
    Router::connect('/products/:action/*', array( 'controller' => 'products', 'pageKey' => 'products'));

/**
 * End of
 * Products On The Go
 */

    Router::connect('/users', array( 'controller' => 'users', 'pageKey' => 'users'));
    Router::connect('/users/:action/*', array( 'controller' => 'users', 'pageKey' => 'users'));


    Router::connect('/service', array('controller' => 'pages', 'action' => 'service', 'pageKey' => 'service'));
    Router::connect('/pages/:action/*', array( 'controller' => 'pages'));

    Router::connect('/min-js', array('plugin' => 'Minify', 'controller' => 'minify', 'action' => 'index', 'js'));
    Router::connect('/min-css', array('plugin' => 'Minify', 'controller' => 'minify', 'action' => 'index', 'css'));

    Router::connect('/captcha', array('controller' => 'pages', 'action' => 'captcha', 'pageKey' => 'captcha'));
/**
 * Load all plugin routes. See the CakePlugin documentation on
 * how to customize the loading of plugin routes.
 */
	CakePlugin::routes();

    Router::connect('/:pageKey', array('controller' => 'pages', 'action' => 'display'));
//    Router::connect('/:pageKey/:param', array('controller' => 'pages', 'action' => 'display'));

/**
 * Load the CakePHP default routes. Only remove this if you do not want to use
 * the built-in default routes.
 */
	require CAKE . 'Config' . DS . 'routes.php';