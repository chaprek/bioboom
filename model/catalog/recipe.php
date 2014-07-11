<?php
// Recipe Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)

class ModelCatalogRecipe extends Model { 

	public function updateViewed($recipe_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "recipe SET viewed = (viewed + 1) WHERE recipe_id = '" . (int)$recipe_id . "'");
	}

	public function getRecipeStory($recipe_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "recipe n LEFT JOIN " . DB_PREFIX . "recipe_description nd ON (n.recipe_id = nd.recipe_id) LEFT JOIN " . DB_PREFIX . "recipe_to_store n2s ON (n.recipe_id = n2s.recipe_id) WHERE n.recipe_id = '" . (int)$recipe_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
	
		return $query->row;
	}

	public function getRecipe($cat = false) {
	   
       if($cat){
         $and = " AND nd.category_id=".$cat;
       } else {
        $and = "";
       }
       
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recipe n LEFT JOIN " . DB_PREFIX . "recipe_description nd ON (n.recipe_id = nd.recipe_id) LEFT JOIN " . DB_PREFIX . "recipe_to_store n2s ON (n.recipe_id = n2s.recipe_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'".$and." ORDER BY n.date_added DESC");
	
		return $query->rows;
	}
    
    public function getRecipeImages($recipe_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recipe_image WHERE recipe_id = '" . (int)$recipe_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}
    
    public function getTypes() { 
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recipe_type_cuisine WHERE lang_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->rows;
	}
    
    public function getKinds() { 
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recipe_kind_cuisine WHERE lang_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->rows;
	}

	public function getRecipeShorts($limit) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recipe n LEFT JOIN " . DB_PREFIX . "recipe_description nd ON (n.recipe_id = nd.recipe_id) LEFT JOIN " . DB_PREFIX . "recipe_to_store n2s ON (n.recipe_id = n2s.recipe_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC LIMIT " . (int)$limit); 
	
		return $query->rows;
	}
    
   	public function getRecipeCats($cat = false) { 
   	    
        $and = '';
        
        if($cat){
            $and = " AND category_id =".$cat;
        }
        
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recipe_category WHERE lang_id = '" . (int)$this->config->get('config_language_id') . "'".$and);

		return $query->rows;
	}

	public function getTotalRecipe() {
     	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recipe n LEFT JOIN " . DB_PREFIX . "recipe_to_store n2s ON (n.recipe_id = n2s.recipe_id) WHERE n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
	
		if ($query->row) {
			return $query->row['total'];
		} else {
			return FALSE;
		}
	}	
}
?>
