<?php

$count = 2;

$totalCount = $db->dbSelect(
  tableName: "products", 
  conditions: ["select" => "count(*) as count"]
);

$pagination = \Core\Bice::pagination(
  countTotal: reset($totalCount)['count'],
  currentPage: 2 ?? 1,
  count: $count
);

$data = $db->dbSelect(
  tableName: "products",
  conditions: [
    "limit" => "{$count} OFFSET {$pagination['offset']}"
  ]
);

var_dump($data);