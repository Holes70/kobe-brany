<?php

  global $dia, $webController;

  if (empty($_FILES['file'])) {
    var_dump($_FILES); exit();
  }

  $file_to_upload = $_FILES['file'];
  $upload_filename = $file_to_upload['name'];
  $upload_dir = $dia->config['dir']['root']."/files/products";

  $error = "";

  if (!empty($file_to_upload['error'])) {
    $error = $file_to_upload['error'];
  } else {
    ob_start();

    if (!is_dir($upload_dir)) {
      mkdir($upload_dir, 0777);
    }

    $ok = move_uploaded_file($file_to_upload['tmp_name'], $upload_dir."/".$upload_filename);

    chmod($upload_dir."/".$upload_filename, 0777);

    $error_tmp = ob_get_contents();
    ob_end_clean();

    if (!$ok) {
      $error = "Upload error: '{$upload_dir}/{$upload_filename}'.\n\nError description: $error_tmp";
    }
  }

  //$redirect = $webController->getParam("redirect");
  var_dump(json_decode(file_get_contents("php://input"), true)); exit();

  if ($error == "") {
    header ("Location: produkty");
    exit();
  } else {
    echo $error;
  }