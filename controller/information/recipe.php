<?php
// Recipe Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ControllerInformationRecipe extends Controller {

	public function index() {
    	$this->language->load('information/recipe');
	
		$this->load->model('catalog/recipe');
	
		$this->data['breadcrumbs'] = array();
	
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);
	
		if (isset($this->request->get['recipe_id'])) {
			$recipe_id = $this->request->get['recipe_id'];
		} else {
			$recipe_id = 0;
		}
        
        /*-FIND CATEGORY IF EXIST-*/
        $category = (isset($this->request->get['category_id']))?$this->request->get['category_id']:false;
        $cat = $this->model_catalog_recipe->getRecipeCats($category);
            	
		$recipe_info = $this->model_catalog_recipe->getRecipeStory($recipe_id);
	
		if ($recipe_info) {
	  	
			//$this->document->addStyle('catalog/view/theme/default/stylesheet/recipe.css');
//			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/recipe'),
				'text'      => $this->language->get('heading_title'),
				'separator' => $this->language->get('text_separator')
			);
            
            $cat = $this->model_catalog_recipe->getRecipeCats($recipe_info['category_id']);
            $this->data['breadcrumbs'][] = array(
    			'href'      => $this->url->link('information/recipe', 'category_id=' . $recipe_info['category_id']),
    			'text'      => $cat[0]['name'],
    			'separator' => $this->language->get('text_separator')
			);
            
		
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/recipe', 'recipe_id=' . $this->request->get['recipe_id']),
				'text'      => $recipe_info['title'],
				'separator' => $this->language->get('text_separator')
			);
			
			$this->document->setTitle($recipe_info['title']);
			$this->document->setDescription($recipe_info['description']);
            
			$this->document->addLink($this->url->link('information/recipe', 'recipe_id=' . $this->request->get['recipe_id']), 'canonical');
		
     		$this->data['recipe_info'] = $recipe_info;
		
     		$this->data['heading_title'] = $recipe_info['title'];
     		
			$this->data['description'] = html_entity_decode($recipe_info['description']);
            
			$this->data['text'] = html_entity_decode($recipe_info['text']);
			
     		$this->data['ingredients'] = explode(",", html_entity_decode($recipe_info['ingredients']));
            
     		$this->data['author'] = html_entity_decode($recipe_info['author']);
			
			$this->data['viewed'] = sprintf($this->language->get('text_viewed'), $recipe_info['viewed']);
		
			$this->data['addthis'] = $this->config->get('recipe_recipepage_addthis');
		
			$this->data['min_height'] = $this->config->get('recipe_thumb_height');
		
			$this->load->model('tool/image');
		
			if ($recipe_info['image']) { $this->data['image'] = TRUE; } else { $this->data['image'] = FALSE; }
		
			$this->data['thumb'] = $this->model_tool_image->resize($recipe_info['image'], 390, 390);
			$this->data['popup'] = $this->model_tool_image->resize($recipe_info['image'], $this->config->get('recipe_popup_width'), $this->config->get('recipe_popup_height'));
		
        
            $this->data['images'] = array();
			
			$results = $this->model_catalog_recipe->getRecipeImages($this->request->get['recipe_id']);
			
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], 390, 390),
					'thumb' => $this->model_tool_image->resize($result['image'], 229, 229)
				);
			}
        
     		$this->data['button_recipe'] = $this->language->get('button_recipe');
			$this->data['button_continue'] = $this->language->get('button_continue');
		
			$this->data['recipe'] = $this->url->link('information/recipe');
			$this->data['continue'] = $this->url->link('common/home');
            
            
            
            
			
			if (isset($_SERVER['HTTP_REFERER'])) {
			$this->data['referred'] = $_SERVER['HTTP_REFERER'];
			}
 
			$this->data['refreshed'] = 'http://' . $_SERVER['HTTP_HOST'] . '' . $_SERVER['REQUEST_URI'];
			
			if (isset($this->data['referred'])) {
				$this->model_catalog_recipe->updateViewed($this->request->get['recipe_id']);
			}
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/recipe.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/recipe.tpl';
			} else {
				$this->template = 'default/template/information/recipe.tpl';
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
	  	
            		
	  	    $recipe_data = $this->model_catalog_recipe->getRecipe($category);
		
	  		if ($recipe_data) {
			
				$this->document->setTitle($this->language->get('heading_title'));
			
            
				$this->data['breadcrumbs'][] = array(
					'href'      => $this->url->link('information/recipe'),
					'text'      => $this->language->get('heading_title'),
					'separator' => $this->language->get('text_separator')
				);
                
                if($category){
                    $this->data['breadcrumbs'][] = array(
    					'href'      => $this->url->link('information/recipe', 'category_id=' . $category),
    					'text'      => $cat[0]['name'],
    					'separator' => $this->language->get('text_separator')
    				);
                }
				$this->data['category'] = ($category)?$cat[0]:false;
                
                $this->data['heading_title'] = $this->language->get('heading_title');
			
				$this->document->addStyle('catalog/view/javascript/jquery/panels/main.css');
				$this->document->addScript('catalog/view/javascript/jquery/panels/utils.js');
			
				$this->data['text_more'] = $this->language->get('text_more');
				$this->data['text_posted'] = $this->language->get('text_posted');
				
				$chars = $this->config->get('recipe_headline_chars');
			
            
            
            $this->load->model('tool/image');
		
		//	if ($recipe_data['image']) { $this->data['image'] = TRUE; } else { $this->data['image'] = FALSE; }
//		
//			$this->data['thumb'] = $this->model_tool_image->resize($recipe_data['image'], 390, 390);
            
            $this->data['types'] = $this->model_catalog_recipe->getTypes();
            $this->data['kinds'] = $this->model_catalog_recipe->getKinds();
            
            
				foreach ($recipe_data as $result) {
					$this->data['recipe_data'][] = array(
						'id'  				=> $result['recipe_id'],
						'title'        		=> $result['title'],
                        'image'             => $this->model_tool_image->resize($result['image'], 225, 225),
						'description'  	    => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $chars),
						'href'         		=> $this->url->link('information/recipe', 'recipe_id=' . $result['recipe_id']),
						'posted'   		    => date($this->language->get('date_format_short'), strtotime($result['date_added']))
					);
				}
			
				$this->data['button_continue'] = $this->language->get('button_continue');
			
				$this->data['continue'] = $this->url->link('common/home');
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/recipe.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/information/recipe.tpl';
				} else {
					$this->template = 'default/template/information/recipe.tpl';
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
			
		  		$this->document->setTitle($this->language->get('text_error'));
			
	     		$this->document->breadcrumbs[] = array(
	        		'href'      => $this->url->link('information/recipe'),
	        		'text'      => $this->language->get('text_error'),
	        		'separator' => $this->language->get('text_separator')
	     		);
			
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
	}
}
?>
