<?php
class ModelAccountWaitList extends Model {		
	public function addProduct($product_id) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "waitlist SET customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "' ");
	}
	
    public function addProductLogout($product_id, $name, $email) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "waitlist SET product_id = '" . (int)$product_id . "', name = '".$name ."', email = '".$email."'");
	}
    
    public function deleteProduct($product_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "waitlist WHERE product_id = '" . (int)$product_id . "' AND  customer_id = '" . (int)$this->customer->getId() . "'");
    }
       
   	public function getAllProduct() {
	
		$query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "waitlist WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			
		return $query->rows;
	}

}
?>