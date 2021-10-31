<?php

  $totalCount = $db->dbSelect(tableName: "products", conditions: ["select" => "count(*) as count"]);

  var_dump(\Core\Bice::pagination(countTotal: reset($totalCount)['count'])); exit();