<?php

  $elasticSearch = new Components\Elasticsearch("logstash_test");

  // SET field which will use for search
  $elasticSearch->searchFields(['title', 'content']);