<?php

  class UI extends Dia{

    public $con;

    public function __construct() {

    }

    // ZAKALDNE KOMPONENTY

    // BUTTON
    public function button($params = array()) {
      extract($params);

      if(isset($type) && (!isset($class)) && $type == 'delete') $class = "btn btn-danger";
      if(isset($type) && (!isset($class)) && $type == 'submit') $class = "btn btn-primary";

      if(!isset($name)) $name = "undefined";
      if(!isset($id)) $id = 0;
      if(!isset($action)) $action = "";
      if(!isset($style)) $style = "";
      if(!isset($class)) $class = "";
      if(!isset($type)) $type = "submit";

      if(!isset($vif)) $vif = "";
      else $vif = "v-if='$vif'";

      if ($type == "delete") {
        $html = "
          <form>
            ".$this->action($action)."
            <input type='hidden' name='id' value='$id'>
            <input type='submit' class='$class' style='$style' value='$name'>
          </form>
        ";
      } else if($type == "edit") {

      } else {
        $html = "
          <input type='submit' $vif class='$class' style='$style' value='$name'>
        ";
      }
      return $html;
    }

    // FORM
    public function form($params, $body) {
      extract($params); $attr = "";

      if(!isset($style)) $style = "";
      if(!isset($class)) $class = "";
      if(!isset($action)) $action = "NULL";

      foreach ($body as $value) {
        $attr .= $value . "";
      }

      $html = "
        <form action='index.php' class='$class' style='$style'>
          ". $this->action($action) ."
          {$attr}
        </form>
      ";

      return $html;
    }

    // INPUT
    public function input($params = array()) {
      extract($params);

      if(!isset($type)) $type = "text";
      if(!isset($name)) $name = "NULL";
      if(!isset($placeholder)) $placeholder = "";
      if(!isset($style)) $style = "";
      if(!isset($class)) $class = "";
      if(!isset($value)) $value = "";
      if(!isset($vmodel)) $vmodel = "";
      else $vmodel = "v-model='$vmodel'";

      if(isset($label)) $label = "<label>{$label}</label>";
      else $label = "";
      if(isset($description)) $description = "<small class='form-text text-muted'>{$description}</small>";
      else $description = ""; 

      $html = "
        <div class='form-group $class' style='$style'>
          {$label}
          <input type='$type' name='$name' $vmodel class='form-control' placeholder='$placeholder'>
          {$description}
        </div>
      ";

      return $html;
    }

    // ALERT
    public function alert($params = array()) {
      extract($params);

      if(!isset($type)) $type = 'primary';
      if(!isset($class)) $class = '';
      if(!isset($style)) $style = '';
      if(!isset($text)) $text = '';

      $html = "
        <div id='ui_alert'>
          <div v-show='showAlert' class='alert alert-$type $class' role='alert' style='$style'>
            {$text}
          </div>
        </div>
      ";

      return $html;
    }

    // TABLE
    public function table($params = array()) {
      extract($params); $tr_values = ""; $th = "";$i = 0;$j = 0; $formatter = array(); $replace_array = array();

      if (!isset($style)) $style = "";
      if (!isset($class)) $class = "";

      if (isset($columns) && isset($data)) {
        $table_name = array_pop($data);

        $data_keys = array_keys($data[0]); // Indexi z data
        $columns_keys = array_keys($columns); // Indexi z columns

        foreach ($columns_keys as $col_key) {
          if (strpos($col_key, '|')) {
            $explode = explode('|', $col_key);
            array_push($replace_array, $explode[0]);
            $formatter[$explode[0]] = $explode[1];
          } else {
            array_push($replace_array, $col_key);
            $formatter[$col_key] = '';
          }
        }

        foreach ($data as $value) {
         
          $tr_values .= "<tr>";

          if (is_array($value)) {
            foreach ($value as $key => $val) {
              if (array_key_exists($key, $columns) || in_array($key, $replace_array)) $tr_values .= "<td>{$val}{$formatter[$key]}</td>";

              if ($key != 'id') {
                $keys[$i] = $key;
                $i++;
              }
            }
          }

          if (isset($buttons)) {
            $tr_values .= "<td>";

            if (array_key_exists('edit', $buttons) || array_key_exists('delete', $buttons)) {
              foreach ($buttons as $button => $action) {
                  switch ($button) {
                    case 'delete':
                      $type = 'danger';
                      $icon = '🗑';
                    break;
                    case 'edit':
                      $type = 'primary';
                      $icon = '✎';
                    break;
                  }

                  $table_object = json_encode($value);
                  $tr_values .= "<button @click='tableButton(\"$button\", {$value['id']}, \"$action\", $table_object)' class='btn btn-$type ml-3'>$icon</button>";
              }
            } else {
              foreach ($buttons as $button) {
                switch ($button) {
                  case 'delete':
                    $type = 'danger';
                    $icon = '🗑';
                    $action = 'dia_delete';
                  break;
                  case 'edit':
                    $type = 'primary';
                    $icon = '✎';
                    $action = 'dia_edit';
                  break;
                }

                $table_object = json_encode($value);
                $tr_values .= "<button @click='tableButton(\"$button\", {$value['id']}, \"$action\", $table_object, \"$table_name\")' class='btn btn-$type ml-3'>$icon</button>";
            }
            }

            $tr_values .= "</td>";
          }

          $tr_values .= "</tr>";

        }

        foreach ($columns as $col) {
          $th .= "<th scope='col'>{$col}</th>";
        }

        if (isset($buttons)) $th .= "<th></th>";

        $html = "
          <div id='ui_table'>
            <table class='table table-striped $class' style='$style'>
              <thead>
                <tr>
                  {$th}
                </tr>
              </thead>
              <tbody>
                {$tr_values}
              </tbody>
            </table>
            <template v-if='showEdit == \"block\"'>
              <div class='modal' :style='{display: showEdit}'>
                <div class='modal-dialog modal-lg'>
                  <div class='modal-content'>
                    <div class='modal-header'>
                      <h5 class='modal-title'>Dia edit form</h5>
                      <button type='button' class='close' @click='showEdit = \"none\"' aria-label='Close'>
                        <span aria-hidden='true'>&times;</span>
                      </button>
                    </div>
                    <div class='modal-body'>
                      <template v-for='(value, index) in object'>
                        <input v-if='index != \"id\"' class='form-control mb-3' type='text' v-model='object[index]'></input>
                        <input v-else class='form-control mb-3' type='text' v-model='object[index]' disabled></input>
                      </template>
                    </div>
                    <div class='modal-footer'>
                      <button @click='saveObject(\"$table_name\")' type='button' class='btn btn-primary'>Uložiť</button>
                      <button class='btn btn-secondary' @click='showEdit = \"none\"'>Zavrieť</button>
                    </div>
                  </div>
                </div>
              </div>
            </template>
          </div>
        ";

        return $html;
      } else {
        return "<strong>Do komponenty TABLE boli zadané zlé vstupné údaje!</strong>";
      }
    }
  }

?>