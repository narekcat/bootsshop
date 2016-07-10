<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        echo "This is the index function.";
    }

    public function hello()
    {
        echo "This is the hello function.";
    }
}
