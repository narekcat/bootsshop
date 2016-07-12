<?php

class PagesModel extends MY_Model
{
    public function __construct()
    {
        $this->tableName = 'pages';
        $this->primaryKey = 'page_id';
        parent::__construct();
    }
}
