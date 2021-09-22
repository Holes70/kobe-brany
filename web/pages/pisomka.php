<?php

  $nadpis = $dia->html("
    <div style='text-align:center'>
      <h1 style='color:grey'>Písomka</h1>
    </div>
  ");

  $list = new Components\TableList("tests");
  /*$list->columns([
    'id' => 'id',
    'name' => 'name',
    'testColumn' => [
      'onclick' => 'alert()',
      'value' => 'XXX'
    ]
  ]);*/
  $list->addColumn([
    'tableColumn' => [
      'onclick' => 'alert()',
      'value' => 'XXX'
    ]
  ]);

  $dia->template("
    {$nadpis->render()}
    <div style='text-align:center'>
      <div style='padding-left: 200px;padding-right: 200px'>
        {$list->show()}
      </div>
    </div>
  ")->render();
