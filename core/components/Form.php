<?php

namespace Components {

  class Form extends \Core\Component {
    public $con;

    private $table_name;
    private $showInputs = NULL;
    private $requiredInputs = [];

    public function __construct($table_name) {
      global $con;
      $this->con = $con;

      $this->vue_component_loader($this);
$this->getTableStructure(); exit();
      $this->table_name = $table_name;
      $this->requiredInputs = json_encode(
        ['name', 'price']
      );
    }

    /**
     * Form inputs
     * If $params are simple array push values to indexes
     * @return $this
     */
    public function inputs($params = array()) {
      if (array_key_exists(0, $params)) {
        $this->showInputs = array_combine($params, $params);
      } else {
        $this->showInputs = $params;
      }

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
          $showInputs_fix[$key] = $val;
        }
      } else {
        $showInputs_fix = [];
      }

      $inputs_fix = json_encode($inputs_fix);
      $showInputs_fix = json_encode($showInputs_fix);

      return "
        <dia-form :form_params='{
          table_name: \"{$this->table_name}\",
          inputs: $inputs_fix,
          showInputs: $showInputs_fix,
          requiredInputs: {$this->requiredInputs}
        }'></dia-form>";
    }

    public function render() {
      echo $this->show();
    }

  }

}

?>