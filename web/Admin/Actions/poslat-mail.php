<?php

global $db;

$data = json_decode(json_encode($db->request_data()), true);

mail(
  $data["email"], 
  "Kobe-brány registrácia",
  "{%activation_link%}"
);