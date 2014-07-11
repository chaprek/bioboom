<?php  
class ControllerProductProduct extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->language->load('product/product');
	
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => '/'/*$this->url->link('common/home')*/,			
			'separator' => false
		);
		
		$this->load->model('catalog/category');	
		
		if (isset($this->request->get['path'])) {
			$path = '';
				
			foreach (explode('_', $this->request->get['path']) as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}
				
				$category_info = $this->model_catalog_category->getCategory($path_id);
				
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => str_replace (HTTP_SERVER,"/",$this->url->link('product/category', 'path=' . $path)),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
		}
		
		$this->load->model('catalog/manufacturer');	
		
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array( 
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);	
				
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {	
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id']),					
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		
		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_tag'])) {
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
						
			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}
						
			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}
			
			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}	
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			); 	
		}
		
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}			

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
						
			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}
			
			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}	
						
			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
												
			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => ''/*-str_replace (HTTP_SERVER,"/",$this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']))-*/,
				'separator' => $this->language->get('text_separator')
			);			
			
			if ($product_info['seo_title']) {
				$this->document->setTitle($product_info['seo_title']);
			} else {
				$this->document->setTitle($product_info['name']);
			}

			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			
			if ($product_info['seo_h1']) {
				$this->data['heading_title'] = $product_info['seo_h1'];
			} else {
				$this->data['heading_title'] = $product_info['name'];
			}
			
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');	
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
			
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			
			$this->data['button_cart'] = $this->language->get('button_cart');
              
			$this->data['wish_button'] = (isset($this->session->data['wishlist']) && in_array($product_id, $this->session->data['wishlist']))?$this->language->get('wish_button_in'):$this->language->get('wish_button');
			$this->data['cart_button'] = $this->language->get('cart_button');
            $this->data['button_compare'] = $this->language->get('button_compare');			
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->load->model('catalog/review');

			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']));
			$this->data['tab_related'] = $this->language->get('tab_related');
			
			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['all_review'] = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . "&all_review=1");
			$this->data['model'] = $product_info['model'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];
			$this->data['is_tables'] = $product_info['sku'];
			$this->data['deliv_plus'] = $product_info['ean'];
            
            $this->data['islogin'] = ($this->customer->isLogged())?true:false;
              
            $this->data['inWish'] = (isset($this->session->data['wishlist']) && in_array($product_id, $this->session->data['wishlist']))?true:false;            
			
            
            //Узнаем есть ли товары в опциях в наличии
            $related = $this->model_catalog_product->getProductOptionsRelated($this->request->get['product_id']);             
            
            $quantity_opt = false;
            foreach($related as $rel){
                if($rel['quantity'] > 0){
                    $quantity_opt = true;
                }
            }
                        
            if($product_info['stock_status_id'] == 5 && $product_info['quantity'] <= 0 && !$quantity_opt){
                $this->data['stock'] = $this->language->get('text_noinstock');
                $this->data['in_stock'] = false;
            } else {
                $this->data['stock'] = $this->language->get('text_instock');
                $this->data['in_stock'] = true;
            }
            
            
            $this->data['status'] = $product_info['stock_status'];
			
			$this->load->model('tool/image');

			if ($product_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = '';
			}
			
			if ($product_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($product_info['image'], 708, 720);
				$this->data['big_img']='http://bioboom.ua/image/'.$product_info['image'];
				$this->document->setOgImage($this->data['thumb']);
			} else {
				$this->data['thumb'] = '';
			}
			
			$this->data['images'] = array();
			
			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
			
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height')),
					'big_img'=>'http://bioboom.ua/image/'.$result['image']
				);
			}	
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			    $this->data['price_pure'] =  $product_info['price'];
                $this->data['pref'] = $this->currency->getSymbolRight();
            } else {
				$this->data['price'] = false;
			}
						
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			    $this->data['price_pure_spec'] =  $product_info['special']; 
            } else {
				$this->data['special'] = false;
                $this->data['price_pure_spec'] =  "";
			}
			
			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$this->data['tax'] = false;
			}
			
			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
			
			$this->data['discounts'] = array(); 
			
			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
			            
            
             $this->data['options'] = array();
			
            //echo $this->request->get['product_id'];
            
			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) { 
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
					$option_value_data = array();
					
                    //print_r($option);
                    
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
								'price_cur'               => $price,
                                'price'                   => $option_value['price'],
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					}
					
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);					
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);						
				}
			}  
            
            
                			
			if ($product_info['minimum']) {
				$this->data['minimum'] = $product_info['minimum'];
			} else {
				$this->data['minimum'] = 1;
			}
			
			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews_w'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$this->data['rating'] = (int)$product_info['rating'];
            
            
            /*-MARK ON PRODUCT-*/
            $mark = '';            
            
            /*-BESTSELLERS-*/
            $bestsell = $this->model_catalog_product->getCountBestSellerProducts(100);
            $this->data['bestsell'] = $bestsell;
            /*-Find New Product-*/
            $date_elems = explode(" ",$product_info['date_added']);
            $date = explode("-", $date_elems[0]);
            $time = explode(":", $date_elems[1]); 
            $result =  mktime($time[0], $time[1],$time[2], $date[1],$date[2], $date[0]);
            
            if(time() - $result < 60*60*24*30){
                $mark = 'new_prod';    
            }
            if(in_array($product_id, $bestsell)){
                $mark = 'bestsell';
            }
            if($product_info['stock_status_id'] == 8){
                $mark = 'per_order';
            }
            
            if($product_info['jan'] == 1){
                $mark = 'new_prod';
            } else if($product_info['act'] == 1){
                $mark = 'act_mark';
            } else if($product_info['isbn'] == 1){
                $mark = 'bestsell';
            } else if($product_info['mpn'] == 1){
                $mark = 'sale';
            }
            
            if($product_info['jan'] == 2 && $mark == 'new_prod'){
                $mark = '';
            } else if($product_info['isbn'] == 2  && $mark == 'bestsell'){
                $mark = '';
            } else if($product_info['mpn'] == 2  && $mark == 'sale'){
                $mark = '';
            }
            
            $this->data['mark'] = $mark;
            
            
            
            $this->data['description_act'] = html_entity_decode($product_info['description_act'], ENT_QUOTES, 'UTF-8');
			$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            
            $des = explode(" ", strip_tags($this->data['description']));
            $this->data['short_description'] = implode(" ", array_splice($des, 0, 20));//20 первых слов
            
            $this->data['description_clear'] = str_replace('</div>', '', str_replace('<div class="description">', '', $this->data['description'])); 
			$this->data['attribute_groups'] = $atrs = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
			
            $this->data['care'] = false;
            $this->data['composition'] = false;
            $this->data['chunk'] = false;
            $this->data['certificates'] = false;
            
            foreach ($atrs as $att) {
                
                if($att['attribute_group_id'] == 3){
                    $this->data['care'] = $att;
                } elseif($att['attribute_group_id'] == 6 ){
                    $this->data['composition'] = $att;
                } elseif($att['attribute_group_id'] == 7 ){
                    $this->data['chunk'] = $att;
                }  elseif($att['attribute_group_id'] == 8 ){
                    $this->data['certificates'] = $att;
                } 
                
            } 
            
            
            
			$this->data['products'] = array();
			
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
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
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
							
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}	
			
			$this->data['tags'] = array();
					
			$tags = explode(',', $product_info['tag']);
			
			foreach ($tags as $tag) {
				$this->data['tags'][] = array(
					'tag'  => trim($tag),
					'href' => $this->url->link('product/search', 'filter_tag=' . trim($tag))
				);
			}
			
			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
            
            
            
            /*-REVIEW-*/

            $this->language->load('product/product');
    		
    		$this->load->model('catalog/review');
    
    		$this->data['text_on'] = $this->language->get('text_on');
    		$this->data['text_no_reviews'] = $this->language->get('text_no_reviews');
    
    		if (isset($this->request->get['page'])) {
    			$page = $this->request->get['page'];
    		} else {
    			$page = 1;
    		}  
    		
    		$this->data['reviews'] = array();
    		
    		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);
    			
    		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], 0, 1000);
          		
    		foreach ($results as $result) {
            	$this->data['reviews'][$result['review_id']] = array(
            		'author'     => $result['author'],
    				'text'       => $result['text'],
    				'useful'       => $result['useful'],
    				'nouseful'       => $result['nouseful'],
    				'parent_id'       => $result['parent_id'],
    				'review_id'       => $result['review_id'],
    				'rating'     => (int)$result['rating'],
            		'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
            		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            	);
          	}
            
              
              $arrev = $this->data['reviews'];
              
              $tree = array();
    
                foreach($arrev as $id => &$row){
                
                    if(isset($row['parent_id']) && $row['parent_id'] == 0){
                        $tree[$id] = &$row;
                    }
                    else{
                        $arrev[$row['parent_id']]['childs'][$id] = &$row;
                        $arrev[$row['parent_id']]['childs'][$id]['parent_author'] = $this->data['reviews'][$row['parent_id']]['author'];
                    }
                } 
                     
            $this->data['revs'] = $this->tree(array_slice($tree, ($page - 1) * 5, 5));
            
            //$this->data['revs'] = $this->tree($tree);
            
            $this->data['review_total'] = $review_total;
            	
    		$pagination = new Pagination();
    		$pagination->total = count($tree);
    		$pagination->page = $page;
            $pagination->show_on_page = false;
    		$pagination->limit = 5; 
    		$pagination->text = $this->language->get('text_pagination');
    		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');
    			
    		$this->data['pagination'] = $pagination->render();

            /*-END_REVIEW-*/
            
            
            
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/product.tpl';
			} else {
				$this->template = 'default/template/product/product.tpl';
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
		} else {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}			

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}	
					
			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}
							
			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}
					
			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
								
      		$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
        		'separator' => $this->language->get('text_separator')
      		);			
		
      		$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');



			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
  	}
	
	public function review() {
        
        /*-REVIEW-*/
            header('Content-Type: text/html; charset=UTF-8');
 
            $this->language->load('product/product');
    		
    		$this->load->model('catalog/review');
    
    		$this->data['text_on'] = $this->language->get('text_on');
    		$this->data['text_no_reviews'] = $this->language->get('text_no_reviews');
			$this->data['all_review'] = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . "&all_review=1");
    
    		if (isset($this->request->get['page'])) {
    			$page = $this->request->get['page'];
    		} else {
    			$page = 1;
    		}  
    		
    		$this->data['reviews'] = array();
    		
    		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);
    			
    		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], 0, 1000);
          		
    		foreach ($results as $result) {
            	$this->data['reviews'][$result['review_id']] = array(
            		'author'     => $result['author'],
    				'text'       => $result['text'],
    				'useful'       => $result['useful'],
    				'nouseful'       => $result['nouseful'],
    				'parent_id'       => $result['parent_id'],
    				'review_id'       => $result['review_id'],
    				'rating'     => (int)$result['rating'],
            		'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
            		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            	);
          	}
            
              
              $arrev = $this->data['reviews'];
              
              $tree = array();
    
                foreach($arrev as $id => &$row){
                
                    if(isset($row['parent_id']) && $row['parent_id'] == 0){
                        $tree[$id] = &$row;
                    }
                    else{
                        $arrev[$row['parent_id']]['childs'][$id] = &$row;
                        $arrev[$row['parent_id']]['childs'][$id]['parent_author'] = $this->data['reviews'][$row['parent_id']]['author'];
                    }
                } 
              
              if(isset($this->request->get['all_review'])){
                $this->data['review'] = $this->tree($tree);
              } else {
                $this->data['review'] = $this->tree(array_slice($tree, ($page - 1) * 5, 5));    
              }      
            
    
            $this->data['review_total'] = $review_total;
            	
    		$pagination = new Pagination();
    		$pagination->total = count($tree);
    		$pagination->page = $page;
            $pagination->show_on_page = false;
    		$pagination->limit = 5; 
    		$pagination->text = $this->language->get('text_pagination');
    		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');
    			
    		$this->data['pagination'] = $pagination->render();

            /*-END_REVIEW-*/
        
            echo $this->data['review'];
            
            if(!isset($this->request->get['all_review'])){
                echo '<div class="pagination" style="text-align: center;">'.((isset($this->request->get['all_review']))?"":$this->data['pagination'] ).'<div data-href="'.$this->data['all_review'].'" class="all_review">Р’СЃРµ РєРѕРјРјРµРЅС‚Р°СЂРёРё</div></div>';
            }
           
           //'.(isset($this->request->get['all_review']))?"":$this->data['pagination'] . '<a href="'.$this->data['all_review'].'" class="all_review">Р вЂ™РЎРѓР Вµ Р С•РЎвЂљР В·РЎвЂ№Р Р†РЎвЂ№</a>
	}
    
   	public function form_review() {
    		
        $this->data['review_id'] = $this->data['parent_id'] = $this->request->get['review_id']; 
       
        $this->data['rating'] = '3';    
            
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/form_review.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/form_review.tpl';
		} else {
			$this->template = 'default/template/product/form_review.tpl';
		}
		
		$this->response->setOutput($this->render());
	}
    
       	public function product_option_price() {
    		
            $this->load->model('catalog/product');  
            $related = $this->model_catalog_product->getProductOptionsRelated($this->request->post['product_id']);    
                
            $this->data['val_1'] =   $this->request->post['option_1'];
            $this->data['val_2'] =   $this->request->post['option_2'];
        
            $price = 0;
            
            foreach($related as $rel){
                 
                if(!empty($this->request->post['option_2'])){       
                    if(($this->data['val_1'] == $rel['opt_val_id'] && $this->data['val_2'] == $rel['sec_opt_val_id']) || ($this->data['val_2'] == $rel['opt_val_id'] && $this->data['val_1'] == $rel['sec_opt_val_id'])){
                       $price = $rel['price'];
                    } 
                } else {
                    if(($this->data['val_1'] == $rel['opt_val_id'] || $this->data['val_1'] == $rel['sec_opt_val_id'])){
                       $price = $rel['price'];
                    } 
                }
            }
            
            $json['price'] = (int)$price;
		
		
		$this->response->setOutput(json_encode($json));
                     
        }
    
   	public function product_option() {
    		
        $this->load->model('catalog/product');    
       	$this->load->model('tool/image');
                
        $related = $this->model_catalog_product->getProductOptionsRelated($this->request->get['product_id']);    
            
        $this->data['val_1'] =   $this->request->get['option_1'];
        $this->data['val_2'] =   $this->request->get['option_2'];  
        
        //если параметр пустой то выбираем первый параметр у которого колличество больше 0
        if(empty($this->data['val_1'])){
            foreach($related as $rel){
                if($rel['quantity'] > 0){
                    $this->data['val_1'] = $rel['opt_val_id'];
                    break;                    
                }         
            }
        }
        
                
        $relate_opt = array();
        $relate_opt_2 = array();
        
        $is_first = array();
        
        
        $this->data['first_base'] = $first_base = false;
        
        foreach($related as $rel){
            
            if($rel['quantity'] > 0){
               $is_first[$rel['opt_val_id']] = true; 
            }
                      
            if($this->data['val_1'] == $rel['opt_val_id']){                
                $this->data['first_base'] = $first_base = true;
                $relate_opt[] = $rel['sec_opt_val_id'];
                
            } elseif($this->data['val_1'] == $rel['sec_opt_val_id']){
                $relate_opt[] = $rel['opt_val_id'];
            } 
            
        }
        if(count($is_first) <= 0){
            return;
        }
          
          //echo "val_1".$this->data['val_1'];
//          echo "val_2".$this->data['val_2'];
//         print_r($related); 
                        
        $this->data['options'] = array();
			
            $m =0;
			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) { 
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
					$option_value_data = array();
					
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							
                           if(($first_base && (($m == 1 && in_array($option_value['option_value_id'], $relate_opt)) || ($m == 0 && isset($is_first[$option_value['option_value_id']]) ))) || (!$first_base && (($m == 0 && in_array($option_value['option_value_id'], $relate_opt)) || $m == 1 ))){
                                
    							$option_value_data[] = array(
    								'product_option_value_id' => $option_value['product_option_value_id'],
    								'option_value_id'         => $option_value['option_value_id'],
    								'name'                    => $option_value['name'],
    								'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                                    'price'                   => $option_value['price'],
    								'price_prefix'            => $option_value['price_prefix']
    							);
                            
                            }
						}
					}
					
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);	
                    				
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);						
				}
                $m++;
			}  
            
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_option.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/product_option.tpl';
		} else {
			$this->template = 'default/template/product/form_review.tpl';
		}
		
		$this->response->setOutput($this->render());
	}
    
   	public function useful() {
    	$this->load->model('catalog/review');
        $this->language->load('product/product');
				$json['success'] = $this->language->get('text_success');
		
		
		$this->response->setOutput(json_encode($json));
        	
      $this->model_catalog_review->updateUseful(($this->request->get['useful'] + 1), $this->request->get['use'], $this->request->get['rev_id']);
		
	}
	
    public function tree($reviews) {
		
		if (file_exists(DIR_TEMPLATE . 'default/template/product/review.tpl')) {
			
            $output = '';
            
            foreach($reviews as $review){
          		ob_start();
          
    	  		require(DIR_TEMPLATE . 'default/template/product/review.tpl');
          
    	  		$output .= ob_get_contents();
    
          		ob_end_clean();
      		}
            
			return $output;
    	} else {
			exit();				
    	}
	}
    
    private function link_it($text) { // преобразование текста в ссылку
    if(strpos($text, 'http:')){
             $text = preg_replace('/(http:\/\/([\w\d\.\?\&\#\;\:\+\-\=\%\/]+))/i', '<a href="$1">$1</a>', $text);
             } elseif(strpos($text, 'www.')){
             $text = preg_replace('/(www.([a-zA-Z_0-9\.\?\&\#\;\:\+\-\=\%\/]*))/i', '<a href="http://$1">$1</a>', $text);
            }
             return($text);
        }
    
	public function write() {
		$this->language->load('product/product');
		
		$this->load->model('catalog/review');
		
		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			
			if ($this->request->get['rating'] == 'undefined') {
				$json['error'] = $this->language->get('error_rating');
                $json['errorrating'] = true;
			} else {
			     $this->request->post['rating'] = $this->request->get['rating'];
			}
            
			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
                $json['errortext'] = true;
			}
            
	        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
                $json['errorname'] = true;
			}
                        
            
            if (!is_numeric($this->request->post['parent_id'])){
                $this->request->post['parent_id'] = 0;
            } 
	
		//	if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
//				$json['error'] = $this->language->get('error_captcha');
//			}
				
			if (!isset($json['error'])) {
			 
                $this->request->post['text'] = html_entity_decode($this->link_it($this->request->post['text']));
             
				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);
				
				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
    
        

	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
	
	public function upload() {
		$this->language->load('product/product');
		
		$json = array();
		
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
			
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
        		$json['error'] = $this->language->get('error_filename');
	  		}	  	
			
			$allowed = array();
			
			$filetypes = explode(',', $this->config->get('config_upload_allowed'));
			
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			
			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
       		}	
						
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		
		if (!$json) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$file = basename($filename) . '.' . md5(mt_rand());
				
				// Hide the uploaded file name so people can not link to it directly.
				$json['file'] = $this->encryption->encrypt($file);
				
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
			}
						
			$json['success'] = $this->language->get('text_upload');
		}	
		
		$this->response->setOutput(json_encode($json));		
	}
}
?>