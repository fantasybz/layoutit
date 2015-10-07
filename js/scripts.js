function supportstorage() {
    if (typeof window.localStorage == 'object')
        return true;
    else
        return false;
}

function handleSaveLayout() {
    var e = $(".demo").html();
    if (!stopsave && e != window.demoHtml) {
        stopsave++;
        window.demoHtml = e;
        saveLayout();
        stopsave--;
    }
}

var layouthistory;
function saveLayout() {
    var data = layouthistory;
    if (!data) {
        data = {};
        data.count = 0;
        data.list = [];
    }
    if (data.list.length > data.count) {
        for (i = data.count; i < data.list.length; i++)
            data.list[i] = null;
    }
    data.list[data.count] = window.demoHtml;
    data.count++;
    if (supportstorage()) {
        localStorage.setItem("layoutdata", JSON.stringify(data));
    }
    layouthistory = data;
    //console.log(data);
    /*$.ajax({
     type: "POST",
     url: "/build/saveLayout",
     data: { layout: $('.demo').html() },
     success: function(data) {
     //updateButtonsVisibility();
     }
     });*/
}

function downloadLayout() {

    $.ajax({
        type: "POST",
        url: "/build/downloadLayout",
        data: { layout: $('#download-layout').html() },
        success: function (data) {
            window.location.href = '/build/download';
        }
    });
}

function downloadHtmlLayout() {
    $.ajax({
        type: "POST",
        url: "/build/downloadLayout",
        data: { layout: $('#download-layout').html() },
        success: function (data) {
            window.location.href = '/build/downloadHtml';
        }
    });
}

function undoLayout() {
    var data = layouthistory;
    //console.log(data);
    if (data) {
        if (data.count < 2) return false;
        window.demoHtml = data.list[data.count - 2];
        data.count--;
        $('.demo').html(window.demoHtml);
        if (supportstorage()) {
            localStorage.setItem("layoutdata", JSON.stringify(data));
        }
        return true;
    }
    return false;
    /*$.ajax({
     type: "POST",
     url: "/build/getPreviousLayout",
     data: { },
     success: function(data) {
     undoOperation(data);
     }
     });*/
}

function redoLayout() {
    var data = layouthistory;
    if (data) {
        if (data.list[data.count]) {
            window.demoHtml = data.list[data.count];
            data.count++;
            $('.demo').html(window.demoHtml);
            if (supportstorage()) {
                localStorage.setItem("layoutdata", JSON.stringify(data));
            }
            return true;
        }
    }
    return false;
    /*
     $.ajax({
     type: "POST",
     url: "/build/getPreviousLayout",
     data: { },
     success: function(data) {
     redoOperation(data);
     }
     });*/
}

function handleJsIds() {
    handleModalIds();
    handleAccordionIds();
    handleCarouselIds();
    handleTabsIds()
}
function handleAccordionIds() {
    var e = $(".demo #myAccordion");
    var t = randomNumber();
    var n = "accordion-" + t;
    var r;
    e.attr("id", n);
    e.find(".accordion-group").each(function (e, t) {
        r = "accordion-element-" + randomNumber();
        $(t).find(".accordion-toggle").each(function (e, t) {
            $(t).attr("data-parent", "#" + n);
            $(t).attr("href", "#" + r)
        });
        $(t).find(".accordion-body").each(function (e, t) {
            $(t).attr("id", r)
        })
    })
}
function handleCarouselIds() {
    var e = $(".demo #myCarousel");
    var t = randomNumber();
    var n = "carousel-" + t;
    e.attr("id", n);
    e.find(".carousel-indicators li").each(function (e, t) {
        $(t).attr("data-target", "#" + n)
    });
    e.find(".left").attr("href", "#" + n);
    e.find(".right").attr("href", "#" + n)
}
function handleModalIds() {
    var e = $(".demo #myModalLink");
    var t = randomNumber();
    var n = "modal-container-" + t;
    var r = "modal-" + t;
    e.attr("id", r);
    e.attr("href", "#" + n);
    e.next().attr("id", n)
}
function handleTabsIds() {
    var e = $(".demo #myTabs");
    var t = randomNumber();
    var n = "tabs-" + t;
    e.attr("id", n);
    e.find(".tab-pane").each(function (e, t) {
        var n = $(t).attr("id");
        var r = "panel-" + randomNumber();
        $(t).attr("id", r);
        $(t).parent().parent().find("a[href=#" + n + "]").attr("href", "#" + r)
    })
}
function randomNumber() {
    return randomFromInterval(1, 1e6)
}
function randomFromInterval(e, t) {
    return Math.floor(Math.random() * (t - e + 1) + e)
}
function gridSystemGenerator() {
    $(".lyrow .preview input").bind("keyup", function () {
        var e = 0;
        var t = "";
        var n = $(this).val().split(" ", 12);
        $.each(n, function (n, r) {
            e = e + parseInt(r);
            t += '<div class="span' + r + ' column"></div>'
        });
        if (e == 12) {
            $(this).parent().next().children().html(t);
            $(this).parent().prev().show()
        } else {
            $(this).parent().prev().hide()
        }
    })
}
function configurationElm(e, t) {
    $(".demo").delegate(".configuration > a", "click", function (e) {
        e.preventDefault();
        var t = $(this).parent().next().next().children();
        $(this).toggleClass("active");
        t.toggleClass($(this).attr("rel"))
    });
    $(".demo").delegate(".configuration .dropdown-menu a", "click", function (e) {
        e.preventDefault();
        var t = $(this).parent().parent();
        var n = t.parent().parent().next().next().children();
        t.find("li").removeClass("active");
        $(this).parent().addClass("active");
        var r = "";
        t.find("a").each(function () {
            r += $(this).attr("rel") + " "
        });
        t.parent().removeClass("open");
        n.removeClass(r);
        n.addClass($(this).attr("rel"))
    })
}
function removeElm() {
    $(".demo").delegate(".remove", "click", function (e) {
        e.preventDefault();
        $(this).parent().remove();
        if (!$(".demo .lyrow").length > 0) {
            clearDemo()
        }
    })
}
function clearDemo() {
    $(".demo").empty();
    layouthistory = null;
    if (supportstorage())
        localStorage.removeItem("layoutdata");
}
function removeMenuClasses() {
    $("#menu-layoutit li button").removeClass("active")
}
function changeStructure(e, t) {
    $("#download-layout ." + e).removeClass(e).addClass(t)
}
function cleanHtml(e) {
    $(e).parent().append($(e).children().html())
}
function downloadLayoutSrc() {
    var e = "";
    $("#download-layout").children().html($(".demo").html());
    var t = $("#download-layout").children();
    t.find(".preview, .configuration, .drag, .remove").remove();
    t.find(".lyrow").addClass("removeClean");
    t.find(".box-element").addClass("removeClean");
    t.find(".lyrow .lyrow .lyrow .lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .lyrow .lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".removeClean").remove();
    $("#download-layout .column").removeClass("ui-sortable");
    $("#download-layout .row-fluid").removeClass("clearfix").children().removeClass("column");
    if ($("#download-layout .container").length > 0) {
        changeStructure("row-fluid", "row")
    }
    formatSrc = $.htmlClean($("#download-layout").html(), {
        format: true,
        /*
                allowedTags:["p","span","div","html","body","title","meta","link","script","option","select","input","table","mta-grid"],
        */
        allowedAttributes: [
            ["id"],
            ["class"],
            ["data-toggle"],
            ["data-target"],
            ["data-parent"],
            ["role"],
            ["data-dismiss"],
            ["aria-labelledby"],
            ["aria-hidden"],
            ["data-slide-to"],
            ["data-slide"],
            ["objectid"],
            ["cols"],
            ["tenantid"],
            ["mta"],
            ["mta-grid"],
            ["grid"]

        ]
    });

    var prehtml = '<!DOCTYPE html>';
    prehtml += '<html>';
    prehtml += '<head lang="en">';

    prehtml += '    <meta charset="UTF-8">';
    prehtml += '    <meta name="viewport" content="width=device-width, initial-scale=1.0">';
    prehtml += '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
    prehtml += '            <title></title>';

    prehtml += '        <!-- Le styles -->';
    prehtml += '        <link href="../css/views/bootstrap-combined.min.css" rel="stylesheet">';
    prehtml += '            <link href="../css/views/jquery-ui-1.10.3.custom.css" rel="stylesheet">';
    prehtml += '                <link href="../assets/jqGrid/css/ui.jqgrid.css" rel="stylesheet">';
    prehtml += '                    <link href="../css/views/view-mta.css" rel="stylesheet">';


    prehtml += '                        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->';
    prehtml += '                        <!--[if lt IE 9]>';
    prehtml += '                        <script src="../js/views/html5shiv.js"></script>';
    prehtml += '                        <![endif]-->';

    prehtml += '                        <!-- Fav and touch icons -->';
    prehtml += '                        <link rel="shortcut icon" href="img/favicon.png">';

    prehtml += '                            <script src="../js/angular.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../js/views/jquery-2.0.0.min.js"></script>';
    prehtml += '                            <!--[if lt IE 9]>';
    prehtml += '                            <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>';
    prehtml += '                            <![endif]-->';
    prehtml += '                            <script type="text/javascript" src="../js/views/bootstrap.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../js/views/jquery-ui.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../js/views/jquery.ui.touch-punch.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../js/views/jquery.htmlClean.js"></script>';
    prehtml += '                            <script src="../assets/jqGrid/js/i18n/grid.locale-en.js"></script>';
    prehtml += '                            <script src="../assets/jqGrid/js/jquery.jqGrid.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../ckeditor/config.js"></script>';
    prehtml += '                            <script src="../js/underscore.js"></script>';
    prehtml += '                            <script src="../js/encoder.js"></script>';
    prehtml += '                            <script src="../js/ajaxq.js"></script>';
    prehtml += '                            <script src="../js/mta-ui-grid.js"></script>';

    prehtml += '                        </head>';
    prehtml += '                        <body ng-app="MTAUIDirective">';


    prehtml += '                            <div ng-controller="Controller">';

    var posthtml = "</div></body></html>";

    $("#download-layout").html(formatSrc);
    $("#downloadModal textarea").empty();
    $("#downloadModal textarea").val(prehtml + formatSrc + posthtml)
}

function getPhysicalFileContent() {
    var e = "";
    $("#download-layout").children().html($(".demo").html());
    var t = $("#download-layout").children();
    t.find(".preview, .configuration, .drag, .remove").remove();
    t.find(".lyrow").addClass("removeClean");
    t.find(".box-element").addClass("removeClean");
    t.find(".lyrow .lyrow .lyrow .lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .lyrow .lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".lyrow .removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".removeClean").each(function () {
        cleanHtml(this)
    });
    t.find(".removeClean").remove();
    $("#download-layout .column").removeClass("ui-sortable");
    $("#download-layout .row-fluid").removeClass("clearfix").children().removeClass("column");
    if ($("#download-layout .container").length > 0) {
        changeStructure("row-fluid", "row")
    }
    formatSrc = $.htmlClean($("#download-layout").html(), {
        format: true,
        /*
                allowedTags:["p","span","div","html","body","title","meta","link","script","option","select","input","table","mta-grid"],
        */
        allowedAttributes: [
            ["id"],
            ["class"],
            ["data-toggle"],
            ["data-target"],
            ["data-parent"],
            ["role"],
            ["data-dismiss"],
            ["aria-labelledby"],
            ["aria-hidden"],
            ["data-slide-to"],
            ["data-slide"],
            ["objectid"],
            ["cols"],
            ["tenantid"],
            ["mta"],
            ["mta-grid"],
            ["grid"]

        ]
    });

    var prehtml = '<!DOCTYPE html>';
    prehtml += '<html>';
    prehtml += '<head lang="en">';

    prehtml += '    <meta charset="UTF-8">';
    prehtml += '    <meta name="viewport" content="width=device-width, initial-scale=1.0">';
    prehtml += '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
    prehtml += '            <title></title>';

    prehtml += '        <!-- Le styles -->';
    prehtml += '        <link href="../../css/views/bootstrap-combined.min.css" rel="stylesheet">';
    prehtml += '            <link href="../../css/views/jquery-ui-1.10.3.custom.css" rel="stylesheet">';
    prehtml += '                <link href="../../assets/jqGrid/css/ui.jqgrid.css" rel="stylesheet">';
    prehtml += '                    <link href="../../css/views/view-mta.css" rel="stylesheet">';


    prehtml += '                        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->';
    prehtml += '                        <!--[if lt IE 9]>';
    prehtml += '                        <script src="../js/views/html5shiv.js"></script>';
    prehtml += '                        <![endif]-->';

    prehtml += '                        <!-- Fav and touch icons -->';
    prehtml += '                        <link rel="shortcut icon" href="img/favicon.png">';

    prehtml += '                            <script src="../../js/angular.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../../js/views/jquery-2.0.0.min.js"></script>';
    prehtml += '                            <!--[if lt IE 9]>';
    prehtml += '                            <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>';
    prehtml += '                            <![endif]-->';
    prehtml += '                            <script type="text/javascript" src="../../js/views/bootstrap.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../../js/views/jquery-ui.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../../js/views/jquery.ui.touch-punch.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../../js/views/jquery.htmlClean.js"></script>';
    prehtml += '                            <script src="../../assets/jqGrid/js/i18n/grid.locale-en.js"></script>';
    prehtml += '                            <script src="../../assets/jqGrid/js/jquery.jqGrid.min.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>';
    prehtml += '                            <script type="text/javascript" src="../../ckeditor/config.js"></script>';
    prehtml += '                            <script src="../../js/underscore.js"></script>';
    prehtml += '                            <script src="../../js/encoder.js"></script>';
    prehtml += '                            <script src="../../js/ajaxq.js"></script>';
    prehtml += '                            <script src="../../js/mta-ui-grid.js"></script>';

    prehtml += '                        </head>';
    prehtml += '                        <body ng-app="MTAUIDirective">';


    prehtml += '                            <div ng-controller="Controller">';

    var posthtml = "</div></body></html>";

    return prehtml + formatSrc + posthtml
}


var currentDocument = null;
var timerSave = 1000;
var stopsave = 0;
var startdrag = 0;
var demoHtml = $(".demo").html();
var currenteditor = null;
$(window).resize(function () {
    $("body").css("min-height", $(window).height() - 90);
    $(".demo").css("min-height", $(window).height() - 160)
});


function restoreDataFromMTAStudio() {

    clearDemo();

    $(".demo").html($("#layoutitConent").val());

    initContainer();

    restoreMTAUIComponents();

}

function restoreData() {
    if (supportstorage()) {
        layouthistory = JSON.parse(localStorage.getItem("layoutdata"));
        if (!layouthistory) return false;
        window.demoHtml = layouthistory.list[layouthistory.count - 1];
        if (window.demoHtml) $(".demo").html(window.demoHtml);
    }
}

function initContainer() {
    $(".demo, .demo .column").sortable({
        connectWith: ".column",
        opacity: .35,
        handle: ".drag",
        start: function (e, t) {
            if (!startdrag) stopsave++;
            startdrag = 1;
        },
        stop: function (e, t) {
            if (stopsave > 0) stopsave--;
            startdrag = 0;
        }
    });
    configurationElm();
}
$(document).ready(function () {

    getTenantUserItems();

    $.when(loadTenantUserCustomObjs($("#userId").val()))
    .done(function () {
        restoreDataFromMTAStudio()
    });

    CKEDITOR.disableAutoInline = true;
    //restoreData();
    var contenthandle = CKEDITOR.replace('contenteditor', {
        language: 'zh-cn',
        contentsCss: ['css/bootstrap-combined.min.css'],
        allowedContent: true
    });
    $("body").css("min-height", $(window).height() - 90);
    $(".demo").css("min-height", $(window).height() - 160);
    $(".sidebar-nav .lyrow").draggable({
        connectToSortable: ".demo",
        helper: "clone",
        handle: ".drag",
        start: function (e, t) {
            if (!startdrag) stopsave++;
            startdrag = 1;
        },
        drag: function (e, t) {
            t.helper.width(400)
        },
        stop: function (e, t) {
            $(".demo .column").sortable({
                opacity: .35,
                connectWith: ".column",
                start: function (e, t) {
                    if (!startdrag) stopsave++;
                    startdrag = 1;
                },
                stop: function (e, t) {
                    if (stopsave > 0) stopsave--;
                    startdrag = 0;
                }
            });
            if (stopsave > 0) stopsave--;
            startdrag = 0;
        }
    });
    $(".sidebar-nav .box").draggable({
        connectToSortable: ".column",
        helper: "clone",
        handle: ".drag",
        start: function (e, t) {
            if (!startdrag) stopsave++;
            startdrag = 1;
        },
        drag: function (e, t) {
            t.helper.width(400)
        },
        stop: function () {
            handleJsIds();
            handleMTAUIComponents();
            if (stopsave > 0) stopsave--;
            startdrag = 0;
        }
    });



    initContainer();
    $('body.edit .demo').on("click", "[data-target=#editorModal]", function (e) {
        e.preventDefault();
        currenteditor = $(this).parent().parent().find('.view');
        var eText = currenteditor.html();
        contenthandle.setData(eText);
    });
    $("#savecontent").click(function (e) {
        e.preventDefault();
        currenteditor.html(contenthandle.getData());
    });
    $("[data-target=#downloadModal]").click(function (e) {
        e.preventDefault();
        downloadLayoutSrc();
    });
    $("[data-target=#shareModal]").click(function (e) {
        e.preventDefault();
        handleSaveLayout();
    });
    $("#download").click(function () {
        downloadLayout();
        return false
    });
    $("#downloadhtml").click(function () {
        downloadHtmlLayout();
        return false
    });
    $("#edit").click(function () {
        $("body").removeClass("devpreview sourcepreview");
        $("body").addClass("edit");
        removeMenuClasses();
        $(this).addClass("active");
        return false
    });
    $("#clear").click(function (e) {
        e.preventDefault();
        clearDemo()
    });
    $("#devpreview").click(function () {
        $("body").removeClass("edit sourcepreview");
        $("body").addClass("devpreview");
        removeMenuClasses();
        $(this).addClass("active");
        return false
    });
    $("#sourcepreview").click(function () {
        $("body").removeClass("edit");
        $("body").addClass("devpreview sourcepreview");
        removeMenuClasses();
        $(this).addClass("active");
        return false
    });
    $("#fluidPage").click(function (e) {
        e.preventDefault();
        changeStructure("container", "container-fluid");
        $("#fixedPage").removeClass("active");
        $(this).addClass("active");
        downloadLayoutSrc()
    });
    $("#fixedPage").click(function (e) {
        e.preventDefault();
        changeStructure("container-fluid", "container");
        $("#fluidPage").removeClass("active");
        $(this).addClass("active");
        downloadLayoutSrc()
    });
    $(".nav-header").click(function () {
        $(".sidebar-nav .boxes, .sidebar-nav .rows").hide();
        $(this).next().slideDown()
    });
    $('#undo').click(function () {
        stopsave++;
        if (undoLayout()) initContainer();
        stopsave--;
    });
    $('#redo').click(function () {
        stopsave++;
        if (redoLayout()) initContainer();
        stopsave--;
    });
    $('#saveToMTA').click(function () {

        removeNoneSettingMTAUIComponents();

        var param = {
            pageId: $("#pageId").val(),
            fileContent: Encoder.htmlDecode(getPhysicalFileContent()),
            layoutitContent: Encoder.htmlDecode(window.demoHtml)
        };

        $.ajax({
            crossDomain: true,
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            url: "http://192.168.1.103/MTAUIStudio/webservice/TenantsPageWebService.asmx/updateTenantsPageFileContent",
            data: JSON.stringify(param),
            dataType: "json",
            success: onDataReceived,
            error: function (jqXHR, exception) {
                if (jqXHR.status === 0) {
                    alert('Not connect.\n Verify Network.');
                } else if (jqXHR.status == 404) {
                    alert('Requested page not found. [404]');
                } else if (jqXHR.status == 500) {
                    alert('Internal Server Error [500].');
                } else if (exception === 'parsererror') {
                    alert('Requested JSON parse failed.');
                } else if (exception === 'timeout') {
                    alert('Time out error.');
                } else if (exception === 'abort') {
                    alert('Ajax request aborted.');
                } else {
                    alert('Uncaught Error.\n' + jqXHR.responseText);
                }
            }
        });


    });

    function onDataReceived(data) {
        $('#saveMTAModal').modal('show')
    }

    removeElm();
    gridSystemGenerator();
    setInterval(function () {
        handleSaveLayout()
    }, timerSave)



})