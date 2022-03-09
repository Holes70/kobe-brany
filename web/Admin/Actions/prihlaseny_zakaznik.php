<?php

if (isset($_SESSION['customer'])) {
  echo json_encode($_SESSION['customer']);
} else {
  echo json_encode([
    "status" => "fail",
  ]);
}