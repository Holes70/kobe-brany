<?php

namespace Components {

  class TableList extends \Core\Component {

    private $list = NULL;
    private $columns = [];
    private $addedColumns = [];

    public function __construct(private string $tableName) {
      parent::__construct($this);
    }

    public function columns(array $columns) {
      $this->columns = $columns;
      return $this;
    }

    public function addColumn(array $column) {
      array_push($this->addedColumns, $column);
      return $this;
    }

    public function show() {
      print_r($this->list = $this->dbSelect(
        tableName: $this->tableName, 
        vueJson: TRUE,
        mergeWith: $this->columns
      )); exit();

      return "
        <dia-table-list
          tableName={$this->tableName}
          :list=\"{$this->list}\"
          :columns=\"".$this->vueJson($this->columns)."\"
        ></dia-table-list>
      ";
    }

  }

}

?>