// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require bootbox
//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/sass
//= require codemirror/modes/shell
//= require codemirror/modes/sql
//= require codemirror/modes/slim
//= require codemirror/modes/nginx
//= require codemirror/modes/markdown
//= require codemirror/modes/javascript
//= require codemirror/modes/http
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/haml
//= require codemirror/modes/xml
//= require codemirror/modes/css
//= require codemirror/modes/yaml
//= require codemirror/modes/slim
//= require codemirror/modes/php
//= require summernote
//= require lang/summernote-ko-KR
//= require jquery-ui/sortable
//= require jquery-ui/effect-highlight
//= require_tree .

$(document).ready(function(){
$('#btn-setting').on('click', function (e) {
        $('.navbar-account')
            .toggleClass('setting-open');
    });

/*Toggle FullScreen*/
$('#fullscreen-toggler')
    .on('click', function (e) {
        var element = document.documentElement;
        if (!$('body')
            .hasClass("full-screen")) {

            $('body')
                .addClass("full-screen");
            $('#fullscreen-toggler')
                .addClass("active");
            if (element.requestFullscreen) {
                element.requestFullscreen();
            } else if (element.mozRequestFullScreen) {
                element.mozRequestFullScreen();
            } else if (element.webkitRequestFullscreen) {
                element.webkitRequestFullscreen();
            } else if (element.msRequestFullscreen) {
                element.msRequestFullscreen();
            }

        } else {

            $('body')
                .removeClass("full-screen");
            $('#fullscreen-toggler')
                .removeClass("active");

            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            }

        }
    });

/*Handles Popovers*/
var popovers = $('[data-toggle=popover]');
$.each(popovers, function () {
    $(this)
        .popover({
            html: true,
            template: '<div class="popover ' + $(this)
                .data("class") +
                '"><div class="arrow"></div><h3 class="popover-title ' +
                $(this)
                .data("titleclass") + '">Popover right</h3><div class="popover-content"></div></div>'
        });
});

var hoverpopovers = $('[data-toggle=popover-hover]');
$.each(hoverpopovers, function () {
    $(this)
        .popover({
            html: true,
            template: '<div class="popover ' + $(this)
                .data("class") +
                '"><div class="arrow"></div><h3 class="popover-title ' +
                $(this)
                .data("titleclass") + '">Popover right</h3><div class="popover-content"></div></div>',
            trigger: "hover"
        });
});


/*Handles ToolTips*/
$("[data-toggle=tooltip]")
    .tooltip({
        html: true
    });
    InitiateSideMenu();
InitiateSettings();
InitiateWidgets();

function InitiateSideMenu() {

    //Sidebar Toggler
    $(".sidebar-toggler").on('click', function () {
        $("#sidebar").toggleClass("hide");
        $(".sidebar-toggler").toggleClass("active");
        return false;
    });
    //End Sidebar Toggler

    //Sidebar Collapse
    var b = $("#sidebar").hasClass("menu-compact");
    $("#sidebar-collapse").on('click', function () {
        if (!$('#sidebar').is(':visible'))
            $("#sidebar").toggleClass("hide");
        $("#sidebar").toggleClass("menu-compact");
        $(".sidebar-collapse").toggleClass("active");
        b = $("#sidebar").hasClass("menu-compact");
        if (b) {
            $(".open > .submenu")
                .removeClass("open");
        }
    });
    //End Sidebar Collapse


    //Sidebar Menu Handle
    $(".sidebar-menu").on('click', function (e) {
        var menuLink = $(e.target).closest("a");
        if (!menuLink || menuLink.length == 0)
            return;
        if (!menuLink.hasClass("menu-dropdown")) {
            if (b && menuLink.get(0).parentNode.parentNode == this) {
                var menuText = menuLink.find(".menu-text").get(0);
                if (e.target != menuText && !$.contains(menuText, e.target)) {
                    return false;
                }
            }
            return;
        }
        var submenu = menuLink.next().get(0);
        if (!$(submenu).is(":visible")) {
            var c = $(submenu.parentNode).closest("ul");
            if (b && c.hasClass("sidebar-menu"))
                return;
            c.find("> .open > .submenu")
                .each(function () {
                    if (this != submenu && !$(this.parentNode).hasClass("active"))
                        $(this).slideUp(200).parent().removeClass("open");
                });
        }
        if (b && $(submenu.parentNode.parentNode).hasClass("sidebar-menu"))
            return false;
        $(submenu).slideToggle(200).parent().toggleClass("open");
        return false;
    });
    //End Sidebar Menu Handle
}

function InitiateWidgets() {
    $('.widget-buttons *[data-toggle="maximize"]').on("click", function (event) {
        event.preventDefault();
        var widget = $(this).parents(".widget").eq(0);
        var button = $(this).find("i").eq(0);
        var compress = "fa-compress";
        var expand = "fa-expand";
        if (widget.hasClass("maximized")) {
            if (button) {
                button.addClass(expand).removeClass(compress);
            }
            widget.removeClass("maximized");
            widget.find(".widget-body").css("height", "auto");
        } else {
            if (button) {
                button.addClass(compress).removeClass(expand);
            }
            widget.addClass("maximized");
            maximize(widget);
        }
    });

    $('.widget-buttons *[data-toggle="collapse"]').on("click", function (event) {
        event.preventDefault();
        var widget = $(this).parents(".widget").eq(0);
        var body = widget.find(".widget-body");
        var button = $(this).find("i");
        var down = "fa-plus";
        var up = "fa-minus";
        var slidedowninterval = 300;
        var slideupinterval = 200;
        if (widget.hasClass("collapsed")) {
            if (button) {
                button.addClass(up).removeClass(down);
            }
            widget.removeClass("collapsed");
            body.slideUp(0, function () {
                body.slideDown(slidedowninterval);
            });
        } else {
            if (button) {
                button.addClass(down)
                    .removeClass(up);
            }
            body.slideUp(slideupinterval, function () {
                widget.addClass("collapsed");
            });
        }
    });

    $('.widget-buttons *[data-toggle="dispose"]').on("click", function (event) {
        event.preventDefault();
        var toolbarLink = $(this);
        var widget = toolbarLink.parents(".widget").eq(0);
        var disposeinterval = 300;
        widget.hide(disposeinterval, function () {
            widget.remove();
        });
    });
}

// Fullscreen Widget
function maximize(widgetbox) {
    if (widgetbox) {
        var windowHeight = $(window).height();
        var headerHeight = widgetbox.find(".widget-header").height();
        widgetbox.find(".widget-body").height(windowHeight - headerHeight);
    }
}

/* Scroll To */
function scrollTo(el, offeset) {
    var pos = (el && el.size() > 0) ? el.offset().top : 0;
    jQuery('html,body').animate({ scrollTop: pos + (offeset ? offeset : 0) }, 'slow');
}

/*Show Notification*/
function Notify(message, position, timeout, theme, icon, closable) {
    toastr.options.positionClass = 'toast-' + position;
    toastr.options.extendedTimeOut = 0; //1000;
    toastr.options.timeOut = timeout;
    toastr.options.closeButton = closable;
    toastr.options.iconClass = icon + ' toast-' + theme;
    toastr['custom'](message);
}

/*#region handle Settings*/
function InitiateSettings() {
    /*if (readCookie("navbar-fixed-top") !=null) {
        if (readCookie("navbar-fixed-top") == "true") {
            $('#checkbox_fixednavbar').prop('checked', true);
            $('.navbar').addClass('navbar-fixed-top');
        }
    }

    if (readCookie("sidebar-fixed") !=null) {
        if (readCookie("sidebar-fixed") == "true") {
            $('#checkbox_fixedsidebar').prop('checked', true);
            $('.page-sidebar').addClass('sidebar-fixed');
        }
    }
    if (readCookie("breadcrumbs-fixed") != null) {
        if (readCookie("breadcrumbs-fixed") == "true") {
            $('#checkbox_fixedbreadcrumbs').prop('checked', true);
            $('.page-breadcrumbs').addClass('breadcrumbs-fixed');
        }
    }
    if (readCookie("page-header-fixed") != null) {
        if (readCookie("page-header-fixed") == "true") {
            $('#checkbox_fixedheader').prop('checked', true);
            $('.page-header').addClass('page-header-fixed');
        }
    }*/


    $('#checkbox_fixednavbar')
        .change(function () {
            $('.navbar')
                .toggleClass('navbar-fixed-top');

            if (($('#checkbox_fixedsidebar')
                .is(":checked"))) {
                $('#checkbox_fixedsidebar')
                    .prop('checked', false);
                $('.page-sidebar')
                    .toggleClass('sidebar-fixed');
            }

            if (($('#checkbox_fixedbreadcrumbs')
                .is(":checked")) && !($(this)
                .is(":checked"))) {
                $('#checkbox_fixedbreadcrumbs')
                    .prop('checked', false);
                $('.page-breadcrumbs')
                    .toggleClass('breadcrumbs-fixed');
            }

            if (($('#checkbox_fixedheader')
                .is(":checked")) && !($(this)
                .is(":checked"))) {
                $('#checkbox_fixedheader')
                    .prop('checked', false);
                $('.page-header')
                    .toggleClass('page-header-fixed');
            }
            setCookiesForFixedSettings();
        });

    $('#checkbox_fixedsidebar')
        .change(function () {

            $('.page-sidebar')
                .toggleClass('sidebar-fixed');

            if (!($('#checkbox_fixednavbar')
                .is(":checked"))) {
                $('#checkbox_fixednavbar')
                    .prop('checked', true);
                $('.navbar')
                    .toggleClass('navbar-fixed-top');
            }
            if (($('#checkbox_fixedbreadcrumbs')
                .is(":checked")) && !($(this)
                .is(":checked"))) {
                $('#checkbox_fixedbreadcrumbs')
                    .prop('checked', false);
                $('.page-breadcrumbs')
                    .toggleClass('breadcrumbs-fixed');
            }

            if (($('#checkbox_fixedheader')
                .is(":checked")) && !($(this)
                .is(":checked"))) {
                $('#checkbox_fixedheader')
                    .prop('checked', false);
                $('.page-header')
                    .toggleClass('page-header-fixed');
            }
            setCookiesForFixedSettings();

        });
    $('#checkbox_fixedbreadcrumbs')
        .change(function () {

            $('.page-breadcrumbs')
                .toggleClass('breadcrumbs-fixed');


            if (!($('#checkbox_fixedsidebar')
                .is(":checked"))) {
                $('#checkbox_fixedsidebar')
                    .prop('checked', true);
                $('.page-sidebar')
                    .toggleClass('sidebar-fixed');
            }
            if (!($('#checkbox_fixednavbar')
                .is(":checked"))) {
                $('#checkbox_fixednavbar')
                    .prop('checked', true);
                $('.navbar')
                    .toggleClass('navbar-fixed-top');
            }
            if (($('#checkbox_fixedheader')
                .is(":checked")) && !($(this)
                .is(":checked"))) {
                $('#checkbox_fixedheader')
                    .prop('checked', false);
                $('.page-header')
                    .toggleClass('page-header-fixed');
            }
            setCookiesForFixedSettings();

        });

    $('#checkbox_fixedheader')
        .change(function () {

            $('.page-header')
                .toggleClass('page-header-fixed');


            if (!($('#checkbox_fixedbreadcrumbs')
                .is(":checked"))) {
                $('#checkbox_fixedbreadcrumbs')
                    .prop('checked', true);
                $('.page-breadcrumbs')
                    .toggleClass('breadcrumbs-fixed');
            }

            if (!($('#checkbox_fixedsidebar')
                .is(":checked"))) {
                $('#checkbox_fixedsidebar')
                    .prop('checked', true);
                $('.page-sidebar')
                    .toggleClass('sidebar-fixed');
            }
            if (!($('#checkbox_fixednavbar')
                .is(":checked"))) {
                $('#checkbox_fixednavbar')
                    .prop('checked', true);
                $('.navbar')
                    .toggleClass('navbar-fixed-top');
            }

            setCookiesForFixedSettings();
        });
}
});