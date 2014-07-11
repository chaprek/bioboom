<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
        
        /*-MODELS INCLUDE-*/
        $this->load->model('catalog/information');
        $this->load->model('tool/image');
        $this->load->model('catalog/recipe');
        $this->load->model('catalog/news');
        
        
        
        /*-VIDEO MAIN-*/
        
        $information_info = $this->model_catalog_information->getInformation(15);
        $this->data['video'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
        $this->data['title'] = $information_info['title'];
        $this->data['description'] = $information_info['meta_description'];
        /*-END VIDEO MAIN-*/
        
        /*-RECIPES MAIN-*/
        $thos = $this->model_catalog_recipe->getRecipe();
        
        $this->data['recipes'] = array();
        
        //	foreach ($thos as $result) {
					$this->data['recipes'] = array(
						'id'  				=> $thos[0]['recipe_id'],
						'title'        		=> $thos[0]['title'],
                        'image'             => $this->model_tool_image->resize($thos[0]['image'], 225, 225),
						'description'  	    => utf8_substr(strip_tags(html_entity_decode($thos[0]['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
						'href'         		=> $this->url->link('information/recipe', 'recipe_id=' . $thos[0]['recipe_id']),
						'posted'   		    => date($this->language->get('date_format_short'), strtotime($thos[0]['date_added']))
					);
			//	}
        
        
        /*-END RECIPES MAIN-*/
        
        /*-NEW_BAR-*/
        
            
	  		$news_data = $this->model_catalog_news->getNews();
		
	  		if ($news_data) {
			
				$chars = $this->config->get('news_headline_chars');
			
				foreach ($news_data as $result) {
            
					$this->data['news_data'] = array(
						'id'  			=> $result['news_id'],
						'title'        	=> $result['title'],
						'description'  	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $chars),
						'href'         	=> $this->url->link('information/news', 'news_id=' . $result['news_id']),
						'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                        'thumb'         => "image/data/category_img/".substr($result['image'], 10),
                        'image'        => "image/".$result['image']
					);
                   break; 
				}
        }
        
        /*-END_NEW_BAR-*/
        
        /*-MOBILE-*/
        $this->data['mobile'] = $this->config->get('mobile');
        
          /*-REVIEW-*/

            $this->language->load('product/product');
    		
    		$this->load->model('catalog/review');
    
    		$this->data['reviews'] = array();
    			
    		$results = $this->model_catalog_review->getAllReviews();
          		
                //print_r($results);
                
             shuffle($results);   
                
    		foreach ($results as $result) {
    		                    
              if(strlen($result['text']) > 200){
                $r_text = mb_substr($result['text'], 0, 100,'utf-8')."(...)";
              } else {
                $r_text = $result['text'];
              }
              
              
            	$this->data['reviews'][] = array(
            		'author'     => $result['author'],
    				'text'       => $r_text,
    				'useful'       => $result['useful'],
    				'nouseful'       => $result['nouseful'],
    				'parent_id'       => $result['parent_id'],
    				'review_id'       => $result['review_id'],
            		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'href'    	    => $this->url->link('product/product', 'product_id=' . $result['product_id'])
            	);
                
          	}
           
            /*-END_REVIEW-*/
        
        
        
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
?>