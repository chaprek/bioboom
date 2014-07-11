<?php
// sertificates Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ModelCatalogsertificates extends Model { 

	public function updateViewed($sertificates_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "sertificates SET viewed = (viewed + 1) WHERE sertificates_id = '" . (int)$sertificates_id . "'");
	}

	public function getsertificatesStory($sertificates_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "sertificates n LEFT JOIN " . DB_PREFIX . "sertificates_description nd ON (n.sertificates_id = nd.sertificates_id) LEFT JOIN " . DB_PREFIX . "sertificates_to_store n2s ON (n.sertificates_id = n2s.sertificates_id) WHERE n.sertificates_id = '" . (int)$sertificates_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
	
		return $query->row;
	}

	public function getsertificates() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sertificates n LEFT JOIN " . DB_PREFIX . "sertificates_description nd ON (n.sertificates_id = nd.sertificates_id) LEFT JOIN " . DB_PREFIX . "sertificates_to_store n2s ON (n.sertificates_id = n2s.sertificates_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC");
	
		return $query->rows;
	}

	public function getsertificatesShorts($limit) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sertificates n LEFT JOIN " . DB_PREFIX . "sertificates_description nd ON (n.sertificates_id = nd.sertificates_id) LEFT JOIN " . DB_PREFIX . "sertificates_to_store n2s ON (n.sertificates_id = n2s.sertificates_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC LIMIT " . (int)$limit); 
	
		return $query->rows;
	}

	public function getTotalsertificates() {
     	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sertificates n LEFT JOIN " . DB_PREFIX . "sertificates_to_store n2s ON (n.sertificates_id = n2s.sertificates_id) WHERE n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
	
		if ($query->row) {
			return $query->row['total'];
		} else {
			return FALSE;
		}
	}	
}
?>
