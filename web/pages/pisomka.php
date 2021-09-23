<?php

  $nadpis = $dia->html("
    <div style='text-align:center'>
      <h1 style='color:grey'>Písomka</h1>
    </div>
  ");

  $list = new Components\TableList("users");
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

  $list_user_test = new Components\TableList("user_tests");
  $list_user_test->conditions([
    'where' => [
      'user_id' => 1
    ]
  ]);

  $dia->template("
    {$nadpis->render()}
    <h1>XXX - {{ id }}</h1>
    <div class='row'>
      <div class='col-6' style='padding-left:100px;padding-right:100px'>
        <div id='test'>
          {$list->show()}
        </div>
      </div>
      <div class='col-6'>
        {$list_user_test->show()}
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

  $vue->setMethods("
    haha() {
      alert(2);
    }
  ");

  $vue->setData([
    'id' => 2,
    'xx' => 'Jozef',
    'items' => [
      'x' => 1
    ]
  ]);
