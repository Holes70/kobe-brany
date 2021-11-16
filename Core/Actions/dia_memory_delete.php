<?php

  global $webController;

  try {
    echo json_encode($webController->destroyMemory());
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>