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
                    <aside class="sidemenu">
                        <?php echo $column_right; ?>
                    </aside>
                    <div class="big-side">
                        <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                        <div class="content">
                            <div class="post-content">
                          
                                    <?php echo $description; ?>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="clear"></div>
</div>
</div>
<? if($information_id == 8){?>
<div class="map-window popup-window">
    <a href="#" class="close"></a>
    <div class="container clearfix">
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=true"></script>
        <script>
            function GMapCreate() {
                var map;
                var service;

                function initialize() {

                    var z;

                    if ($(window).width() < 500) z = 9;
                    else z = 10;

                    map = new google.maps.Map(document.getElementById('map'), {
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        center: new google.maps.LatLng(50.461001, 30.518432),
                        zoom: z
                    });

                    var buchaArea = [
                        new google.maps.LatLng(50.56732, 30.172893),
                        new google.maps.LatLng(50.565467, 30.183021),
                        new google.maps.LatLng(50.568847, 30.186626),
                        new google.maps.LatLng(50.567865, 30.201733),
                        new google.maps.LatLng(50.569283, 30.236236),
                        new google.maps.LatLng(50.548563, 30.269539),
                        new google.maps.LatLng(50.524014, 30.19109)
                    ];
                    var bucha = new google.maps.Polygon({
                        path: buchaArea,
                        strokeColor: "#0f710e",
                        strokeOpacity: 0.8,
                        strokeWeight: 3,
                        fillColor: "#99cc00",
                        fillOpacity: 0.55
                    });

                    bucha.setMap(map);

                    google.maps.event.addListener(bucha, 'click', areaClick);

                }

                initialize();

                function areaClick(event){
                    this.setOptions({
                        fillOpacity: 0.90
                    });
                    console.log(this);
                    var contentString = "";
                    contentString += "Clicked Location: <br />" + event.latLng.lat() + "," + event.latLng.lng() + "<br />";
                    console.log(contentString);
                }

            }

            $(function(){
                $(".delivery-map-link").click(function(){
                    GMapCreate();
                });
            });

            $(window).resize(function(){
                GMapCreate();
            });
        </script>
        <div class="c-select">
            <div class="pointer"></div>
            <select>
                <option value="0">Обухов</option>
                <option value="1" selected>Буча</option>
                <option value="2">Васильков</option>
                <option value="3">Коцюбинское</option>
            </select>
        </div>
        <h2>Выберите город для доставки вашего заказа</h2>
        <div id="map" style="width: 100%; height: 500px;"></div>
    </div>
</div>
<? }?>

<?php echo $footer; ?>