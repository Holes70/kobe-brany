<?php

  global $webController;

  try {
    $return['pages'] = $webController->getAllMemory();
    $return['currentPage'] = $webController->getCurrentPage();
    echo json_encode($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>