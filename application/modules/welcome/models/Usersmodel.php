<?php

class UsersModel extends MY_Model
{
    public function __construct()
    {
        $this->tableName = 'users';
        $this->primaryKey = 'user_id';
        parent::__construct();
    }
}
