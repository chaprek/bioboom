<?php
// sertificates Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ControllerInformationsertificates extends Controller {

	public function index() {
	
    	$this->language->load('information/sertificates');
	
		$this->load->model('catalog/sertificates');
		$this->load->model('tool/image');
	
		$this->data['breadcrumbs'] = array();
	
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);
	
		if (isset($this->request->get['sertificates_id'])) {
			$sertificates_id = $this->request->get['sertificates_id'];
		} else {
			$sertificates_id = 0;
		}
	
    
        $sertificates_data = $this->model_catalog_sertificates->getsertificates();
		$chars = $this->config->get('recipe_headline_chars');						
							
				foreach ($sertificates_data as $result) {
					$this->data['sertificates_data'][] = array(
						'id'  				=> $result['sertificates_id'],
						'title'        		=> $result['title'],
						'cantry'        	=> $result['cantry'],
                        'image'             => $this->model_tool_image->resize($result['image'], $this->config->get('sertificates_thumb_width'), $this->config->get('sertificates_thumb_height')),
						'description'  	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $chars),
						'href'         		=> $this->url->link('information/sertificates', 'sertificates_id=' . $result['sertificates_id']),
						'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
					);
				}
    
    
    
		$sertificates_info = $this->model_catalog_sertificates->getsertificatesStory($sertificates_id);
	
		if ($sertificates_info) {
	  	
			$this->document->addStyle('catalog/view/theme/default/stylesheet/sertificates.css');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/sertificates'),
				'text'      => $this->language->get('heading_title'),
				'separator' => $this->language->get('text_separator')
			);
		
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/sertificates', 'sertificates_id=' . $this->request->get['sertificates_id']),
				'text'      => $sertificates_info['title'],
				'separator' => $this->language->get('text_separator')
			);
			
			$this->document->setTitle($sertificates_info['title']);
			$this->document->setDescription($sertificates_info['meta_description']);
			$this->document->setKeywords($sertificates_info['meta_keyword']);
			$this->document->addLink($this->url->link('information/sertificates', 'sertificates_id=' . $this->request->get['sertificates_id']), 'canonical');
		
     		$this->data['sertificates_info'] = $sertificates_info;
		
     		$this->data['heading_title'] = $sertificates_info['title'];
            
            $this->data['cantry'] = $sertificates_info['cantry'];
     		
			$this->data['description'] = html_entity_decode($sertificates_info['description']);
			
     		$this->data['meta_keyword'] = html_entity_decode($sertificates_info['meta_keyword']);
			
			$this->data['viewed'] = sprintf($this->language->get('text_viewed'), $sertificates_info['viewed']);
		
			$this->data['addthis'] = $this->config->get('sertificates_sertificatespage_addthis');
		
			$this->data['min_height'] = $this->config->get('sertificates_thumb_height');
		
		
			if ($sertificates_info['image']) { $this->data['image'] = TRUE; } else { $this->data['image'] = FALSE; }
		
			$this->data['thumb'] = $this->model_tool_image->resize($sertificates_info['image'], $this->config->get('sertificates_thumb_width'), $this->config->get('sertificates_thumb_height'));
			$this->data['popup'] = $this->model_tool_image->resize($sertificates_info['image'], $this->config->get('sertificates_popup_width'), $this->config->get('sertificates_popup_height'));
		
     		$this->data['button_sertificates'] = $this->language->get('button_sertificates');
			$this->data['button_continue'] = $this->language->get('button_continue');
		
			$this->data['sertificates'] = $this->url->link('information/sertificates');
			
			if (isset($_SERVER['HTTP_REFERER'])) {
			$this->data['referred'] = $_SERVER['HTTP_REFERER'];
			}
 
			$this->data['refreshed'] = 'http://' . $_SERVER['HTTP_HOST'] . '' . $_SERVER['REQUEST_URI'];
			
			if (isset($this->data['referred'])) {
				$this->model_catalog_sertificates->updateViewed($this->request->get['sertificates_id']);
			}
						
		
	  	} else {
		
					
				$this->document->setTitle($this->language->get('heading_title'));
			
				$this->data['breadcrumbs'][] = array(
					'href'      => $this->url->link('information/sertificates'),
					'text'      => $this->language->get('heading_title'),
					'separator' => $this->language->get('text_separator')
				);
			
				$this->data['heading_title'] = $this->language->get('heading_title');
			
			
				$this->data['button_continue'] = $this->language->get('button_continue');
					
		
		}
                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/sertificates.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/information/sertificates.tpl';
				} else {
					$this->template = 'default/template/information/sertificates.tpl';
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
?>
