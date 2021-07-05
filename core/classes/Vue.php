<?php

  class Vue extends Dia{

    public function __construct() {

    }

    //KOMPONENTY

    // TABLE
    public function table($params = array()) {
      extract($params); $tr_values = array();$i = 0;$formatter = array();

      if (array_key_exists('table_name', $data)) {
       $table_name = array_pop($data);     
      }

      if (!isset($style)) $style = '';
      if (!isset($class)) $class = '';

      if (isset($columns) && isset($data)) {
        $columns_keys = array_keys($columns); // Indexi z columns
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
          if (isset($buttons)) {
            $tr_values[$i]['buttons'] = $buttons;
          }
          $i++;
        }

        $json = json_encode($tr_values);
        $json_formatter = json_encode($formatter_keys);

        $html = "
          <vue-table
            :table_params='{
              table_data: $json,
              table_name: \"$table_name\",
              formatter: $json_formatter,
              style: \"$style\",
              class: \"$class\"
            }'
          ></vue-table>
        ";

        return $html;
      }
    }

    //ALERT
    public function alert($params = array()) {
      extract($params);

      if(!isset($type)) $type = 'alert-primary';
      else $type = "alert-$type";
      if(!isset($class)) $class = '';
      if(!isset($style)) $style = '';
      if(!isset($text)) $text = '';
      if(!isset($title)) $title = '';
      if(!isset($timer)) $timer = 0;

      $html = "
        <vue-alert
          :alert_params = '{
            type: \"$type\",
            class: \"$class\",
            style: \"$style\",
            text: \"$text\",
            title: \"$title\",
            timer: $timer
          }'
        ></vue-alert>
      ";

      return $html;
    }

    //BUTTON
    public function button($params = array()) {
      extract($params);

      if(isset($type) && (!isset($class)) && $type == 'delete') $class = "btn btn-danger";
      if(isset($type) && (!isset($class)) && $type == 'submit') $class = "btn btn-primary";

      if(!isset($name)) $name = "undefined";
      if(!isset($id)) $id = 0;
      if(!isset($action)) $action = "";
      if(!isset($style)) $style = "";
      if(!isset($class)) $class = "";
      if(!isset($type)) $type = "submit";

      
      return $html;
    }
  }