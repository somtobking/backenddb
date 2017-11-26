<?php

use Slim\Http\Request;
use Slim\Http\Response;


// get all shows
    $app->get('/shows', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM shows ORDER BY show_id");
        $sth->execute();
        $shows = $sth->fetchAll();
        return $this->response->withJson($shows);
    });

// Retrieve shows by id 
    $app->get('/shows/[{id}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM shows WHERE show_id=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $shows = $sth->fetchObject();
        return $this->response->withJson($shows);
    });


// Search for shows with a given search term
    $app->get('/shows/search/[{query}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM shows WHERE UPPER(showName) LIKE :query ORDER BY showName");
        $query = "%".$args['query']."%";
        $sth->bindParam("query", $query);
        $sth->execute();
        $shows = $sth->fetchAll();
        return $this->response->withJson($shows);
    });

 // Add a new show

    $app->post('/newShow', function ($request, $response) {
        $input = $request->getParsedBody();

        $sql = "INSERT INTO shows (showName, Describtion) VALUES (:showName, :Describtion)";

        $sth = $this->db->prepare($sql);
        $sth->bindParam("showName", $input['showName']);
        $sth->bindParam("Describtion", $input['Describtion']);
        $sth->execute();
        return $this->response->withJson($input);
    });


// Update shows with a given id
    $app->put('/updateShow/[{id}]', function ($request, $response, $args) {
        $input = $request->getParsedBody();
        $sql = "UPDATE shows SET showName=:showName, Describtion=:Describtion WHERE show_id=:id";
        $sth = $this->db->prepare($sql);
        $sth->bindParam("id", $args['id']);
        $sth->bindParam("showName", $input['showName']);
        $sth->bindParam("Describtion", $input['Describtion']);

        $sth->execute();
        $input['id'] = $args['id'];
        return $this->response->withJson($input);
    });


 // DELETE a show with given id
    $app->delete('/deleteShow/[{id}]', function ($request, $response, $args) {

        $sth = $this->db->prepare("DELETE FROM shows WHERE show_id=:id");

        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $shows = $sth->fetchObject();
        return $this->response->withJson($shows);
    });




// Routes

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
