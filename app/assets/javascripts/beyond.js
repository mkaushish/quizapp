/*Sets Themed Colors Based on Themes*/

var themeprimary = getThemeColorFromCss('themeprimary');
var themesecondary = getThemeColorFromCss('themesecondary');
var themethirdcolor = getThemeColorFromCss('themethirdcolor');
var themefourthcolor = getThemeColorFromCss('themefourthcolor');
var themefifthcolor = getThemeColorFromCss('themefifthcolor');

//Gets Theme Colors From Selected Skin To Use For Drawing Charts
function getThemeColorFromCss(style) {
    var $span = $("<span></span>").hide().appendTo("body");
    $span.addClass(style);
    var color = $span.css("color");
    $span.remove();
    return color;
}

//Handle RTL SUpport for Changer CheckBox
$("#skin-changer li a").click(function () {
    createCookie("current-skin", $(this).attr('rel'), 10);
    window.location.reload();
});

//Checks Not to Do rtl-support for Arabic and Persian Demo Pages

/*var rtlchanger = document.getElementById('rtl-changer');

if (location.pathname != "/index-rtl-fa.html" && location.pathname != "/index-rtl-ar.html") {
    if (readCookie("rtl-support")) {
        switchClasses("pull-right", "pull-left");
        switchClasses("databox-right", "databox-left");
        switchClasses("item-right", "item-left");
        $('.navbar-brand small img').attr('src', 'assets/img/logo-rtl.png')
        if (rtlchanger != null)
            document.getElementById('rtl-changer').checked = true;
    }
    else {
        if (rtlchanger != null)
            rtlchanger.checked = false;
    }

    if (rtlchanger != null) {
        rtlchanger.onchange = function () {
            if (this.checked) {
                createCookie("rtl-support", "true", 10);
            }
            else {
                eraseCookie("rtl-support");
            }
            setTimeout(function () {
                window.location.reload();
            }, 600);

        };
    }
}*/
/*Loading*/
$(document)
    .ready(function () {
        setTimeout(function () {
            $('.loading-container')
                .addClass('loading-inactive');
        }, 0);
    });


/*Account Area --> Setting Button*/




function setCookiesForFixedSettings() {
    createCookie("navbar-fixed-top", $('#checkbox_fixednavbar').is(':checked'), 100);
    createCookie("sidebar-fixed", $('#checkbox_fixedsidebar').is(':checked'), 100);
    createCookie("breadcrumbs-fixed", $('#checkbox_fixedbreadcrumbs').is(':checked'), 100);
    createCookie("page-header-fixed", $('#checkbox_fixedheader').is(':checked'), 100);
}
/*#endregion handle Settings*/

/*#region Get Colors*/
//Get colors from a string base on theme colors
function getcolor(colorString) {
    switch (colorString) {
        case ("themeprimary"):
            return themeprimary;
        case ("themesecondary"):
            return themesecondary;
        case ("themethirdcolor"):
            return themethirdcolor;
        case ("themefourthcolor"):
            return themefourthcolor;
        case ("themefifthcolor"):
            return themefifthcolor;
        default:
            return colorString;
    }
}
/*#endregion Get Colors*/

//Switch Classes Function
function switchClasses(firstClass, secondClass) {

    var firstclasses = document.getElementsByClassName(firstClass);

    for (i = firstclasses.length - 1; i >= 0; i--) {
        if (!hasClass(firstclasses[i], 'dropdown-menu')) {
            addClass(firstclasses[i], firstClass + '-temp');
            removeClass(firstclasses[i], firstClass);
        }
    }

    var secondclasses = document.getElementsByClassName(secondClass);

    for (i = secondclasses.length - 1; i >= 0; i--) {
        if (!hasClass(secondclasses[i], 'dropdown-menu')) {
            addClass(secondclasses[i], firstClass);
            removeClass(secondclasses[i], secondClass);
        }
    }

    tempClasses = document.getElementsByClassName(firstClass + '-temp');

    for (i = tempClasses.length - 1; i >= 0; i--) {
        if (!hasClass(tempClasses[i], 'dropdown-menu')) {
            addClass(tempClasses[i], secondClass);
            removeClass(tempClasses[i], firstClass + '-temp');
        }
    }
}

//Add Classes Function
function addClass(elem, cls) {
    var oldCls = elem.className;
    if (oldCls) {
        oldCls += " ";
    }
    elem.className = oldCls + cls;
}

//Remove Classes Function
function removeClass(elem, cls) {
    var str = " " + elem.className + " ";
    elem.className = str.replace(" " + cls, "").replace(/^\s+/g, "").replace(/\s+$/g, "");
}

//Has Classes Function
function hasClass(elem, cls) {
    var str = " " + elem.className + " ";
    var testCls = " " + cls + " ";
    return (str.indexOf(testCls) != -1);
}