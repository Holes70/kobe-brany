<?php

  global $db;

  $data = $db->request_data();

  $db->update($data->params->tableName, $data->params);

?>