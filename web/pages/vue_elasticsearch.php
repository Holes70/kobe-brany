<?php

  $elasticSearch = new Elasticsearch\Component("logstash_test");

  // SET field which will use for search
  $elasticSearch->searchFields(['title', 'content']);