<?php

class ProductsModel extends MY_Model
{
    public function __construct()
    {
        $this->tableName = 'products';
        $this->primaryKey = 'product_id';
        parent::__construct();
    }

    public function getById($primaryKeyValue, $fields = '')
    {
        $fieldsHack = '*,(SELECT brand_description FROM product_brands pb WHERE pb.brand_id = products.product_brand_id) brand_name';
        return parent::getById($primaryKeyValue, $fieldsHack);
    }

    public function getAll($fields = '', $where = array())
    {
        $fieldsHack = '*,(SELECT image_path FROM product_images pi WHERE pi.featured = 1 AND pi.product_id = products.product_id) featured_image';
        return parent::getAll($fieldsHack, $where);
    }

    public function getFeaturedImage($productId)
    {
        $this->db->where(array(
            'product_id' => $productId,
            'featured' => '1'
        ));
        $query = $this->db->get('product_images');

        if ($query->num_rows() > 0) {
            $data = $query->row_array();
        }
        $query->free_result();
        return $data;
    }

    public function getCategories()
    {
        $query = $this->db->get('product_categories');

        if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {
                $data[] = $row;
            }
        }
        $query->free_result();

        return $data;
    }

    public function getProductImages($productId)
    {
        $this->db->where(array(
            'product_id' => $productId,
        ));
        $query = $this->db->get('product_images');

        if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {
                $data[] = $row;
            }
        }
        $query->free_result();

        return $data;
    }
}
