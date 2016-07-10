<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Products extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['page'] = $this->config->item('bootsshop_tamplate_dir_welcome') . 'products';
        $this->load->view($this->_container, $data);
    }

    public function productDetails($productId)
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'product_details';
        $this->load->view($this->_container, $data);
    }

    public function productCategories($categoryId)
    {
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'product_details';
        $this->load_>view($this->_container, $data);
    }
}
