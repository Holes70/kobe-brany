<?php

  global $db, $webController;

  $data = $db->request_data();

  $totalCount = $db->dbSelect(
    tableName: $data->params->tableName, 
    conditions: [
      "select" => "count(*) as count",
      "whereArray" => [
        ["type", "=", 1]
      ]
    ]
  );

  /*$totalCount = $db->dbSelect(
    tableName: $data->params->tableName, 
    conditions: [
      "select" => "count(*) as count",
      "whereArray" => [
        ["type", "=", 1]
      ]
    ]
  );*/

  $pagination = \Core\Bice::pagination(
    countTotal: reset($totalCount)['count'],
    currentPage: $data->params->conditions->currentPage ?? 1,
    count: 15
  );

  $conditions = array_merge(
    ["limit" => "15 OFFSET {$pagination['offset']}"],
    (array)$data->params->conditions ?? [],
  );

  try {
    $return['data'] = $db->dbSelect(
      tableName: $data->params->tableName,
      conditions: $conditions
    );
    $return['pages'] = $pagination['pages'];

    $webController->getJson($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>