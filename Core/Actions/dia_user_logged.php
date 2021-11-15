<?php

  global $db, $userController;

  $data = $db->request_data();

  try {
    echo json_encode($userController->getLogged());
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

 /* try {
    echo json_encode($db->dbSelect(
      $data->params->tableName,
      (array)$data->params->conditions
    ));
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }*/

?>