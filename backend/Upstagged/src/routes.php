<?php

use Slim\Http\Request;
use Slim\Http\Response;

// Routes
$app->get('/shows', function ($request, $response, $args)
{
   $PDO = $this->db;
   $query = $PDO->prepare("SELECT * FROM shows");
   $query->execute();
   $shows = $PDO->fetchAll();
   return $this->response->withJson($shows);
    
});

// $app->get('/shows', function ($request, $response, $args) {
//    $sth = $this->db->prepare("SELECT * FROM shows");
//    $sth->execute();
//    $shows = $sth->fetchAll();
//    return $this->response->withJson($shows);
// });

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

