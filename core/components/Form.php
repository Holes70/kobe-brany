<?php

namespace Form {

  class Component extends \DB {
    public $con;

    private $table_name;
    private $inputs = array();
    private $showInputs = array();

    public function __construct($table_name) {
      global $con;
      $this->con = $con;

      $this->vue_component_loader($this);

      $this->table_name = $table_name;
    }

    public function inputs($params = array()) {
      $this->showInputs = $params;
      return $this;
    }

    public function show() {
      $inputs = $this->select($this->table_name);
      array_pop($inputs);
      $inputs_keys = array_keys($inputs[0]);

      foreach ($inputs_keys as $key => $val) {
        $inputs_fix[$val] = '';
      }

      if ($this->showInputs != NULL) {
        foreach ($this->showInputs as $key => $val) {
          $showInputs_fix[$val] = $val;
        }
      } else {
        $showInputs_fix = [0 => 'TRUE'];
      }

      $inputs_fix = json_encode($inputs_fix);
      $showInputs_fix = json_encode($showInputs_fix);

      return "
        <dia-form :form_params='{
          table_name: \"{$this->table_name}\",
          inputs: $inputs_fix,
          showInputs: $showInputs_fix
        }'></dia-form>";
    }

    public function render() {
      echo $this->show();
    }

  }

}

?>