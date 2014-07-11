<?php
class ModelShippingnovaposhta extends Model {
    function getQuote($address) {
        $this->load->language('shipping/novaposhta');
        if ($this->config->get('novaposhta_status')) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('novaposhta_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

            if (!$this->config->get('novaposhta_geo_zone_id')) {
                $status = TRUE;
            } elseif ($query->num_rows) {
                $status = TRUE;
            } else {
                $status = FALSE;
            }
        } else {
            $status = FALSE;
        }
        $method_data = array();
        if ($status) {
			
			$this->load->model('account/address');
			if ($this->customer->isLogged()) {					
				$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
				$city = (isset($this->session->data['newpostcity']))?$this->session->data['newpostcity']:$shipping_address['city'];
			} else {
				$city = $this->session->data['guest']['shipping']['city'];
			}
			
            $quote_data = array();
			$quote_data = array();
			$xml = '<?xml version="1.0" encoding="utf-8"?>';
			$xml .= '<file>';
			$xml .= '	<auth>'.$this->config->get('novaposhta_key').'</auth>';
			$xml .= '	<countPrice>';
			$xml .= '		<senderCity>'.$this->config->get('novaposhta_city_from').'</senderCity>';
			$xml .= '		<recipientCity>'.$city.'</recipientCity>';
			$xml .= '  		<date>'.date('d.m.Y', time()+(24*3600)).'</date>';
			$xml .= '		<mass>'.$this->weight->format($this->cart->getWeight(), '', '.', $this->language->get('thousand_point')).'</mass>';
			$xml .= '		<deliveryType_id>'.$this->config->get('novaposhta_type').'</deliveryType_id>';
			$xml .= '		<loadType_id>'.$this->config->get('novaposhta_type_load').'</loadType_id>';
			$xml .= '		<floor_count>'.$this->config->get('novaposhta_floor_count').'</floor_count>';
			$xml .= '	</countPrice>';
			$xml .= '</file>';
			
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, 'http://orders.novaposhta.ua/xml.php');
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_HTTPHEADER, Array("Content-Type: text/xml"));
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
			$result = curl_exec($ch);
			curl_close($ch);
			preg_match_all('#<error>(.*?)</error>\n*#s',$result,$error);
			
			if (!isset($error[1][0]) and empty($error[1][0])) {
				preg_match_all('#<date>(.*?)</date>\n*#s',$result,$date);
				preg_match_all('#<cost>(.*?)</cost>\n*#s',$result,$cost);
				
				$quote_data['novaposhta'] = array(
					'code' => 'novaposhta.novaposhta',
					'title' => $this->language->get('text_description'),
					'cost' => $cost[1][0],
					'tax_class_id' => 0,
					'text' => sprintf($this->language->get('text_shipping'),$date[1][0],$this->currency->format($cost[1][0]))
				);
			} else {
				$quote_data['novaposhta'] = array(
					'code' => 'novaposhta.novaposhta',
					'title' => $this->language->get('text_description'),
					'cost' => 0.00,
					'tax_class_id' => 0,
					'text' => sprintf($this->language->get('text_shipping_error'))
				);
			}
            $method_data = array(
                'code' => 'novaposhta',
                'title' => $this->language->get('text_title'),
                'quote' => $quote_data,
                'sort_order' => $this->config->get('novaposhta_sort_order'),
                'error' => FALSE
            );
        }
        return $method_data;
    }
}