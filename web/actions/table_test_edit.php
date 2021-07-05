<?php

  global $db;

  $db->update("products", $db->request_data());

?>