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
        $this->load->model(array('welcome/productsmodel' => 'productsModel'));
        $data['products'] = $this->productsModel->getAll();
        $data['product_categories'] = $this->productsModel->getCategories();
        $data['current_page'] = 'products';
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'products';
        $this->load->view($this->_container, $data);
    }

    public function productDetails($productId)
    {
        $this->load->model(array('welcome/productsModel' => 'productsModel'));
        $data['product'] = $this->productsModel->getById($productId);
        $data['product_categories'] = $this->productsModel->getCategories();
        $data['featured_image'] = $this->productsModel->getFeaturedImage($productId);
        $data['product_images'] = $this->productsModel->getProductImages($productId);
        $data['current_page'] = 'products';
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'product_details';
        $this->load->view($this->_container, $data);
    }

    public function productCategories($categoryId)
    {
        $data['current_page'] = 'products';
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'product_details';
        $this->load_>view($this->_container, $data);
    }
}
