<?php

global $db, $userController, $webController;

$data = $db->request_data();

if ($data->params->logout === true) {
  $userController->destroyLogged();
}

echo "home";