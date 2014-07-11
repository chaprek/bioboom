<?php
// accii Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ControllerInformationaccii extends Controller {

	public function index() {
	
    	$this->language->load('information/accii');
	
		$this->load->model('catalog/accii');
		$this->load->model('tool/image');
	
		$this->data['breadcrumbs'] = array();
	
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);
	
		if (isset($this->request->get['accii_id'])) {
			$accii_id = $this->request->get['accii_id'];
		} else {
			$accii_id = 0;
		}
	
		$accii_info = $this->model_catalog_accii->getacciiStory($accii_id);
	
		if ($accii_info) {
	  	
			$this->document->addStyle('catalog/view/theme/default/stylesheet/accii.css');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/accii'),
				'text'      => $this->language->get('heading_title'),
				'separator' => $this->language->get('text_separator')
			);
		
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/accii', 'accii_id=' . $this->request->get['accii_id']),
				'text'      => $accii_info['title'],
				'separator' => $this->language->get('text_separator')
			);
			
			$this->document->setTitle($accii_info['title']);
			$this->document->setDescription($accii_info['meta_description']);
			$this->document->setKeywords($accii_info['meta_keyword']);
			$this->document->addLink($this->url->link('information/accii', 'accii_id=' . $this->request->get['accii_id']), 'canonical');
		
     		$this->data['accii_info'] = $accii_info;
		
     		$this->data['heading_title'] = $accii_info['title'];
     		
			$this->data['description'] = html_entity_decode($accii_info['description']);
			
     		$this->data['meta_keyword'] = html_entity_decode($accii_info['meta_keyword']);
			
			$this->data['viewed'] = sprintf($this->language->get('text_viewed'), $accii_info['viewed']);
		
			$this->data['addthis'] = $this->config->get('accii_acciipage_addthis');
		
			$this->data['min_height'] = $this->config->get('accii_thumb_height');
		
		
			if ($accii_info['image']) { $this->data['image'] = TRUE; } else { $this->data['image'] = FALSE; }
		
			$this->data['thumb'] = $this->model_tool_image->resize($accii_info['image'], $this->config->get('accii_thumb_width'), $this->config->get('accii_thumb_height'));
			$this->data['popup'] = $this->model_tool_image->resize($accii_info['image'], $this->config->get('accii_popup_width'), $this->config->get('accii_popup_height'));
		
     		$this->data['button_accii'] = $this->language->get('button_accii');
			$this->data['button_continue'] = $this->language->get('button_continue');
		
			$this->data['accii'] = $this->url->link('information/accii');
			$this->data['continue'] = $this->url->link('common/home');
			
			if (isset($_SERVER['HTTP_REFERER'])) {
			$this->data['referred'] = $_SERVER['HTTP_REFERER'];
			}
 
			$this->data['refreshed'] = 'http://' . $_SERVER['HTTP_HOST'] . '' . $_SERVER['REQUEST_URI'];
			
			if (isset($this->data['referred'])) {
				$this->model_catalog_accii->updateViewed($this->request->get['accii_id']);
			}
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/accii.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/accii.tpl';
			} else {
				$this->template = 'default/template/information/accii.tpl';
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
		
	  		$accii_data = $this->model_catalog_accii->getaccii();
		
	  		if ($accii_data) {
			
				$this->document->setTitle($this->language->get('heading_title'));
			
				$this->data['breadcrumbs'][] = array(
					'href'      => $this->url->link('information/accii'),
					'text'      => $this->language->get('heading_title'),
					'separator' => $this->language->get('text_separator')
				);
			
				$this->data['heading_title'] = $this->language->get('heading_title');
			
				$this->document->addStyle('catalog/view/javascript/jquery/panels/main.css');
				$this->document->addScript('catalog/view/javascript/jquery/panels/utils.js');
			
				$this->data['text_more'] = $this->language->get('text_more');
				$this->data['text_posted'] = $this->language->get('text_posted');
				
				$chars = $this->config->get('accii_headline_chars');
			
				foreach ($accii_data as $result) {
					$this->data['accii_data'][] = array(
						'id'  				=> $result['accii_id'],
						'title'        		=> $result['title'],
						'image'        		=> $this->model_tool_image->resize($result['image'], 640, 310),
						'description'  	=> html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
						'href'         		=> $this->url->link('information/accii', 'accii_id=' . $result['accii_id']),
						'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
					);
				}
			
				$this->data['button_continue'] = $this->language->get('button_continue');
			
				$this->data['continue'] = $this->url->link('common/home');
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/accii.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/information/accii.tpl';
				} else {
					$this->template = 'default/template/information/accii.tpl';
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
	        		'href'      => $this->url->link('information/accii'),
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
