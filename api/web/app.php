<?php

use Symfony\Component\HttpFoundation\Request;

require __DIR__.'/../vendor/autoload.php';

$env = getenv('SYMFONY_ENV') ?: 'prod';
$debug = 'prod' !== $env;

$kernel = new MicroKernel($env, $debug);
if (!$debug) {
    $kernel->loadClassCache();
}

$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();

$kernel->terminate($request, $response);
