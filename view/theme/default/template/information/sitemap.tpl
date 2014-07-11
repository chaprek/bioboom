<?php echo $header; ?>
<div id="main">
    <div class="wrapper" role="main">
        <div class="container">
            <div class="page">
                <div class="breadcrumbs">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        <?php } ?>
                </div>
                <div class="main-content clearfix">
					<h1><?php echo $heading_title; ?></h1>
  <style>
.sitemap * {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-weight: inherit;
	font-style: inherit;
	font-size: 100%;
	font-family: inherit;
	vertical-align: baseline;
}


.sitemap #primaryNav li {
	width:25%;
}

.sitemap #primaryNav li ul li {
	width:100% !important;
}

.sitemap #primaryNav.col1 li { width:99.9%; }
.sitemap #primaryNav.col2 li { width:50.0%; }
.sitemap #primaryNav.col3 li { width:33.3%; }
.sitemap #primaryNav.col4 li { width:25.0%; }
.sitemap #primaryNav.col5 li { width:20.0%; }
.sitemap #primaryNav.col6 li { width:16.6%; }
.sitemap #primaryNav.col7 li { width:14.2%; }
.sitemap #primaryNav.col8 li { width:12.5%; }
.sitemap #primaryNav.col9 li { width:11.1%; }
.sitemap #primaryNav.col10 li { width:10.0%; }


.sitemap  {
	background: white;
	color: black;
	padding: 40px;
	font-family: Gotham, Helvetica, Arial, sans-serif;
	font-size: 12px;
	line-height: 1;
}

.sitemap {
    margin: 0 auto;
    max-width: 822px;
}
.sitemap h1 {
	font-weight: bold;
	text-transform: uppercase;
	font-size: 20px;
	margin: 0 0 5px 0;
}
.sitemap h2 {
	font-family: "Lucida Grande", Verdana, sans-serif;
	font-size: 10px;
	color:  #777777;
	margin: 0 0 20px 0;
}
.sitemap a {
	text-decoration: none;
}
.sitemap ol, .sitemap ul {
	list-style: none;
}

.sitemap #primaryNav {
	margin: 0;
	float: left;
	width: 100%;
}
.sitemap #primaryNav  #home {
	display: block;
	float: none;
	background:  #ffffff url('images/L1-left.png') center bottom no-repeat;
	position: relative;
	z-index: 2;
	padding: 0 0 30px 0;
}
.sitemap #primaryNav li {
	float: left;
	background: url('images/L1-center.png') center top no-repeat;
	padding: 30px 0;
	margin-top: -30px;
}
.sitemap #primaryNav li a {
	margin: 0 20px 0 0;
	padding: 10px 0;
	display: block;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	color: black;	
	background:  #c3eafb url('images/white-highlight.png') top left repeat-x;
	border: 2px solid  #b5d9ea;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-webkit-box-shadow: rgba(0,0,0,0.5) 2px 2px 2px; 
	-moz-box-shadow: rgba(0,0,0,0.5) 2px 2px 2px; /* FF 3.5+ */	
}
.sitemap #primaryNav li a:hover {
	background-color:  #e2f4fd;
	border-color:  #97bdcf;
}
.sitemap #primaryNav li:last-child {
	background: url('images/L1-right.png') center top no-repeat;
}
.sitemap a:link:before,
.sitemap a:visited:before {
	content: " "attr(href)" ";
	display: block;
	text-transform: uppercase;
	font-size: 10px;
	margin-bottom: 5px;
	word-wrap: break-word;
}
.sitemap #primaryNav li a:link:before,
.sitemap #primaryNav li a:visited:before {
	color:  #78a9c0;
}

.sitemap #primaryNav li li {
	width: 100%;
	clear: left;
	margin-top: 0;
	padding: 10px 0 0 0;
	background: url('images/vertical-line.png') center bottom repeat-y;
}
.sitemap #primaryNav li li a {
	background-color:  #cee3ac;
	border-color:  #b8da83;
}
.sitemap #primaryNav li li a:hover {
	border-color:  #94b75f;
	background-color:  #e7f1d7;
}
.sitemap #primaryNav li li:first-child {
	padding-top: 30px;
}
.sitemap #primaryNav li li:last-child {
	background: url('images/vertical-line.png') center bottom repeat-y;
}
.sitemap #primaryNav li li a:link:before,
.sitemap #primaryNav li li a:visited:before {
	color:  #8faf5c;
}

.sitemap #primaryNav li li ul {
	margin: 10px 0 0 0;
	width: 100%;
	float: right;
	padding: 9px 0 10px 0;
	background:  #ffffff url('images/L3-ul-top.png') center top no-repeat;
}
.sitemap #primaryNav li li li {
	background: url('images/L3-center.png') left center no-repeat;
	padding: 5px 0;
}
.sitemap #primaryNav li li li a {
	background-color:  #fff7aa;
	border-color:  #e3ca4b;
	font-size: 12px;
	padding: 5px 0;
	width: 80%;
	float: right;
}
.sitemap #primaryNav li li li a:hover {
	background-color:  #fffce5;
	border-color:  #d1b62c;
}
.sitemap #primaryNav li li li:first-child {
	padding: 15px 0 5px 0;
	background: url('images/L3-li-top.png') left center no-repeat;
}
.sitemap #primaryNav li li li:last-child {
	background: url('images/L3-bottom.png') left center no-repeat;
}
.sitemap #primaryNav li li li a:link:before,
.sitemap #primaryNav li li li a:visited:before {
	color:  #ccae14;
	font-size: 9px;
}

.sitemap #utilityNav {
	float: right;
	max-width: 50%;
	margin-right: 10px;
}
.sitemap #utilityNav li {
	float: left;
	margin-bottom: 10px;
}
.sitemap #utilityNav li a {
	margin: 0 10px 0 0;
	padding: 5px 10px;
	display: block;	
	border: 2px solid #e3ca4b;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	color: black;
	background: #fff7aa url('images/white-highlight.png') top left repeat-x;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-webkit-box-shadow: rgba(0,0,0,0.5) 2px 2px 2px; 
	-moz-box-shadow: rgba(0,0,0,0.5) 2px 2px 2px; /* FF 3.5+ */	
}
.sitemap #utilityNav li a:hover {
	background-color: #fffce5;
	border-color: #d1b62c;
}
.sitemap #utilityNav li a:link:before,
.sitemap #utilityNav li a:visited:before {
	color:  #ccae14;
	font-size: 9px;
	margin-bottom: 3px;
}
</style>
  <div class="sitemap">
    
      <ul id="primaryNav" class="col1"> 
	  <li id="home"><a href="http://bioboom.ua/"<?/*=$this->url->link("common/home");*/ ?>>Интернет-магазин БиоБум™</a>
        <?php foreach ($categories as $category_1) { ?>
        <li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
          <?php if ($category_1['children']) { ?>
          <ul>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
              <?php if ($category_2['children']) { ?>
              <ul>
                <?php foreach ($category_2['children'] as $category_3) { ?>
                <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
		            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      </ul>
   
          
  </div>
                </div>
            </div>
        </div>
    </div>
    <div id="clear"></div>
</div>
</div>
<?php echo $footer; ?>