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

$app->get('/cues', function ($request, $response, $args)
{
   $pdo= $this->db;
   $sth = $pdo->prepare("SELECT * FROM cues");
   $sth->execute();
   $cues = $sth->fetchAll();
   return $this->response->withJson($cues);
    
});

$app->post('/addShows', function ($request, $response)
{
   $pdo= $this->db;
   $input = $request->getParsedBody();
   $sth = $pdo->prepare("INSERT INTO shows VALUES");
   $sth->execute();
   $cues = $sth->fetchAll();
   return $this->response->withJson($cues);
    
});

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

