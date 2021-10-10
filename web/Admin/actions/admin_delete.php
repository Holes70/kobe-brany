<?php

  global $db;

  $data = json_decode(file_get_contents("php://input"));

  $db->delete("products", ['id' => $data->id]);

?>