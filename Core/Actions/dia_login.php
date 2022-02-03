<?php

  global $db, $userController, $webController;

  $data = $webController->getPostParams();

  try {
    $selectUserIfExists = [];
    $selectUserIfExists = $db->dbSelect(
      $data['tableName'],
      [
        "where" => [
          "email" => $data['email']
        ]
      ]
    );

    $selectUserIfExists = reset($selectUserIfExists);

    if (empty($selectUserIfExists)) {
      throw new \Exception("User doesnt exists");
    }

    if (!password_verify($data['password'], $selectUserIfExists['password'])) {
      throw new \Exception("Password not valid");
    }

    $userController->setUser($selectUserIfExists);
    $userController->setLogged();

    $webController->redirect("profile");
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>