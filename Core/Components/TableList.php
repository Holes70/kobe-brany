<?php

namespace Components {

  class TableList extends \Core\Component {

    private $list = NULL;
    private $columns = NULL;

    public function __construct(private string $tableName) {
      parent::__construct($this);
    }

    public function columns(array $columns) {
      $this->columns = $columns;
      return $this;
    }

    public function show() {
      $this->list = $this->dbSelect(
        tableName: $this->tableName, 
        vueJson: TRUE,
        mergeWith: $this->columns
      );

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