var fMenu;
var fakeMenu;
var subW;
var subH;

function callPlayer(frame_id, func, args) {
    if (window.jQuery && frame_id instanceof jQuery) frame_id = frame_id.get(0).id;
    var iframe = document.getElementById(frame_id);
    if (iframe && iframe.tagName.toUpperCase() != 'IFRAME') {
        iframe = iframe.getElementsByTagName('iframe')[0];
    }
    // When the player is not ready yet, add the event to a queue
    // Each frame_id is associated with an own queue.
    // Each queue has three possible states:
    //  undefined = uninitialised / array = queue / 0 = ready
    if (!callPlayer.queue) callPlayer.queue = {};
    var queue = callPlayer.queue[frame_id],
        domReady = document.readyState == 'complete';

    if (domReady && !iframe) {
        // DOM is ready and iframe does not exist. Log a message
        window.console && console.log('callPlayer: Frame not found; id=' + frame_id);
        if (queue) clearInterval(queue.poller);
    } else if (func === 'listening') {
        // Sending the "listener" message to the frame, to request status updates
        if (iframe && iframe.contentWindow) {
            func = '{"event":"listening","id":' + JSON.stringify(''+frame_id) + '}';
            iframe.contentWindow.postMessage(func, '*');
        }
    } else if (!domReady || iframe && (!iframe.contentWindow || queue && !queue.ready)) {
        if (!queue) queue = callPlayer.queue[frame_id] = [];
        queue.push([func, args]);
        if (!('poller' in queue)) {
            // keep polling until the document and frame is ready
            queue.poller = setInterval(function() {
                callPlayer(frame_id, 'listening');
            }, 250);
            // Add a global "message" event listener, to catch status updates:
            messageEvent(1, function runOnceReady(e) {
                var tmp = JSON.parse(e.data);
                if (tmp && tmp.id == frame_id && tmp.event == 'onReady') {
                    // YT Player says that they're ready, so mark the player as ready
                    clearInterval(queue.poller);
                    queue.ready = true;
                    messageEvent(0, runOnceReady);
                    // .. and release the queue:
                    while (tmp = queue.shift()) {
                        callPlayer(frame_id, tmp[0], tmp[1]);
                    }
                }
            }, false);
        }
    } else if (iframe && iframe.contentWindow) {
        
        // When a function is supplied, just call it (like "onYouTubePlayerReady")
        if (func.call){ 
            
            alert('gg');
            return func()}
        // Frame exists, send message
        iframe.contentWindow.postMessage(JSON.stringify({
            "event": "command",
            "func": func,
            "args": args || [],
            "id": frame_id
        }), "*");
    }
    /* IE8 does not support addEventListener... */
    function messageEvent(add, listener) {
        var w3 = add ? window.addEventListener : window.removeEventListener;
        w3 ?
            w3('message', listener, !1)
            :
            (add ? window.attachEvent : window.detachEvent)('onmessage', listener);
    }
}

function mainMenu(){
    if (!$(window).width()<=480) {
        var cW = 0;
        $("#main-menu li.top-level > a").each(function(){
            cW += $(this).outerWidth();
        });
        var m = Math.floor(($("#main-menu .menu").width() - cW)/($("#main-menu li.top-level").length - 1));
        if ( m >= 0) {
            $("#main-menu li.top-level").each(function(){
                if ($(this).index() != ($("#main-menu li.top-level").length - 1)) $(this).css("margin-right", m-1);
            });
        }
    } 
    
    if($(window).width()<=480) {
        $("#main-menu").addClass('mini_menu');
    }
}

function resizeFooter(){
    $("#footer").css({
        "height": $("#footer .container").outerHeight(),
        "margin-top": -$("#footer .container").outerHeight()
    });

    $("#clear").css("height", $("#footer").height());

    if ($(document).find(".registration-container").length){
        $(".registration-container").css("min-height", $(".registration-container .right-col").height());
    }

}

function footerMenu(cols){
    var colH = fMenu / cols;
    var ind = 0;
    $("#footer .container").append('<div id="fake-footer"></div>');
    var fakeFooter = $(document.getElementById("fake-footer"));
    fakeFooter.append(fakeMenu.html());
    $("#footer .footer-inner").html("");
    for(var col = 1; col <= cols; col++){
        $(".footer-inner").append('<div class="f-col" id="f-col-'+col+'"></div>');
        var curCol = $(document.getElementById("f-col-"+col));
        var curH = 0;
        for (ind; ind < fakeFooter.find(".footer-row").length; ind++) {
            curH += fakeFooter.find(".footer-row").eq(ind).height();
            if (curH <= colH) {
                curCol.append(fakeFooter.find(".footer-row").eq(ind).clone());
            } else {break;}
        }
    }
    var mH = 0;
    $("#footer .f-col").each(function(){
        if ($(this).height() > mH) mH = $(this).height();
    });
    $("#footer .f-col").height(mH + 10);
    fakeFooter.remove();
}

function submenuCols(sub, cols, parentId){
    var colW =  Math.ceil((subW - (21*(cols - 1))) / cols);
    var ind = 0;
    sub.parents(".submenu-inner").append('<div id="fake-submenu"></div>');
    var fakefSub = $(document.getElementById("fake-submenu"));
    fakefSub.append(fakeSub.html());
    fakefSub.find(".s-col").width(colW);
    sub.html("");
    var colH = Math.ceil(fakefSub.outerHeight() / cols)+10;
    fakefSub.find(".s-col").each(function(){
        if ($(this).outerHeight() >= colH) {colH = $(this).outerHeight()}
    });
    for(var col = 1; col <= cols; col++){
        sub.append('<div class="submenu-col" id="submenu-col-'+col+'-'+parentId+'"></div>');
        var curCol = $(document.getElementById("submenu-col-"+col+'-'+parentId));
        var curH = 0;
        for (ind; ind < fakefSub.find(".s-col").length; ind++) {
            curH += fakefSub.find(".s-col").eq(ind).outerHeight();
            if (col != cols) {
                if (curH <= colH) {
                    curCol.append(fakefSub.find(".s-col").eq(ind).clone());
                } else {break;}
            } else {
                curCol.append(fakefSub.find(".s-col").eq(ind).clone());
            }
        }
    }
    fakefSub.remove();
}

function strangeTabs(){
    $(".strange-tabs .tab-content").width($(".rside-detail").width());
    $(".mid-single").css("min-height", $(".strange-tabs .tab.active .tab-content").height());
}

function adaptiveCrossTable(){
    if ($(document).find(".table-cross") && $(window).width() <= 480){
        $(".table-cross").each(function(){
            if (!$(this).hasClass("transformed")){
                $(this).addClass("transformed");
                var table = $(this);
                var transformTable = $("<div class='div-table-cross'></div>").insertAfter(table);
                for(var i = 1; i < table.find("tr:eq(1) td").length; i++){
                    var item = $("<div class='item'></div>");
                    var col;
                    var row = $("<div class='row'></div>");
                    col = $("<div class='col'></div>");
                    col.html(table.find("thead tr th:eq(0)").html());
                    row.append(col);
                    col = $("<div class='col'></div>");
                    col.html(table.find("thead tr th:eq(" + i + ")").html());
                    row.append(col);
                    item.append(row);
                    for (var j = 1; j <= table.find("tbody tr").length; j++){
                        row = $("<div class='row'></div>");
                        col = $("<div class='col'></div>");
                        col.html(table.find("tr:eq(" + j + ") td:eq(0)").html());
                        row.append(col);
                        col = $("<div class='col'></div>");
                        col.html(table.find("tr:eq(" + j + ") td:eq(" + i + ")").html());
                        row.append(col);
                        item.append(row);
                    }
                    transformTable.append(item);
                }
            }
        });
        resizeCrossTable();
    }
}

function resizeCrossTable(){
    $(".div-table-cross").each(function(){
        var transformTable = $(this);
        transformTable.find(".row").each(function(){
            var mH = 0;
            $(this).find(".col").each(function(){
                console.log($(this).outerHeight());
                if ($(this).height() > mH) mH = $(this).height();
            });
            $(this).find(".col").height(mH);
        });
    });
}

function recipeProducts(){
    if ($(window).width() >= 1024){
        $(".popup-window").css({
            "width": 760,
            "margin-left": -380
        });
        if ($(".popup-window").hasClass("auth-popup")) $(".auth-popup").css({
            "width": 600,
            "margin-left": -300
        });
    } else {
        $(".popup-window").css({
            "width": $(window).width() - 30,
            "margin-left": - ($(window).width() - 30)/2
        });
        if ($(window).width() > 640){
            if ($(".popup-window").hasClass("auth-popup")) $(".auth-popup").css({
                "width": 600,
                "margin-left": -300
            });
        }
    }

    if ($(document).find("recipe-products").length){
        $(".trades-list").each(function(){
            var elem = $(this);
            elem.carouFredSel({
                items:{
                    visible: 1,
                    height: 64,
                    width: 62
                },
                align: "left",
                scroll: {
                    items: 1
                },
                width: 62,
                height: 64,
                next: elem.parents(".preview").find(".next"),
                prev: elem.parents(".preview").find(".prev"),
                auto: false
            })
        });
    }

    $(".popup-window").css({
        "top": $(window).scrollTop() + 20
    });
}

var fCol;
var vis;
var visF;
var tradesScroll = 1;
var subCol;

var ua = navigator.userAgent.toLowerCase();
var isMobile = ua.indexOf("mobile") > -1;
var isAndroid = ua.indexOf("android") > -1;

               $(document).ready(function(){
                    mainMenu();
               });
$(window).load(function(){

    if ($(window).width()<=480) {
        vis = 1;
        fCol = 1;
        tradesScroll = 1;
    } else if ($(window).width()<680){
        fCol = 3;
        vis = 2;
        subCol = 3;
    } else if ($(window).width()<1024) {
        vis = 3;
        visF = 1;
        fCol = 3;
        subCol = 4;
    } else {
        vis = 4;
        visF = 2;
        fCol = 4;
        subCol = 3;
    }

    mainMenu();

    /*fMenu = $(".footer-inner").innerHeight();
    fakeMenu = $("<div class='footer-fake'></div>");
    $("#footer .footer-row").each(function(){
        fakeMenu.append($(this));
    });*/

    /*footerMenu(fCol);*/

    resizeFooter();

    if ($(document).find(".popup-window").length) recipeProducts();

    if (document.getElementById("main-slider")){
        $("#main-slider .slides").carouFredSel({
            responsive: true,
            items:{
                visible:1
            },
            width: "100%",
            pagination: "#main-slider .pagination",
            next: "#main-slider .next",
            prev: "#main-slider .prev",
            auto:{
                timeoutDuration: 7000,
                easing: "swing",
                duration: 800
            },
            swipe:{
                onTouch: true,
                onMouse: true,
                duration: 300
            }
        });
    }

    if ($(document).find(".catalog-slider").length>0) {

        if (document.getElementById("top-slider")){
            $("#top-slider .trades").carouFredSel({
                responsive: true,
                items:{
                    visible: vis,
                    height: "variable"
                },
                scroll: {
                    items: tradesScroll,
                    duration        : 1000,                         
                    pauseOnHover    : true
                },
                width: "100%",
                 next: "#top-slider .next",
                 prev: "#top-slider .prev",
                auto: {
                    play: true,
                    delay: 7000
                },
                swipe:{
                    onTouch: true,
                    onMouse: true,
                    duration: 300
                }
            });   
        }

        if (document.getElementById("popular-slider")){
            $("#popular-slider .trades").carouFredSel({
                responsive: true,
                items:{
                    visible: vis,
                    height: "variable"
                },
                scroll: {
                    items: tradesScroll,
                    duration        : 1000,                         
                    pauseOnHover    : true
                },
                width: "100%",
                next: "#popular-slider .next",
                prev: "#popular-slider .prev",
                auto: {
                    play: true,
                    delay: 7000
                },
                swipe:{
                    onTouch: true,
                    onMouse: true,
                    duration: 10000
                }
            });
        }

    }

    if (document.getElementById("feedbacks-slider")){
        $("#feedbacks-slider .slides").carouFredSel({
            responsive: true,
            align: "left",
            items:{
                visible: visF,
                height: "variable"
            },
            scroll: {
                items: 1
            },
            width: "100%",
            next: "#feedbacks-slider .next",
            prev: "#feedbacks-slider .prev",
            auto: false,
            swipe:{
                onTouch: true,
                onMouse: true,
                duration: 300
            }
        });
    }

    adaptiveCrossTable();

    if ($(document).find("ul.size-tabs").length > 0){
        if ($(".size-tabs .size-tab.active .toggle-section.active").length == 0) {
            $(".size-tabs .size-tab.active .toggle-section:eq(0)").addClass("active");
        }
        $(".size-tabs .size-tab.active").css({
            "min-height": $(".size-tabs .size-tab.active").find(".content").outerHeight() + $(".size-tabs .size-tab.active .top-level").outerHeight() + 10
        });
    }

    $(".div-link").click(function(){
        window.location.href = $(this).attr("data-href");
    });

    $(".button-search").click(function(){
        if ($(window).width()<=480) {
            if (!$(".search-field").hasClass("open")) {
                if ($(".menu-toggle").hasClass("open")) {
                    $(".menu-toggle").removeClass("open");
                    $("#main-menu .menu").slideUp(300, function(){
                        $("#main-menu .menu").removeAttr("style");
                    });
                }
                $(".search-field").addClass("open").css({
                    "padding-left": 8,
                    "position": "absolute",
                    "z-index": 2000
                });
                var inW = $("#header .bottom-section").width() - parseInt($(".search-field").css("padding-left")) - parseInt($(".search-field").css("padding-right"));
                $(".search-field").animate({
                    "width": inW
                }, 300);
                return false;
            } else {
                
                	/* Search */
            		url = $('base').attr('href') + 'index.php?route=product/search';
            				 
            		var filter_name = $('input[name=\'filter_name\']').attr('value');
            		
            		if (filter_name) {
            			url += '&filter_name=' + encodeURIComponent(filter_name);
            		}
            		
            		location = url;
                
            }
        } else {
            	/* Search */
        		url = $('base').attr('href') + 'index.php?route=product/search';
        				 
        		var filter_name = $('input[name=\'filter_name\']').attr('value');
        		
        		if (filter_name) {
        			url += '&filter_name=' + encodeURIComponent(filter_name);
        		}
        		
        		location = url;
        }
    });

    if(isMobile) {

        $("#main-menu li.top-level > a").bind("click", function(e){
            if ($(window).width() > 480) {
                var liElem = $(this).parent();
                var clicked = $(e.target),
                    clickedClass = clicked.prop("class");
                $("#main-menu li.top-level.hover").not(liElem).find(".submenu").hide();
                $("#main-menu li.top-level").not(liElem).removeClass("hover");
                liElem.toggleClass("hover");
                if (liElem.hasClass("hover")) {
                    liElem.find(".submenu").css({
                        "width": $("#main-menu").width(),
                        "left": - liElem.position().left
                    });

                    liElem.find(".submenu").show(300, function(){
                        subW = $(this).find(".main-col").width();
                        subH = $(this).find(".main-col").height();
                        fakeSub = $("<div class='sub-fake'></div>");
                        $(this).find(".main-col .s-col").each(function(){
                            fakeSub.append($(this));
                        });
                        submenuCols($(this).find(".main-col"), subCol, $(this).parents(".top-level").index());
                    });

                } else {
                    if (clicked.parents("div").hasClass("submenu")) {} else {
                        liElem.removeClass("hover").find(".submenu").hide();
            
                    }
                }
                return false;
            } else {
                
            }
        });

    } else {

        $("#main-menu li.top-level").hover(function(){

            if ($(window).width() > 480){

                $(this).addClass("hover");
                $(this).find(".submenu").css({
                    "width": $("#main-menu").width(),
                    "left": - $(this).position().left
                });
                $(this).find(".submenu").show(200, function(){
                    subW = $(this).find(".main-col").width();
                    subH = $(this).find(".main-col").height();
                    fakeSub = $("<div class='sub-fake'></div>");
                    $(this).find(".main-col .s-col").each(function(){
                        fakeSub.append($(this));
                    });
                    submenuCols($(this).find(".main-col"), subCol, $(this).parents(".top-level").index());

                });

            }
        }, function(){
            $(this).removeClass("hover").find(".submenu").hide();
        });

    }

    $("body").bind("click", function(e){
        var clicked = $(e.target),
            clickedClass = clicked.prop("class");

        if(!isMobile) {
            if (clicked.parents("div").hasClass("ask-question")) {} else {
                $(".ask-question").animate({
                    "left": -273
                }, 300, function(){
                    $(".ask-question .q-link").removeClass("open");
                    $(".ask-question").removeAttr("style");
                });
            }
        } else {
            if ($("#main-menu li.top-level").hasClass("hover")) {
                if (clicked.parents("li").hasClass("hover")) {} else {
                    $("#main-menu li.top-level.hover").removeClass("hover").find(".submenu").hide();
                }
            }
        }
        if ($(window).width() <= 480) {
            if(clicked.hasClass("search-field")){}else{
                $(".search-field").animate({
                    "width": 0
                }, 300, function(){
                    $(".search-field").removeClass("open").removeAttr("style");
                });
            }

            if (clicked.hasClass("menu")) {} else {
                $(".menu-toggle").removeClass("open");
                $("#main-menu .menu").slideUp(300, function(){
                    $("#main-menu .menu").removeAttr("style");
                    $('.divider_mini').removeClass('show');
                });
            }
        }

        if (!clicked.parents("div").hasClass("div-select")) $(".div-select").removeClass("open");
    });

    $(".menu-toggle").click(function(){
        $(this).toggleClass("open");
        $("#main-menu .menu").width($("#header .bottom-section").width());
        /*-if($('.divider_mini').css('display') == 'none'){
            $('.divider_mini').css('display', 'block');
        } else {
            $('.divider_mini').css('display', 'none');
        }-*/
        
        $('.divider_mini').toggleClass('show');
        $("#main-menu .menu").slideToggle(200, function(){
            if (!$(".menu-toggle").hasClass("open")) $("#main-menu .menu").removeAttr("style");
        });
        return false;
    });

    $(".ask-question .q-link").click(function(){
        $(this).toggleClass("open");
        if ($(this).hasClass("open")){
            $(".ask-question").animate({
                "left": 0
            }, 300, function(){
               $(".ask-question").css({
                   "position": "absolute",
                   "top": $(window).scrollTop() + ($(window).height())/2
               });
            });
        } else {
            $(".ask-question").animate({
                "left": -273
            }, 300, function(){
                $(".ask-question").removeAttr("style");
            });
        }
        return false;
    });

    $("#scroll-top").click(function(){

       $('html, body').animate({scrollTop:0},{duration: 500});
/*	   $.scrollTo("#header",500);*/
    });

    $(".view-mode a").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        $(".catalog").removeClass("grid").removeClass("list");
        $(".catalog").addClass(this.id);
        return false;
    });

    $(".catalog-menu li.top-level a.top-level").click(function(){
        $(".catalog-menu li.top-level").not($(this).parent()).removeClass("active");
        $(this).parent().toggleClass("active");
        
        var tt = $(this).parent().find('ul');
        
        if(tt.length > 0){
            return false;
        }
        
    });

    $(".sort-title").click(function(){
        if ($(window).width() <= 480){
            $(this).siblings("ul").slideToggle(200);
        }
        return false;
    });

    if (document.getElementById("thumbs")){
        $("#thumbs .thumbs").carouFredSel({
            responsive: true,
            items:{
                visible: 3,
                height: "variable"
            },
            align: "left",
            scroll: {
                items: 1
            },
            width: "100%",
            height: "auto",
            next: "#thumbs .next",
            prev: "#thumbs .prev",
            auto: false,
            swipe:{
                onTouch: true,
                onMouse: true,
                duration: 300
            }
        });

        function thumbClick(elem){
		/*var big_img=elem.attr("data-zoomsrc1");
		//$("#im_zoom .mojozoom_img").attr("src",big_img);
		MojoZoom.makeZoomable(  
    document.getElementById("im"),   
    big_img,  
    document.getElementById("im_zoom"),  
    150, 150,  
    true  
);  */
            $("#gallery .preview a").attr("href",elem.attr("href"));
            $("#gallery .preview img").attr("src", elem.attr("href"));
        }

        $("#thumbs a").bind("click", function(){
            thumbClick($(this));
            return false;
        });

        $("#gallery .preview a").click(function(e){
            if ($(window).width()>480) {
                e.preventDefault();
                $("#thumbs a").unbind("click");
                $("#thumbs a").fancybox({
                    cyclic: true,
                    nextEffect : 'none',
                    prevEffect : 'none',
                    arrows: true,
                    afterClose: function(){
                        $("#thumbs a").unbind("click");
                        $("#thumbs a").bind("click", function(){
                            thumbClick($(this));
                            return false;
                        });
                    }
                });
                $("#thumbs a[href='"+$(this).find("img").attr("src")+"']").click();
            }
            return false;
        });
    }


    $(".trade-features li .title").click(function(){
        if ($(window).width() <= 480){
            $(".trade-features li.feature").not($(this).parent()).removeClass("active");
            $(this).parent().toggleClass("active");
            return false;
        }
    });

    $(".div-select .current").live("click", function(){
        $(".div-select").not($(this).parents(".div-select")).removeClass("open");
        $(this).parents(".div-select").toggleClass("open");
    });

    $(".div-select .options li").live("click", function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        $(this).parents(".div-select").find(".current .text").html($(this).html());
       /*- $(this).parents(".div-select").find("input[type='hidden']").val($(this).find("span").text());-*/
        $(this).parents(".div-select").removeClass("open");
    });

    $(".strange-tabs .tab .title").click(function(){
        $(this).parent().siblings().removeClass("active");
        $(this).parent().addClass("active");
        resizeCrossTable();
        if ($(document).find("ul.size-tabs").length > 0){
            $(".size-tabs .size-tab.active").css({
                "min-height": $(".size-tabs .size-tab.active").find(".content").outerHeight() + $(".size-tabs .size-tab.active .top-level").outerHeight() + 10
            });
        }
        if ($(window).width() > 480) strangeTabs();
        return false;
    });
    
    $(".rews_top").click(function(){
        $('#rews').parent().siblings().removeClass("active");
        $('#rews').parent().addClass("active");
        resizeCrossTable();
        if ($(document).find("ul.size-tabs").length > 0){
            $(".size-tabs .size-tab.active").css({
                "min-height": $(".size-tabs .size-tab.active").find(".content").outerHeight() + $(".size-tabs .size-tab.active .top-level").outerHeight() + 10
            });
        }
        if ($(window).width() > 480) strangeTabs();
        
        window.scrollTo(0, $('.mid-single').offset().top -20);
        return false;
    });


    $(".size-tabs .size-tab .top-level").live("click", function(){
        $(this).parent().siblings().removeClass("active").removeAttr("style");
        $(this).parent().toggleClass("active");
        resizeCrossTable();
        if ($(this).parent().hasClass("active")){
            if ($(".size-tabs .size-tab.active .toggle-section.active").length == 0) {
                $(".size-tabs .size-tab.active .toggle-section:eq(0)").addClass("active");
            }
            $(this).parent().css({
                "min-height": $(this).parent().find(".content").outerHeight() + $(this).outerHeight() + 10
            });
        }
        strangeTabs();
        return false;
    });

    $(".size-tabs .size-tab .toggle-title").click(function(){
        if ($(window).width() <= 480){
            $(this).parents(".toggle-section").siblings().removeClass("active");
            $(this).parents(".toggle-section").toggleClass("active");
            if ($(".size-tabs .size-tab.active .toggle-section.active").length == 0) {
                $(".size-tabs .size-tab.active .toggle-section:eq(0)").addClass("active");
            }
            resizeCrossTable();
            $(".size-tabs .size-tab.active").css({
                "min-height": $(".size-tabs .size-tab.active").find(".content").outerHeight() + $(".size-tabs .size-tab.active .top-level").outerHeight() + 10
            });
        }
    });

    $(".t-collapse").live('click', function(){
        $(this).parents("table.table-shortinfo").toggleClass("collapsed");
        return false;
    });

    $(".add-feedback").live('click', function(){
        $(".feed-wrap").remove();
        $("<div class='feed-wrap'></div>").load("index.php?route=product/product/form_review&review_id=" + $(this).attr('data-id'), function(){
            $(".add-feedback, .reply").removeClass("active");
            $(".add-feedback").addClass("active");
            strangeTabs();
            rating_init();
        }).insertAfter($(this).parent());
        
        return false;
    });

    $(".reply").live('click', function(){
        var btn = $(this);
        $(".feed-wrap").remove();
        $("<div class='feed-wrap'></div>").load("index.php?route=product/product/form_review&review_id=" + $(this).attr('data-id'), function(){
            $(".add-feedback, .reply").removeClass("active");
            btn.addClass("active");
            strangeTabs();
            rating_init();
        }).insertAfter($(this).closest(".feedback"));
        
        return false;
    });


    $(".show_answers").live('click', function(){
        $(this).parents('li').children('ul').slideToggle(500, function(){
        strangeTabs();     
        });
       
    });

    $(".buy-ingredients, .delivery-map-link").click(function(){
        if ($(window).scrollTop() > 0) {
            $(".popup-window").css({
                "top": $(window).scrollTop() + 20
            });
        }
        $(".popup-window").show();
        return false;
    });

/*-ϲ뱻󺡮뮮 흇���ᣨ콭易𐯤򣦲믩-*/
    $(".fancy-login").click(function() {
        $(".auth-popup").show();
        $('#registr .auth-title').css('color', '#999');
        $('#registr .button-reg').css('background-color', '#999');
        $('#login .auth-title').css('color', '#669ACC');
        $('#login .button-login').css('background-color', '#669ACC');
        $('body').append('<div id="mask"></div>')
        return false;
    });
    $(".fancy-reg").click(function() {
        $('#login .auth-title').css('color', '#999');
        $('#login .button-login').css('background-color', '#999');
        $('#registr .auth-title').css('color', '#99CC00');
        $('#registr .button-reg').css('background-color', '#99CC00');
        $(".auth-popup").show();
        $('body').append('<div id="mask"></div>')
        return false;
    });
    
    /*-Ю岢泪ힺ���񦡴﫳򣫪/
    $("#registr input").focus(function() {
        $('#login .auth-title').css('color', '#999');
        $('#login .button-login').css('background-color', '#999');
        $('#registr .auth-title').css('color', '#99CC00');
        $('#registr .button-reg').css('background-color', '#99CC00');
        return false;
    });
    
    $("#login input").click(function() {
        $('#registr .auth-title').css('color', '#999');
        $('#registr .button-reg').css('background-color', '#999');
        $('#login .auth-title').css('color', '#669ACC');
        $('#login .button-login').css('background-color', '#669ACC');
        return false;
    });

   /*- $(".fancy-thumb").click(function(){
        if ($(window).width() > 480) {
            $($(this).attr("href")).css({
                "top": $(this).offset().top - $($(this).attr("href")).height(),
                'margin-left':-$($(this).attr("href")).width()/2
            });
            $($(this).attr("href")).show();
        } else {
            callPlayer('videoY', 'playVideo');
        }
        return false;
    });-*/

    $(".recipe-products .close").live("click", function(){
        $(this).parent().hide();
        $("#mask").remove();
        return false;
    });
    
    $("#mask").live("click", function(){
        $(".recipe-products").hide();
        $(this).remove();
        return false;
    });
    
     $(".video .close").live("click", function(){
        $(this).parents(".video").hide();
        if ($(this).parents(".video").hasClass("video-popup")) {
            callPlayer('videoY', 'stopVideo');
        }
        return false;
    });

    $(".returns-menu a").click(function(){
        $(this).parent().siblings().removeClass("active");
        $(this).parent().addClass("active");
        $(".returns-block").removeClass("active");
        $($(this).attr("href")).addClass("active");
        return false;
    });

    $(".registration-container.last-step .mid-col .change").click(function(){
        $(this).toggleClass("active");
        if ($(this).hasClass("active")) $(".comment-form").slideDown(400);
        else $(".comment-form").slideUp(400);
        return false;
    });

    if ($(document).find(".service-menu").length) {
        $(".service-menu li.top-level").each(function(){
            if (!$(this).find("ul").length) $(this).addClass("single-level");
        });
    }

    $(".auth-title").live("click", function(){
        if ($(window).width() <= 480) {
            $('.auth-title').removeClass("toggled");
            $(this).toggleClass("toggled");
        }
        return false;
    });

    if (document.getElementById("remember")) $("#remember").tiCheckbox({
        margin: "8"
    });

    if ($(document).find(".registration-container").length) $(".registration-container+.registration-container input[type='checkbox'], .registration-container input[type='radio']").tiCheckbox({
        margin: "12"
    });

    if ($(document).find(".newsletter-page").length) $(".newsletter-page input[type='checkbox']").tiCheckbox({
        margin: "5"
    });

function rating_init(){
    
    /* рейтинг */
    $(".feedback-form .raiting").hover(function(){
        if ($(this).find('span').length == 0) $(this).append("<span></span>");
    }, function(){ /* при уходе с рейтинга, удаляем блок с подсветкой */
    
        /*-if (!$(this).hasClass("disable")) $(this).find("span").remove();-*/
        if($(this).find("span").eq(0).attr('data-rating') > 0){
            $(this).find("span").eq(0).css("width",$(this).find("span").eq(0).attr('data-rating')*15+"px");
        } else {
            $(this).find("span").eq(0).css("width","0px");
        }
    });


    var rating;

    $(".feedback-form .raiting").mousemove(function(e){
        if (!$(this).hasClass("disable")){
            if (!e) e = window.event;
            if (e.pageX){
                x = e.pageX;
            } else if (e.clientX){
                x = e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft) - document.documentElement.clientLeft;

            }
            var posLeft = 0;
            var obj = this;
            while (obj.offsetParent)
            {
                posLeft += obj.offsetLeft;
                obj = obj.offsetParent;
            }
            var offsetX = x-posLeft,
                modOffsetX = 5*offsetX%this.offsetWidth; /* 5 - число возможных оценок */
            rating = parseInt(5*offsetX/this.offsetWidth);

            if(modOffsetX > 0) rating+=1;

            $(this).find("span").eq(0).css("width",rating*15+"px"); /* ширина одной оценки, в данном случае одной звезды */
        }
    });

    $(".feedback-form .raiting").click(function(){
        /*-$(this).addClass('disable').find("span").eq(0).attr('data-rating', rating).css("width",rating*15+"px");-*/
        $(this).find("span").eq(0).attr('data-rating', rating).css("width",rating*15+"px");
        return false;
    });
}

rating_init();

});




function globalResize(){
    mainMenu();

    if ($(window).width()<=480) {
        vis = 1;
        fCol = 1;
        tradesScroll = 1;
    } else if ($(window).width()<680){
        fCol = 3;
        vis = 2;
        subCol = 3;
        tradesScroll = 2;
    } else if ($(window).width()<1024) {
        vis = 3;
        visF = 1;
        fCol = 3;
        subCol = 4;
        tradesScroll = 2;
    } else {
        vis = 4;
        visF = 2;
        fCol = 4;
        subCol = 3;
        tradesScroll = 2;
    }

    if ($(window).width() > 480) {
        if ($(document).find("ul.sorting-groups").length > 0){
            $("ul.sorting-groups").removeAttr("style");
        }
    }

    /*footerMenu(fCol);*/

    resizeFooter();

    if ($(document).find(".popup-window").length) recipeProducts();

    $("#main-slider .slides").trigger("configuration", ["reInit", true]);

    if ($("#main-menu .top-level").hasClass("hover")) {
        $("#main-menu .top-level.hover").removeClass("hover").find(".submenu").hide();
    }

    if ($("#main-menu li.top-level").hasClass("hover")){
        $("#main-menu li.top-level.hover").find(".divider").width($("#main-menu li.top-level.hover").width())
    }

    if ($(document).find(".catalog-slider").length>0) {

        $("#top-slider .trades").trigger("configuration", ["items.visible", vis]);
        $("#top-slider .trades").trigger("configuration", ["reInit", true]);

        $("#popular-slider .trades").trigger("configuration", ["items.visible", vis]);
        $("#popular-slider .trades").trigger("configuration", ["reInit", true]);
    }

    if (document.getElementById("feedbacks-slider")){

        $("#feedbacks-slider .slides").trigger("configuration", ["items.visible", visF]);
        $("#feedbacks-slider .slides").trigger("configuration", ["reInit", true]);
    }

    if (document.getElementById("#thumbs")){
        $("#thumbs .thumbs").trigger("configuration", ["reInit", true]);
    }

    adaptiveCrossTable();

    if ($(document).find("ul.size-tabs").length > 0){
        $(".size-tabs .size-tab.active").css({
            "min-height": $(".size-tabs .size-tab.active").find(".content").outerHeight() + $(".size-tabs .size-tab.active .top-level").outerHeight() + 30
        });
    }

    if ($(document).find("ul.strange-tabs").length > 0 && ($(window).width() > 480)){
        strangeTabs();
    }
}

/*if(isMobile && !isAndroid) {

    $(window).bind( 'orientationchange', function(e){
        globalResize();
    });

} else {*/

    $(window).resize(function(){
        globalResize();
    });

//}


$(window).scroll(function(){
    scroll_top=$(window).scrollTop();
    if (scroll_top > $(window).height()/2) {
        $("#scroll-top").css("display", "block");
    } else {
        $("#scroll-top").css("display", "none");
    }
});











