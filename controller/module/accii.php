<?php
// accii Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ControllerModuleaccii extends Controller {

	private $_name = 'accii';

	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/' . $this->_name);
	
      	$this->data['heading_title'] = $this->language->get('heading_title');
	
		$this->load->model('localisation/language');
	
		$languages = $this->model_localisation_language->getLanguages();
	
		$this->data['customtitle'] = $this->config->get($this->_name . '_customtitle' . $this->config->get('config_language_id'));
		$this->data['header'] = $this->config->get($this->_name . '_header');
	
		if (!$this->data['customtitle']) { $this->data['customtitle'] = $this->data['heading_title']; } 
		if (!$this->data['header']) { $this->data['customtitle'] = ''; }
	
		$this->data['icon'] = $this->config->get($this->_name . '_icon');
		$this->data['box'] = $this->config->get($this->_name . '_box');
	
		$this->document->addStyle('catalog/view/theme/default/stylesheet/accii.css');
	
		$this->load->model('catalog/accii');
	
		$this->data['text_more'] = $this->language->get('text_more');
		$this->data['text_posted'] = $this->language->get('text_posted');
	
		$this->data['show_headline'] = $this->config->get($this->_name . '_headline_module');
	
		$this->data['accii_count'] = $this->model_catalog_accii->getTotalaccii();
		
		$this->data['accii_limit'] = $setting['limit'];
	
		if ($this->data['accii_count'] > $this->data['accii_limit']) { $this->data['showbutton'] = true; } else { $this->data['showbutton'] = false; }
	
		$this->data['buttonlist'] = $this->language->get('buttonlist');
	
		$this->data['acciilist'] = $this->url->link('information/accii');
		
		$this->data['numchars'] = $setting['numchars'];
		
		if (isset($this->data['numchars'])) { $chars = $this->data['numchars']; } else { $chars = 100; }
		
		$this->data['accii'] = array();
	
		$results = $this->model_catalog_accii->getacciiShorts($setting['limit']);
	
		foreach ($results as $result) {
			$this->data['accii'][] = array(
				'title'        		=> $result['title'],
				'description'  	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $chars),
				'href'         		=> $this->url->link('information/accii', 'accii_id=' . $result['accii_id']),
				'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
	
		$this->data['module'] = $module++; 
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl';
		} else {
			$this->template = 'default/template/module/' . $this->_name . '.tpl';
		}
	
		$this->render();
	}
}
?>
