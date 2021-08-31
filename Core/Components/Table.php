<?php

namespace Components {

  class Table extends \Core\Component {
    public $con;

    public $json;

    private $table_name; 
    private $columns = array();
    private $buttons = array();
    private $class;
    private $style;
    private $columnStyle = array();
    private $rowStyle = array();
    private $formInputs;

    public function __construct($table_name) {
      parent::__construct($this);

      $this->table_name = $table_name;
    }

    public function sql() {
      return $this;
    }

    public function columns($params = array()) {
      array_push($this->columns, $params);
      $this->columns = end($this->columns);
      return $this;
    }

    public function buttons($params = array()) {
      $this->buttons = $params;
      return $this;
    }

    public function style($param) {
      $this->style = $param;
      return $this;
    }

    public function class($param) {
      $this->class = $param;
      return $this;
    }

    public function columnStyle($params = array()) {
      foreach ($params as $key => $val) {
        $this->columnStyle[$key] = $val;
      }
      return $this;
    }

    public function formInputs($params = array()) {
      $this->formInputs = array_values($params);
      return $this;
    }

    public function rowStyle($params = array()) {
      foreach ($params as $key => $val) {
        $this->rowStyle[$key] = $val;
      }
      return $this;
    }

    public function show() {
      $tr_values = array();$i = 0;$formatter = array();
      $data = $this->select($this->table_name);

      if (array_key_exists('table_name', $data)) {
        array_pop($data);
      }

      $data_keys[] = array_keys($data[0]);

      if ($this->columns) {
        $columns_keys = array_keys($this->columns);
      } else {
        $columns_keys = array_keys($data[0]);
        foreach ($data[0] as $key => $val) {
          $this->columns[$key] = $key;
        }
      }

      foreach ($columns_keys as $col_key) {
        if (strpos($col_key, '|')) {
          $explode = explode('|', $col_key);
          $formatter[$explode[0]] = $explode[1];
          $formatter_keys[$explode[0]] = $this->columns[$col_key];
        } else {
          $formatter[$col_key] = '';
          $formatter_keys[$col_key] = $this->columns[$col_key];
        }
      }

      foreach ($data as $val) {
        foreach ($formatter as $key => $value) {
          if (array_key_exists($key, $val)) {
            $tr_values[$i][$key] = "$val[$key]$formatter[$key]";
          }
        }
        if ($this->buttons) {
          $tr_values[$i]['buttons'] = $this->buttons;
        }
        $i++;
      }

      $columnsJSON = json_encode($this->columns);
      $buttonsJSON = json_encode($this->buttons);
      $formInputs = json_encode($this->formInputs);
      $columnStyle = json_encode($this->columnStyle);
      $rowStyle = json_encode($this->rowStyle);

      return "
        <dia-table
          :table_params='{
            columns: $columnsJSON,
            buttons: $buttonsJSON,
            table_name: \"{$this->table_name}\",
            style: \"{$this->style}\",
            class: \"{$this->class}\",
            formInputs: $formInputs,
            columnStyle: $columnStyle,
            rowStyle: $rowStyle
          }'
        ></dia-table>
      ";
    }

  }

}