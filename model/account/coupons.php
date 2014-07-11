<?php
class ModelAccountCoupons extends Model {

	
	public function getCoupon($coupon_id) {
      	$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "'");
		
		return $query->row;
	}
    
    public function getCustomerCoupons($customer_id) {
		$query = $this->db->query("SELECT DISTINCT coupon_id FROM " . DB_PREFIX . "coupon_customer WHERE customer_id = '" . (int)$customer_id . "'");
	
		return $query->rows;
	}
	
}
?>