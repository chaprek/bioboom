<?php
class ModelCatalogReview extends Model {		
	public function addReview($product_id, $data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', parent_id = '" . (int)$this->db->escape($data['parent_id']) . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
	}
	
    public function updateUseful($data, $use, $rev_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "review SET ".(($use == 1)?("useful = " . ($data)):("nouseful=" . ($data)))." WHERE review_id= " . ($this->db->escape($rev_id))."");
	}
    	
	public function getReviewsByProductId($product_id, $start = 0, $limit = 1000) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 1000;
		}		
		
		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, r.parent_id, r.useful, r.nouseful, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}
    
   	public function getAllReviews() {
	
		$query = $this->db->query("SELECT r.review_id, r.author, r.product_id, r.rating, r.text, r.parent_id, r.useful, r.nouseful, r.date_added FROM " . DB_PREFIX . "review r  WHERE r.parent_id = '0' AND r.status = '1' ORDER BY r.date_added DESC LIMIT 0, 10");
			
		return $query->rows;
	}
	
	public function getAverageRating($product_id) {
		$query = $this->db->query("SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review WHERE status = '1' AND product_id = '" . (int)$product_id . "' GROUP BY product_id");
		
		if (isset($query->row['total'])) {
			return (int)$query->row['total'];
		} else {
			return 0;
		}
	}	
	
	public function getTotalReviews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) WHERE p.date_available <= NOW() AND p.status = '1' AND r.status = '1'");
		
		return $query->row['total'];
	}

	public function getTotalReviewsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['total'];
	}
}
?>