<?php if ($filters) { ?>

    <div class="sort-menu">
    
     
     
    <ul class="sorting-groups">

	<?php foreach ($filters as $filter) { ?>

		<?php if (isset($filter['filters'])) { ?>
        
            <?php if ($filter['style_id'] == 'list') { ?>
  <li class="top-level">
      <h3><?php echo $filter['name']; ?></h3>
      
    <ul>
      <?php foreach ($filter['filters'] as $filter_value) { ?>
        <?php if ($filter_value['count'] || !$count_enabled) { ?>
		  <li><a href="<?php echo $filter_value['href']; ?>" <?php if($filter_value['active']) { ?>class="filter_active"<?php } ?> data-key="<?php echo $filter_value['key']; ?>" data-value="<?php echo $filter_value['value']; ?>"><?php echo $filter_value['name']; ?></a> <?php echo $filter_value['view_count']; ?></li>
		<?php } else { ?>
		  <li><?php echo $filter_value['name']; ?> <?php echo $filter_value['view_count']; ?></li>
		<?php } ?>
        <?php } ?>
    </ul>
  </li>
    
    <?php } ?>
	<?php } ?>
    <?php } ?>
                
   </ul>  
   
   <br/>  
   <div class="sort-title">
         <a id="filter_apply_button" class="button">
         Сортировать
         </a>
         <span class="pointer"></span>
     </div> 
</div>         
     
    
   

<?php } ?>
<script>
	$("#filter_apply_button").click(function(){
		var filter = '';
		var arr = {};
		$(".filter_active").each(function(i){
			var key = $(this).attr("data-key");
			var value = $(this).attr("data-value");
			if (arr[key] === undefined) {
				arr[key] = '';
				arr[key] += value;
			} else {
				arr[key] += ',' + value;
			}
			
		});
		
		$.each(arr, function(index,val){
			filter += index + ':' + val + ';';
		});
		filter = filter.substr(0, filter.length - 1);
		
		setUrl(filter);
	});
	
	function setUrl(filter) {
		var href = location.href;
		if (true) {
			var exp = /&filter=(.*?)(&|$)/g;
			href = href.replace(exp, "$2") + '&filter=' + filter;
		} else {
			href = '/index.php?route=product/category&path=0&filter=' + filter;
		}
		location = href;
	}
	
	function addButtonReset() {
		var href = location.href;
		if (/&filter=(.*?)(&|$)/.test(href)) {
			$(".sort-title").after('<br><div class="sort-title"><a onclick="resetFilter();"><?php echo $text_reset_filter; ?></a><span class="pointer"></span></div>');
		}
	}
	
	addButtonReset();
	
	function resetFilter() {
		var href = location.href;
		var exp = /&filter=(.*?)(&|$)/g;
		href = href.replace(exp, "");
		location = href;
	}
	
	$(".filter-item-select-head").click(function(){
		$(".filter-item-select-list").not($(this).next(".filter-item-select-list")).hide();
		$(this).next(".filter-item-select-list").toggle(); 
		return false;
	});
	
	$(document).click(function(e){ 
		var $target = $(e.target);
		if (!$target.is("a") && !$target.is("input:checkbox")) { 
			$(".filter-item-select-list").hide(); 
		} 
	});
	
	$(".sort-menu .top-level a").click(function(e){ 
		e.preventDefault();
		$(this).toggleClass("filter_active");
		var checkbox = $(this).siblings("input:checkbox");
		if (checkbox.is(':checked')) {
			checkbox.attr('checked', false);
		} else {
			checkbox.attr('checked', true);
		}
	});
	
	
	 $(".filter-item-checkbox input:checkbox, .filter-item-select input:checkbox").click(function(){
		$(this).siblings("a").toggleClass("filter_active");
		$(this).parents(".filter-item-select-list").show();
    });
	
</script>