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

    // New properties from 31.10.2021
    private array $data = [];
    private int $count = 10;
    private int $currentPage = 0;

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

    // New methods from 31.10.2021
    public function data(array $data): object {
      $this->data = $data;
      return $this;
    }

    public function count(int $count): object {
      $this->count = $count;
      return $this;
    }

    public function currentPage(int $currentPage): object {
      $this->currentPage = $currentPage;
      return $this;
    }

    public function show() {
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
            rowStyle: $rowStyle,
            data: ".json_encode($this->data).",
            count: {$this->count},
            currentPage: {$this->currentPage}
          }'
        ></dia-table>
      ";
    }

  }

}