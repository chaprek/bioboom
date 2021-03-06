<?php 
class ControllerAccountWaitList extends Controller {
	public function index() {
    	if (!$this->customer->isLogged()) {
	  		$this->redirect($this->url->link('account/login', '', 'SSL')); 
    	}    	
		
		$this->language->load('account/waitlist');
        
		$this->load->model('account/waitlist');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
        $list = $this->model_account_waitlist->getAllProduct();
        
        $list_products = array();
        
        foreach($list as $li){
            $list_products[] = $li['product_id'];
        }
                
		if (!isset($this->session->data['waitlist'])) {
			$this->session->data['waitlist'] = array();
		}
		
		if (isset($this->request->get['remove'])) {
			$key = array_search($this->request->get['remove'], $list_products);
			
			if ($key !== false) {
				 $this->model_account_waitlist->deleteProduct($this->request->get['remove']);
			}
		
			$this->session->data['success'] = $this->language->get('text_remove');
		
			$this->redirect($this->url->link('account/waitlist'));
		}
						
		$this->document->setTitle($this->language->get('heading_title'));	
      	
		$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/wishlist'),
        	'separator' => $this->language->get('text_separator')
      	);
								
		$this->data['heading_title'] = $this->language->get('heading_title');	
		
		$this->data['text_empty'] = $this->language->get('text_empty');
     	
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_stock'] = $this->language->get('column_stock');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
							
		$this->data['products'] = array();
	
		foreach ($list_products as $key => $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) { 
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_wishlist_width'), $this->config->get('config_image_wishlist_height'));
				} else {
					$image = false;
				}

				if ($product_info['quantity'] <= 0) {
					$stock = $product_info['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $product_info['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}
							
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
																			
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'      => $image,
					'name'       => $product_info['name'],
					'model'      => $product_info['model'],
					'stock'      => $stock,
					'price'      => $price,	
                    'quantity'   => $product_info['quantity'],	
					'special'    => $special,
					'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'remove'     => $this->url->link('account/waitlist', 'remove=' . $product_info['product_id'])
				);
			}
		}	

		$this->data['continue'] = $this->url->link('account/account', '', 'SSL');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/waitlist.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/waitlist.tpl';
		} else {
			$this->template = 'default/template/account/waitlist.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
							
		$this->response->setOutput($this->render());		
	}
	
	public function add() {
		$this->language->load('account/wishlist');
		
		$json = array();

	//	if (!isset($this->session->data['wishlist'])) {
//			$this->session->data['wishlist'] = array();
//		}
				
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
        
        
        
		
		$this->load->model('catalog/product');
		$this->load->model('account/waitlist');
		        
        $list = $this->model_account_waitlist->getAllProduct();
        
        $list_products = array();
        
        foreach($list as $li){
            $list_products[] = $li['product_id'];
        }
        
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {
			if (!in_array($this->request->post['product_id'], $list_products)) {	
				$this->model_account_waitlist->addProduct($product_id);
			}
			 
			if ($this->customer->isLogged()) {			
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));				
			} else {
				$json['success'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));				
			}
			
			$json['total'] = sprintf($this->language->get('text_wishlist'), (isset($list_products) ? count($list_products) : 0));
		}	
		
		$this->response->setOutput(json_encode($json));
	}	
    
    public function addLogout() {
		$this->language->load('account/wishlist');
		
		$json = array();

        $json['error'] = false;
        $json['name'] = '';
        $json['email'] = '';

        if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 32)) {
			$json['name'] = 'Неверное имя';
            $json['error'] = true;
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !$this->ocstore->validate($this->request->post['email'])) {
			$json['email'] = 'Неверный email';
            $json['error'] = true;
		}

        
        $this->load->model('catalog/product');
		$this->load->model('account/waitlist');
		    
        $this->model_account_waitlist->addProductLogout($this->request->post['product_id'], $this->request->post['name'], $this->request->post['email']);
               
		$product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);
		
		if ($product_info && !$json['error']) {
					 		
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));				
		
		} 	
		
		$this->response->setOutput(json_encode($json));
	}
}
?>