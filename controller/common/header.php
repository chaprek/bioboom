<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {

	if (isset($GLOBALS["pagin_next"])) {
	$this->data['pagin_next']=$GLOBALS["pagin_next"];
	}
	if (isset($GLOBALS["pagin_prev"])) {
	$this->data['pagin_prev']=$GLOBALS["pagin_prev"];
	}
	$this->data['canonical']=false;
		if (isset($this->request->get['path']) && (isset($this->request->get['filter']) || isset($this->request->get['sort']) || isset($this->request->get['limit']) || isset($this->request->get['order']))) {
				$this->data['canonical']=true;
				
				$path = (string)$this->request->get['path'];
				$this->data['can_url']=$this->url->link('product/category', 'path='.$path);
		}
		
		
		$this->data['title'] = $this->document->getTitle();
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}
        
        if (isset($this->request->server['REQUEST_URI'])) {
			$this->data['reques'] = $this->request->server['REQUEST_URI'];	
		} else {
			$this->data['reques'] = '';
		}
		
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');
	
			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];	
			} else {
				$ip = ''; 
			}
			
			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];	
			} else {
				$url = '';
			}
			
			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];	
			} else {
				$referer = '';
			}
						
			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}
				
		$this->language->load('common/header');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = HTTPS_IMAGE;
		} else {
			$server = HTTP_IMAGE;
		}	
				
		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		$this->data['name'] = $this->config->get('config_name');
				
		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}
		$this->data['og_url'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, strlen ( $this->request->server['REQUEST_URI'] )-1);
		$this->data['og_image'] = $this->document->getOgImage();
		
		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
    	$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
    	$this->data['text_checkout'] = $this->language->get('text_checkout');
				
		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}
        
        /*-LOGIN-*/
        $this->language->load('account/login');
    	$this->data['text_forgotten'] = $this->language->get('text_forgotten');

    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_password'] = $this->language->get('entry_password');

    	$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_login'] = $this->language->get('button_login');
		$this->data['from_cart'] = (isset($_GET['cart']))?true:false;
        
        $this->data['action_l'] = $this->url->link('account/login', '', 'SSL');
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
        
        if (isset($this->request->post['email'])) {
			$this->data['email_l'] = $this->request->post['email'];
		} else {
			$this->data['email_l'] = '';
		}
        if (isset($this->request->post['password'])) {
			$this->data['password_l'] = $this->request->post['password'];
		} else {
			$this->data['password_l'] = '';
		}
        
        /*-END LOGIN-*/
        
        
        /*-REGISTRATION-*/
        $this->language->load('account/register');
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
    	$this->data['text_your_password'] = $this->language->get('text_your_password');
    	$this->data['entry_email'] = $this->language->get('entry_email');
        
		$this->data['action_r'] = $this->url->link('account/register', '', 'SSL');
		
		if (isset($this->request->post['firstname'])) {
    		$this->data['firstname_r'] = $this->request->post['firstname'];
		} else {
			$this->data['firstname_r'] = '';
		}
        if (isset($this->request->post['email'])) {
    		$this->data['email_r'] = $this->request->post['email'];
		} else {
			$this->data['email_r'] = '';
		}
        if (isset($this->request->post['password'])) {
    		$this->data['password_r'] = $this->request->post['password'];
		} else {
			$this->data['password_r'] = '';
		}
        
        
        /*-END REGISTRATION-*/
		
		// Menu
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');		
		$this->load->model('tool/image'); 
		
		$this->data['categories'] = array();
					
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				$children_data = array();
				
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
                
            /*-ADD_ONE_PRODUCT-*/  
                
            $this->data['products'] = array();
			
			$data = array(
				'filter_category_id' => $category['category_id'], 
                'filter_sub_category' => 1
			);
			$results = $this->model_catalog_product->getProducts($data);
			
            //echo count($results)."--";
            
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
                
                
                if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
			     if($result['upc'] == 1){
    				$this->data['products'][] = array(
    					'product_id'  => $result['product_id'],
    					'thumb'       => $image,
    					'name'        => $result['name'],
    					'price'       => $price,
					    'special'     => $special,
    					'rating'      => $result['rating'],
    					'upc'         => $result['upc'],
    					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'].'&path=' . $category['category_id'])
    				);
                }
			}
                
                
                /*-Recipes-*/
                $this->data['recipes'] = array();
                $this->load->model('catalog/recipe');
                $recipe_data = $this->model_catalog_recipe->getRecipe(false);
                $i=0;
                foreach($recipe_data as $recip){
                    if ($recip['image']) {
    					$image = $this->model_tool_image->resize($recip['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
    				} else {
    					$image = false;
    				}
                  // echo $category['category_id'].$recip['in_menu'];
                if($recip['in_menu'] == $category['category_id']){
                    //echo $recip['title'];
    				$this->data['recipes'] = array(
    					'image'       => $image,
    					'title'       => $recip['title'],
    					'description' => $recip['description'],
    					'href'        => $this->url->link('information/recipe', 'recipe_id=' . $recip['recipe_id'])
    				);
                    
                }
                }
                
				foreach ($children as $child) {
				    
                    $ch_children_data = array();
                    
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
                    $ch_children = $this->model_catalog_category->getCategories($child['category_id']);
                    
                    // $category['category_id'] . '_' . 
                    
                    foreach ($ch_children as $ch_child) {
                        $ch_children_data[] = array(
    						'name'  => $ch_child['name'],
    						'href'  => $this->url->link('product/category', 'path=' .$child['category_id']. '_' . $ch_child['category_id'])	
					    );
                    }
                    
					$product_total = $this->model_catalog_product->getTotalProducts($data);
									//. ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : '') add childrendata name
					$children_data[] = array(
						'name'  => $child['name'],
                        'children' => $ch_children_data,
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
					);						
				}
                    //echo count($this->data['products'])."--";        
                if(count($this->data['products']) != 0){
                    $rand_pr = rand(0, (count($this->data['products']) - 1));//count($this->data['products'])
                } else {
                    $rand_pr = false;
                }
				                
                // Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'active'   => in_array($category['category_id'], $parts),
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
                    'rand_product' => ($rand_pr !==false && isset($this->data['products'][$rand_pr]))?$this->data['products'][$rand_pr]:false,
                    'recipes'  => $this->data['recipes']
				);
			}
		}
		
		$this->children = array(
			'module/language',
			'module/currency',
			'module/cart'
		);
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
    	$this->render();
	} 	
}
?>