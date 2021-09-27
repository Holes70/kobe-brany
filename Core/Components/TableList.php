<?php

namespace Components {

  class TableList extends \Core\Component {

    private $list = NULL;
    private array $columns = [];
    private array $addedColumns = [];
    private array $conditions = [];
    private string $keyName;

    public function __construct(private string $tableName) {
      parent::__construct($this);
    }

    public function columns(array $columns) : object {
      $this->columns = $columns;
      return $this;
    }

    public function addColumn(array $column) : object {

      if (empty($this->addedColumns)) {
        $this->addedColumns = $column;
      } else {
        array_push($this->addedColumns, $column);
      }
      return $this;

    }

    public function conditions(array $conditions) : object {
      $this->conditions = $conditions;
      return $this;
    }

    public function keyName(string $keyName) : object {
      $this->keyName = $keyName;
      return $this;
    }

    public function show() : string {

      $this->list = $this->dbSelect(
        tableName: $this->tableName, 
        conditions: $this->conditions,
        vueJson: TRUE,
        mergeWith: $this->addedColumns
      );

      return "
        <dia-table-list
          tableName={$this->tableName}
          :list=\"{$this->list}\"
          :columns=\"".$this->vueJson($this->columns)."\"
          :key=\"{$this->keyName}\"
        ></dia-table-list>
      ";
    }

  }

}

?>