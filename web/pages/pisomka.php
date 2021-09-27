<?php

  $nadpis = $dia->html("
    <div style='text-align:center'>
      <h1 style='color:grey'>Písomka</h1>
    </div>
  ");

  $renderId = 3;

  $list = new Components\TableList("users");
  /*$list->columns([
    'id' => 'id',
    'name' => 'name',
    'testColumn' => [
      'onclick' => 'alert()',
      'value' => 'XXX'
    ]
  ]);*/

  $list->keyName("list");

  $xx = "<div style=\"background:red\">XXX</div>";
  $list->addColumn([
    "open" => "<button @click=\"emitComponent\" class=\"btn btn-secondary\">Emituj</button>",
    "close" => "<button onclick=\"alert()\" class=\"btn btn-warning\">EDIT</button>"
  ]);

  $list_user_test = new Components\TableList("user_tests");
  $list_user_test->conditions([
    'where' => [
      'user_id' => 1
    ]
  ]);
  $list_user_test->keyName("list_user_test");

  $dropzone = new Components\Dropzone("users");
  $dia->template("
    {$nadpis->render()}
    <h1>XXX - {{ render }}</h1>
    <button @click='forcex()'>Re-rendruj komponentu</button>
    <button @click='emitComponent' class='btn btn-secondary'>Emituj</button>
    <div class='row'>
      <div class='col-6' style='padding-left:100px;padding-right:100px'>
        <div id='test'>
          {$list->show()}
        </div>
        <div id='dropzone' style='display:none'>
          {$dropzone->show()}
        </div>
      </div>
      <div class='col-6'>
        {$list_user_test->show()}
      </div>
    </div>
  ")->render();

  $dia->setScript("
    function lol() {
      $('#test').hide();
      $('#dropzone').fadeIn();
    }

    function backToTable() {
      $('#test').fadeIn();
      $('#dropzone').hide();
    }
  ");

  $vue->setMethods("
    forcex() {
      this.componentKey += 1; 
    },
    emitComponent() {
      emitter.emit('foo', 'funkcia');
    }
  ");

  $vue->setData([
    'id' => 2,
    'xx' => 'Jozef',
    'items' => [
      'x' => 1
    ],
    'componentKey' => $renderId
  ]);
