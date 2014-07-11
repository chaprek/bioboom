<?php  
class ControllerModuleCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['category_id'] = $parts[1];
			$this->data['child_id'] = 0;
		} else {
			$this->data['child_id'] = 0;
		}
							
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();
        
        $cats_id = (!isset($parts[1]))?$parts[0]:$parts[1];

		$categories = $this->model_catalog_category->getCategories($cats_id);

if(count($categories) > 0){
} else {
    $cats_id = $parts[0];
    $categories = $this->model_catalog_category->getCategories($cats_id);
}

		foreach ($categories as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category['category_id']));

			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

				$product_total = $this->model_catalog_product->getTotalProducts($data);

				$total += $product_total;
//. ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : '')
				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name'        => $child['name'] ,
					'href'        => "/".str_replace(HTTP_SERVER,"",$this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']))	
				);		
			}

			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,
				'href'        => "/".str_replace(HTTP_SERVER,"",$this->url->link('product/category', 'path='.((!$cats_id)?"":$cats_id."_") . $category['category_id']))
			);	
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}
		
		$this->render();
  	}

}
?>