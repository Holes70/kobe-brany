<?php

  global $db;

  $db->insert_post([
    'table' => 'users',
    'redirect' => 'register'
  ]);