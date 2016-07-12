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
        $this->load->model(array('welcome/productsmodel' => 'productsModel'));
        $data['products'] = $this->productsModel->getAll();
        $data['product_categories'] = $this->productsModel->getCategories();
        $data['current_page'] = 'home';
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'home';
        $this->load->view($this->_container, $data);
    }

    public function pageDetails($pageId = 0)
    {
        $this->load->model(
            array(
                'welcome/pagesmodel' => 'pagesModel',
                'welcome/productsmodel' => 'productsModel',
            )
        );
        $pageName = $this->uri->segment(1, 0);
        $pageId = 0;
        if ($pageName == 'about-us') {
            $pageId = 1;
            $data['current_page'] = 'about-us';
        } else if ($pageId == 'delivery') {
            $pageId = 2;
            $data['current_page'] = 'delivery';
        }
        $data['product_categories'] = $this->productsModel->getCategories();
        $data['content'] = $this->pagesModel->GetById($pageId);
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'page';
        $this->load->view($this->_container, $data);
    }

    public function contactUs()
    {
        $data['current_page'] = 'contact-us';
        $data['page'] = $this->config->item('bootsshop_template_dir_welcome') . 'contact_us';
        $this->load->view($this->_container, $data);
    }
}
