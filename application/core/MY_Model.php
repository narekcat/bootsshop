<?php

class MY_Model extends CI_Model
{
    protected $tableName = '';
    protected $primaryKey = '';

    public function __construct()
    {
        parent::__construct();

        $this->load->database();
    }

    public function insert()
    {
        $data['created_from_ip'] = $_SERVER['REMOTE_ADDR'];
        $data['updated_from_ip'] = $_SERVER['REMOTE_ADDR'];

        $success = $this->db->insert($this->_table, $data);
        if ($success) {
            return $this->db->insertId();
        } else {
            return false;
        }
    }

    public function update($data, $where = array())
    {
        $data['date_updated'] = date('Y-m-d H:i:s');
        $data['updated_from_ip'] = $_SERVER['REMOTE_ADDR'];

        $this->db->where($where);
        return $this->db->update($this->_table, $data);
    }

    public function delete($primaryKeyValue)
    {
        $this->db->where($this->primaryKey, $primaryKeyValue);

        return $this->db->delete($this->tableName);
    }

    public function getById($primaryKeyValue, $fields = '')
    {
        $data = array();
        if ($fields != '') {
            $this->db->select($fields);
        }

        $this->db->where($this->primaryKey, $primaryKeyValue);

        $query = $this->db->get($this->tableName);

        if ($query->num_rows() > 0) {
            $data = $query->row_array();
        }
        $query->free_result();
        return $data;
    }

    public function getAll($fields = '', $where = array())
    {
        $data = array();
        if ($fields != '') {
            $this->db->select($fields);
        }

        if (count($where)) {
            $this->db->where($where);
        }

        $query = $this->db->get($this->tableName);

        if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {
                $data[] = $row;
            }
        }
        $query->free_result();

        return $data;
    }
}
