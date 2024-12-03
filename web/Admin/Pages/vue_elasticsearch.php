<?php

  $elasticSearch = new Component\Elasticsearch("logstash_test");

  // SET field which will use for search
  $elasticSearch->searchFields(['title', 'content']);

  $elasticSearch->render();