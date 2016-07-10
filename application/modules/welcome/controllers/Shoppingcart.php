<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ShoppingCart extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'shopping_cart';
        $this->load->view($this->_container, $data);
    }

    public function add()
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'shopping_cart';
        $this->load->view($this->_container, $data);
    }

    public function update()
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'shopping_cart';
        $this->load->view($this->_container, $data);
    }

    public function delete()
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'shopping_cart';
        $this->load->view($this->_container, $data);
    }
}
