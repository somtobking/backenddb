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

        $sql = "INSERT INTO shows (showName, Description) VALUES (:showName, :Description)";

        $sth = $this->db->prepare($sql);
        $sth->bindParam("showName", $input['showName']);
        $sth->bindParam("Description", $input['Description']);
        $sth->execute();
        return $this->response->withJson($input);
    });


// Update shows with a given id
    $app->put('/updateShow/[{id}]', function ($request, $response, $args) {
        $input = $request->getParsedBody();
        $sql = "UPDATE shows SET showName=:showName, Description=:Description WHERE show_id=:id";
        $sth = $this->db->prepare($sql);
        $sth->bindParam("id", $args['id']);
        $sth->bindParam("showName", $input['showName']);
        $sth->bindParam("Description", $input['Description']);

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




// ---------- crew routes ----------


    // get all crews
    $app->get('/crew', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM crew ORDER BY user_id");
        $sth->execute();
        $shows = $sth->fetchAll();
        return $this->response->withJson($shows);
    });


    // Retrieve crew by id 
    $app->get('/crew/[{id}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM crew WHERE user_id=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $shows = $sth->fetchObject();
        return $this->response->withJson($shows);
    });

    // Search for crew with a given search term
    $app->get('/crew/search/[{query}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM crew WHERE UPPER(crewName) LIKE :query ORDER BY crewName");
        $query = "%".$args['query']."%";
        $sth->bindParam("query", $query);
        $sth->execute();
        $shows = $sth->fetchAll();
        return $this->response->withJson($shows);
    });

    // adding a new crew

    $app->post('/newCrew', function ($request, $response) {
        $input = $request->getParsedBody();

        $sql = "INSERT INTO crew (crewName, crewRole, show_id, email, phone_num) 
        VALUES (:crewName, :crewRole, :show_id, :email, :phone_num)";

        $sth = $this->db->prepare($sql);
        //$sth->bindParam("user_id", $input['user_id']);
        $sth->bindParam("crewName", $input['crewName']);
        $sth->bindParam("crewRole", $input['crewRole']);
        $sth->bindParam("show_id", $input['show_id']);
        $sth->bindParam("email", $input['email']);
        $sth->bindParam("phone_num", $input['phone_num']);

        $sth->execute();
        return $this->response->withJson($input);
    });


// Update crews with a given id
    $app->put('/updateCrew/[{id}]', function ($request, $response, $args) {
        $input = $request->getParsedBody();
        $sql = "UPDATE crew SET crewName=:crewName, crewRole=:crewRole, email=:email, phone_num=:phone_num WHERE user_id=:id";
        $sth = $this->db->prepare($sql);
        $sth->bindParam("id", $args['id']);
        //$sth->bindParam("user_id", $args['user_id']);
        $sth->bindParam("crewName", $input['crewName']);
        $sth->bindParam("crewRole", $input['crewRole']);
        //$sth->bindParam("show_id", $input['show_id']);
        $sth->bindParam("email", $input['email']);
        $sth->bindParam("phone_num", $input['phone_num']);
        $sth->execute();
        $input['id'] = $args['id'];
        return $this->response->withJson($input);
    });



// DELETE a crew with given id
    $app->delete('/deleteCrew/[{id}]', function ($request, $response, $args) {

        $sth = $this->db->prepare("DELETE FROM crew WHERE user_id=:id");

        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $shows = $sth->fetchObject();
        return $this->response->withJson($shows);
    });


// ---------- cues routes ----------


      // get all cues
    $app->get('/cues', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM cues ORDER BY cue_id");
        $sth->execute();
        $shows = $sth->fetchAll();
        return $this->response->withJson($shows);
    });

 // Retrieve cues by id 
    $app->get('/cue/[{id}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM cues WHERE cue_id=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $shows = $sth->fetchObject();
        return $this->response->withJson($shows);
    });

    // Search for cues with a given search term
    $app->get('/cue/search/[{query}]', function ($request, $response, $args) {
        $sth = $this->db->prepare("SELECT * FROM cues WHERE UPPER(cueName) LIKE :query ORDER BY cueName");
        $query = "%".$args['query']."%";
        $sth->bindParam("query", $query);
        $sth->execute();
        $shows = $sth->fetchAll();
        return $this->response->withJson($shows);
    });


//adding a new cues:

    $app->post('/newCue', function ($request, $response) {
        $input = $request->getParsedBody();

        $sql = "INSERT INTO cues (show_id, cueName, cueActionCall, cueType, Called?) 
        VALUES (:show_id, :cueName, :cueActionCall, :cueType, :Called?)";

        $sth = $this->db->prepare($sql);
        //$sth->bindParam("cue_id", $input['cue_id']);
        $sth->bindParam("show_id", $input['show_id']);
        $sth->bindParam("cueName", $input['cueName']);
        $sth->bindParam("cueActionCall", $input['cueActionCall']);
        $sth->bindParam("cueType", $input['cueType']);
        $sth->bindParam("Called?", $input['Called?']);
        //$sth->bindParam("Edit", $input['Edit']);
        //$sth->bindParam("cueDelete", $input['cueDelete']);

        $sth->execute();
        return $this->response->withJson($input);
    });


// Update cues with a given id
    $app->put('/updateCue/[{id}]', function ($request, $response, $args) {
        $input = $request->getParsedBody();
        $sql = "UPDATE cues SET cueName=:cueName, cueType=:cueType, cueActionCall=:cueActionCall WHERE cue_id=:id";
        $sth = $this->db->prepare($sql);
        $sth->bindParam("id", $args['id']);
        $sth->bindParam("cueName", $input['cueName']);
        $sth->bindParam("cueType", $input['cueType']);
        $sth->bindParam("cueActionCall", $input['cueActionCall']);

        $sth->execute();
        $input['id'] = $args['id'];
        return $this->response->withJson($input);
    });



// DELETE a cue with given id
    $app->delete('/deleteCue/[{id}]', function ($request, $response, $args) {

        $sth = $this->db->prepare("DELETE FROM cues WHERE cue_id=:id");

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
