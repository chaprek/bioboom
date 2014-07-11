<?php
// accii Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ModelCatalogaccii extends Model { 

	public function updateViewed($accii_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "accii SET viewed = (viewed + 1) WHERE accii_id = '" . (int)$accii_id . "'");
	}

	public function getacciiStory($accii_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "accii n LEFT JOIN " . DB_PREFIX . "accii_description nd ON (n.accii_id = nd.accii_id) LEFT JOIN " . DB_PREFIX . "accii_to_store n2s ON (n.accii_id = n2s.accii_id) WHERE n.accii_id = '" . (int)$accii_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
	
		return $query->row;
	}

	public function getaccii() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "accii n LEFT JOIN " . DB_PREFIX . "accii_description nd ON (n.accii_id = nd.accii_id) LEFT JOIN " . DB_PREFIX . "accii_to_store n2s ON (n.accii_id = n2s.accii_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC");
	
		return $query->rows;
	}

	public function getacciiShorts($limit) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "accii n LEFT JOIN " . DB_PREFIX . "accii_description nd ON (n.accii_id = nd.accii_id) LEFT JOIN " . DB_PREFIX . "accii_to_store n2s ON (n.accii_id = n2s.accii_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC LIMIT " . (int)$limit); 
	
		return $query->rows;
	}

	public function getTotalaccii() {
     	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "accii n LEFT JOIN " . DB_PREFIX . "accii_to_store n2s ON (n.accii_id = n2s.accii_id) WHERE n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
	
		if ($query->row) {
			return $query->row['total'];
		} else {
			return FALSE;
		}
	}	
}
?>
