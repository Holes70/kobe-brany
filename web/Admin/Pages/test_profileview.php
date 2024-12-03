<?php

$profileView = new Component\ProfileView("users");
$profileView->conditions([
  'select' => 'CONCAT(first_name, \" \", last_name) as name, email as description, phone_number as description2',
]);
$profileView->render();