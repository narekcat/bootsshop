<?php
defined('BASEPATH') or exit('No direct access allowed');

class Pages extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'home';
        $this->load->view($this->_container, $data);
    }

    public function pageDetails($pageId)
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'page';
        $this->load->view($this->_container, $data);
    }
}
