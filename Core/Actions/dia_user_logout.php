<?php

global $db, $userController;

$data = $db->request_data();

if ($data->params->logout === true) {
  $userController->destroyLogged();
}

echo "home";