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
  $xx = "<div style=\"background:red\">XXX</div>";
  $list->addColumn([
    "open" => "<button onclick=\"lol()\" class=\"btn btn-primary\">Otvor test</button>",
  ]);

  $table = new Components\Table("user_tests");

  $dia->template("
    {$nadpis->render()}
    <h1>XXX - {{ id }}</h1>
    <div class='row'>
      <div class='col-6' style='padding-left:100px;padding-right:100px'>
        <div id='test'>
          {$list->show()}
        </div>
        <div id='dropzone' style='display:none'>
          <div>
            <button onclick='backToTable()' class='btn btn-primary'>Back to table</button>
          </div>
          {$table->show()}
        </div>
      </div>
      <div class='col-6'>
        <div style='padding-left:100px;padding-right:100px'>
          <button @click='haha()' style='color:gray;font-size:40px'>Otvorte nejaky test</button>
        </div>
      </div>
    </div>
  ")->render();

  /*$dia->setScript("
    function lol() {
      $('#test').hide();
      $('#dropzone').fadeIn();
    }

    function backToTable() {
      $('#test').fadeIn();
      $('#dropzone').hide();
    }
  ");*/

 /* $dia->vueData("
    test: ''
  ");*/

  $dia->vueMethods("
    haha() {
      alert();
    }
  ");

  $dia->setVueData([
    'id' => 2,
    'xx' => 'Jozef',
    'items' => [
      'x' => 1
    ]
  ]);
