<?php

  global $db;

  $data = $db->request_data();

  if (isset($data->params->table_id)) {
    echo json_encode(
      $db->select(
        $data->params->table_name,
        [
          "where" => "id = {$data->params->table_id}"
        ],
        $data->params->form_inputs,
      )
    );
  } else {

      $tr_values = array();$i = 0;$formatter = array();
      $columns = (array)$data->params->columns;
      $buttons = (array)$data->params->buttons;

      $count = 3;

      $totalCount = $db->dbSelect(
        tableName: $data->params->table_name, 
        conditions: ["select" => "count(*) as count"]
      );

      $pagination = \Core\Bice::pagination(
        countTotal: reset($totalCount)['count'],
        currentPage: $data->params->currentPage ?? 1,
        count: $count
      );

      $data = $db->dbSelect(
        tableName: $data->params->table_name,
        conditions: [
          "limit" => "{$count} OFFSET {$pagination['offset']}"
        ]
      );

      if (array_key_exists('table_name', $data)) {
        array_pop($data);
      }

      $data_keys[] = array_keys($data[0]);

      if ($columns) {
        $columns_keys = array_keys($columns);
      } else {
        $columns_keys = array_keys($data[0]);
        foreach ($data[0] as $key => $val) {
          $columns[$key] = $key;
        }
      }

      foreach ($columns_keys as $col_key) {
        if (strpos($col_key, '|')) {
          $explode = explode('|', $col_key);
          $formatter[$explode[0]] = $explode[1];
          $formatter_keys[$explode[0]] = $columns[$col_key];
        } else {
          $formatter[$col_key] = '';
          $formatter_keys[$col_key] = $columns[$col_key];
        }
      }

      foreach ($data as $val) {
        foreach ($formatter as $key => $value) {
          if (array_key_exists($key, $val)) {
            $tr_values[$i][$key] = "$val[$key]$formatter[$key]";
          }
        }
        if ($buttons) {
          $tr_values[$i]['buttons'] = $buttons;
        }
        $i++;
      }

      echo json_encode([
        "table_data" => $tr_values,
        "formatter" => $formatter_keys,
        "pages" => $pagination['pages']
      ]);

  };

?>