<?php 
class ControllerAccountCoupons extends Controller { 
	private $error = array();
	
	public function index() {
	   
  		$this->data['costumer_id'] = $this->customer->getId();

		//$this->language->load('account/coupons');
		$this->language->load('checkout/cart');
		//$this->document->setTitle($this->language->get('heading_title'));
			

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 
		
      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => 'Мой профиль',
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => 'Купоны',
			'href'      => $this->url->link('account/voucher', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);

    //	$this->data['heading_title'] = $this->language->get('heading_title');
	
					
 		$this->load->model('account/coupons');
		
		if(isset($this->session->data['customer_id'])){
        $customer_coupons = $this->model_account_coupons->getCustomerCoupons($this->session->data['customer_id']);
        }else{
		  $customer_coupons = $this->model_account_coupons->getCustomerCoupons(-1);
       
		}
		
        $cust_coup = array();
          foreach($customer_coupons as $cs){
            $cust_coup[] = $coupons = $this->model_account_coupons->getCoupon($cs['coupon_id']);  
          }
          
        $this->data['coupons'] = $cust_coup;
        	
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/coupons.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/coupons.tpl';
		} else {
			$this->template = 'default/template/account/coupons.tpl';
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
	
  	public function success() {
		$this->language->load('account/voucher');

		$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/voucher'),
        	'separator' => $this->language->get('text_separator')
      	);	
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->link('checkout/cart');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
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
	
	private function validate() {
    	if ((utf8_strlen($this->request->post['to_name']) < 1) || (utf8_strlen($this->request->post['to_name']) > 64)) {
      		$this->error['to_name'] = $this->language->get('error_to_name');
    	}    	
		
		if ((utf8_strlen($this->request->post['to_email']) > 96) || !$this->ocstore->validate($this->request->post['to_email'])) {
      		$this->error['to_email'] = $this->language->get('error_email');
    	}
		
    	if ((utf8_strlen($this->request->post['from_name']) < 1) || (utf8_strlen($this->request->post['from_name']) > 64)) {
      		$this->error['from_name'] = $this->language->get('error_from_name');
    	}  
		
		if ((utf8_strlen($this->request->post['from_email']) > 96) || !$this->ocstore->validate($this->request->post['from_email'])) {
      		$this->error['from_email'] = $this->language->get('error_email');
    	}
		
		if (!isset($this->request->post['voucher_theme_id'])) {
      		$this->error['theme'] = $this->language->get('error_theme');
    	}
				
		if (($this->currency->convert($this->request->post['amount'], $this->currency->getCode(), $this->config->get('config_currency')) < $this->config->get('config_voucher_min')) || ($this->currency->convert($this->request->post['amount'], $this->currency->getCode(), $this->config->get('config_currency')) > $this->config->get('config_voucher_max'))) {
      		$this->error['amount'] = sprintf($this->language->get('error_amount'), $this->currency->format($this->config->get('config_voucher_min')), $this->currency->format($this->config->get('config_voucher_max')) . ' ' . $this->currency->getCode());
    	}
				
		if (!isset($this->request->post['agree'])) {
      		$this->error['warning'] = $this->language->get('error_agree');
		}
									
    	if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}				
	}
}
?>