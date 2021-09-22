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

  $dropzone = new Components\Dropzone("user_tests");

  $dia->template("
    {$nadpis->render()}
    <div class='row'>
      <div class='col-6'>
        <div id='test' style='padding-left:100px;padding-right:100px'>
          {$list->show()}
        </div>
      </div>
      <div class='col-6'>
        <div style='padding-left:100px;padding-right:100px'>
          <p style='color:gray;font-size:40px'>Otvorte nejaky test</p>
        </div>
      </div>
    </div>
  ")->render();

  $dia->setScript("
    function lol() {
      $('#test').hide();
    }
  ");
