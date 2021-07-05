<?php

  $form_users = new Form\Component("users");
  $form_users->inputs(['first_name', 'last_name']);

  $form_products = new Form\Component("products");