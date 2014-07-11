<?php
class Modelshippingnewpostcities extends Model {
    function getCities() {
    			
            $xml =  '<?xml version="1.0" encoding="utf-8"?>';
            $xml .= '<file>';
            $xml .= '<auth>'.$this->config->get('novaposhta_key').'</auth>';
            $xml .= '<city/>';
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
            
            $response = new SimpleXmlElement($result);
            
            $cities = array();
            
            foreach($response->result->cities->city as $city){
                $cities[] = $city->nameRu;
            }
        
        return $cities;
    }
    
        function getBranches($city) {
    			
            $xml =  '<?xml version="1.0" encoding="utf-8"?>';
            $xml .= '<file>';
            $xml .= '<auth>'.$this->config->get('novaposhta_key').'</auth>';
            $xml .= '<warenhouse/>';
            $xml .= '<filter>'.$city.'</filter>';
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
            
            $response = new SimpleXmlElement($result);
            
            $warens = array();
            
            foreach($response->result->whs->warenhouse as $waren){
                $warens[] = $waren->addressRu;
            }
        
        return $warens;
    }
}