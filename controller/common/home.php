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
		
        
        
        /*-NEW_BAR-*/
        
        $this->load->model('catalog/news');
        $this->load->model('tool/image');
            
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
                        'thumb'         => "image/data/category_img/".substr($result['image'], 10)
					);
                   break; 
				}
        }
        
        /*-END_NEW_BAR-*/
        
        
          /*-REVIEW-*/

            $this->language->load('product/product');
    		
    		$this->load->model('catalog/review');
    
    		$this->data['reviews'] = array();
    			
    		$results = $this->model_catalog_review->getAllReviews();
          		
                //print_r($results);
                
    		foreach ($results as $result) {
    		  
            	$this->data['reviews'][] = array(
            		'author'     => $result['author'],
    				'text'       => $result['text'],
    				'useful'       => $result['useful'],
    				'nouseful'       => $result['nouseful'],
    				'parent_id'       => $result['parent_id'],
    				'review_id'       => $result['review_id'],
            		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
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