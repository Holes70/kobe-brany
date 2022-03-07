<?php

  global $db, $webController;

  $data = (array)$db->request_data();

  try {
    $selectUserIfExists = [];
    $selectUserIfExists = $db->dbSelect(
      "customers",
      [
        "where" => [
          "email" => $data['email']
        ]
      ]
    );

    $selectUserIfExists = reset($selectUserIfExists);

    if (empty($selectUserIfExists)) {
      throw new \Exception("notExists");
    }

    if (!password_verify($data['password'], $selectUserIfExists['password'])) {
      throw new \Exception("passwordNotValid");
    }

    $_SESSION['customer'] = $selectUserIfExists;

  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>