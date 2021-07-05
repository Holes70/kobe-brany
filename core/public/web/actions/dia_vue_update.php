<?php

  global $db;

  $data = $db->request_data();

  $db->update($data->params->table_name, $data->params);

?>