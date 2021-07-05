<?php

  namespace Alert {

    class Component {
      private $message;

      public function __construct($message) {
        $this->message = $message;
      }

      public function show() {
        return "
          <script>
            var message = {$this->message};
            var toastHTML = \"<span>I am toast content</span><button class='btn-flat toast-action' onclick='hh()'>Undo</button>\";
            M.toast({html: toastHTML, displayLength: 1000000});
          
            function hh() {
              M.Toast.dismissAll();
            }
          </script>
        ";
      }

      public function shows() {
        return "
          <script>
            function jujky() {
              alert();
            }
          </script>
        ";
      }

      public function render() {
        echo $this->show();
      }

    }

  }