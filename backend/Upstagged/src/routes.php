<?php

use Slim\Http\Request;
use Slim\Http\Response;

// Routes
$app->get('/shows', function ($request, $response, $args)
{
   $pdo= $this->db;
   $sth = $pdo->prepare("SELECT * FROM shows");
   $sth->execute();
   $shows = $sth->fetchAll();
   return $this->response->withJson($shows);
    
});

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

