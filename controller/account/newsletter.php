<?php 
class ControllerAccountNewsletter extends Controller {  
    
    
    private $error = array();
    
	public function index() {
	   
       
	/*-	if (!$this->customer->isLogged()) {
	  		$this->session->data['redirect'] = $this->url->link('account/newsletter', '', 'SSL');
	  
	  		$this->redirect($this->url->link('account/login', '', 'SSL'));
    	} -*/
		
		$this->language->load('account/newsletter');
    	
		$this->document->setTitle($this->language->get('heading_title'));
				
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
		  $json = array();
          
              $this->load->model('account/customer');
          
              if ($this->customer->isLogged()) {
        			
                    if(!$this->customer->getNewsletter()){
                    
        			     $this->model_account_customer->editNewsletter($this->request->post['newsletter']);
        			     $json['success'] = $this->language->get('text_success');
        			     $this->response->setOutput(json_encode($json));
        			} else {
        			     $json['error'] = $this->language->get('text_already');
        			     $this->response->setOutput(json_encode($json)); 
        			}
        			//$this->redirect($this->url->link('account/account', '', 'SSL'));
                
              } else {
                
                    $already = false;
                    $list_mail = $this->model_account_customer->getNewsletterMail();
                  
                    foreach($list_mail as $mail){                        
                        if(trim($this->request->post['newsletter']) == trim($mail['email'])){
                            $already = true;
                        }
                    }
                    
                    
                    if ((utf8_strlen($this->request->post['newsletter']) > 96) || !$this->ocstore->validate($this->request->post['newsletter'])) {
                  		$this->error['email'] = $this->language->get('text_error_mail');
                	}
                    
                    if($already){
        			      $json['error'] = $this->language->get('text_already');
                          $this->response->setOutput(json_encode($json));
        			} elseif(isset($this->error['email'])) {
        			      $json['error'] = $this->error['email'];
                          $this->response->setOutput(json_encode($json));
        			} else {
            			  $this->model_account_customer->setNewsletterMail($this->request->post['newsletter']);
                        
       			          $json['success'] = $this->language->get('text_success').$newsubs;
                          $this->response->setOutput(json_encode($json));
        			}
                    
              }
              
              
              if(isset($json['success'])){
                      /*-ADD NEW USER TO SUBSCRIBER LIST-*/
                    // Ваш ключ доступа к API (из Личного Кабинета)
                    $api_key = "53eqdpazuik8d5tdc966pnmwhiu9rumei6fd7k4a";
                    
                    // Данные о новом подписчике
                    $user_email = $this->request->post['newsletter'];
                    $user_name = "";
                    $user_name2 = "";
                    $user_lists = "3473677";
                    $user_phone = "";
                    
                    // Создаём POST-запрос
                    $POST = array (
                      'api_key' => $api_key,
                      'list_ids' => $user_lists,
                      'fields[email]' => $user_email,
                      'fields[Firstname]' => $user_name,
                      'fields[Lastname]' => $user_name2,
                      'double_optin ' => 1
                    );
                    
                    // Устанавливаем соединение
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, $POST);
                    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
                    curl_setopt($ch, CURLOPT_URL, 
                                'http://api.unisender.com/ru/api/subscribe?format=json');
                    $result = curl_exec($ch);
                    
                    $newsubs = "";
                    
                    if ($result) {
                      // Раскодируем ответ API-сервера
                      $jsonObj = json_decode($result);
                    
                      if(null===$jsonObj) {
                        // Ошибка в полученном ответе
                        $newsubs = "Invalid JSON";
                    
                      } elseif(!empty($jsonObj->error)) {
                        // Ошибка добавления пользователя
                        $newsubs = "An error occured: " . $jsonObj->error . "(code: " . $jsonObj->code . ")";
                    
                      } else {
                        // Новый пользователь успешно добавлен
                        //$newsubs = "Added. ID is " . $jsonObj->result->person_id;
                    
                      }
                    } else {
                      // Ошибка соединения с API-сервером
                      $newsubs = "API access error";
                    }
              }
              
              return;
            
		}

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
        	'text'      => $this->language->get('text_newsletter'),
			'href'      => $this->url->link('account/newsletter', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
		
		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_back'] = $this->language->get('button_back');

    	$this->data['action'] = $this->url->link('account/newsletter', '', 'SSL');
		
		$this->data['newsletter'] = $this->customer->getNewsletter();
		
		$this->data['back'] = $this->url->link('account/account', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/newsletter.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/newsletter.tpl';
		} else {
			$this->template = 'default/template/account/newsletter.tpl';
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
    
    
    public function validate(){
         if ((utf8_strlen($this->request->post['newsletter']) > 96) || !$this->ocstore->validate($this->request->post['newsletter'])) {
           		$this->error['email'] =  $this->language->get('error_email');
   	     }
         
            if (!$this->error) {
      		    return true;
        	} else {
          		return false;
        	}
    }
}
?>