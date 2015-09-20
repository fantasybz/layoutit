/**
 * Created by fantasybz on 2015/5/19.
 */

var MTAServiceURL = "http://192.168.1.103:8080/MTAServiceResful/";

function getTenantUserItems() {

    var userlistUrl = MTAServiceURL + 'ulist';


    $.ajax({
        type: "GET",
        url: userlistUrl,
        cache: false,
        dataType: 'jsonp',
        jsonpCallback: 'processData',
        success: function (data) {

            $("#tenant-user-ul").empty();
            $.each(data, function (index, item) {
                $("#tenant-user-ul").append('<li tenantName="' + item.tenantName + ' tenantName="' + item.id + '"></li>');
            });

            loadTenantUserCustomObjs($("#userId").val())


        }, error: function (jqXHR, exception) {
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

}


function loadTenantUserCustomObjs(userid) {

    $("#CustObjects").empty();
    var userUrl = MTAServiceURL + 'u?uid=' + $("#userId").val();

    $.when(jQuery.ajax({
        type: "GET",
        url: userUrl,
        cache: false,
        dataType: 'jsonp',
        jsonpCallback: 'processData',
        success: function (data) {
            $("#tenantId").val(data.tenantId);
            $("#hTenant").text(data.tenantName);
            $("#hPage").text($("#pageName").val() + "(" + $("#pageFilePath").val() + ")");
        },
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
    })).done(function (a1) {
        var olistUrl = MTAServiceURL + 'comdlist?tid=' + $("#tenantId").val();
        var handleCo = function () {
            jQuery.ajax({
                type: "GET",
                url: olistUrl,
                dataType: 'jsonp',
                jsonpCallback: 'processData',
                success: function (data) {
                    $.each(data, function (i, item) {
                        if (item.name != "Product") {
                            var hid = "<input type='hidden' id='" + item.id + "' name='" + item.name + "' value='" + JSON.stringify(item) + "' >";
                            $("#CustObjects").append(hid);

                        }
                    });
                },
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
            return false
        };
        handleCo();
    })
}


function handleMTAUIComponents() {

    changeMTAUIState("init", "setting");

    handleMTAGrid();


}

function changeMTAUIState(orgState, newState) {
    $(".demo .MTA-UI[state='" + orgState + "']").each(function () {
        $(this).attr("state", newState);
    });
}

function restoreMTAUIComponents() {
    restoreMTAGrid();

}


function restoreMTAGrid() {

    $(".demo .MTA-GRID[state='done']").each(function () {

    });


}

function handleMTAGrid() {
    $(".demo .MTA-GRID[state='setting']").each(function () {
        $(this).find(".mta-userinfo").text($("#hTenant").text());
        var mtagridtag = $(this).find("mta-grid");

        $(mtagridtag).attr("objectid", -1)
        $(mtagridtag).attr("tenantid", $("#tenantId").val())

        setObjectSelectItem(this);


    });

}

function setObjectSelectItem(mtagrid) {
    var selectObect = $(mtagrid).find(".mta-object-select");
    var mtauishow = $(mtagrid).find(".mta-ui-show");
    var gridster = $(mtagrid).find(".gridster");
    var mtaselectedobjid = $(mtagrid).find(".mta-selected-objid");
    var mtagridtag = $(mtagrid).find("mta-grid");


    $(selectObect).empty();
    $(selectObect).append('<option value = "-1">請選擇</option>');


    $("#CustObjects input[type='hidden']").each(function () {

        $(selectObect).append('<option value = "' + this.id + '">' + this.name + '</option>');

    });


    $(selectObect).on('change', function () {
        $(gridster).find("ul").remove();
        $(gridster).append("<ul></ul>");
        $(mtagrid).find(".mta-cols-positions").val("");

        $(mtagridtag).attr("objectid", $(this).val());


        if ($(this).val() == -1) {
            $(gridster).hide();
            $(mtauishow).show();
            $(mtagrid).attr("state","setting");
        } else {

            $(gridster).show();
            $(mtauishow).hide();
            $(mtaselectedobjid).val($(this).val());
            applyMTAObjColsSelect(mtagrid, gridster, $(mtaselectedobjid).val());
            $(mtagrid).attr("state", "done");

        }
    });


}

function applyMTAObjColsSelect(mtagrid, mtacolseditzone, mtaselectedobjid) {

    var gridster;

    var widgets = createWidgetsbyMTAObjFields(mtaselectedobjid);


    gridster = $(mtacolseditzone).find("ul").gridster({
        widget_margins: [5, 5],
        widget_base_dimensions: [120, 120],
        max_cols: widgets.length,
        draggable: {
            handle: 'header',
            start: function (e, ui, $widget) {

            },

            drag: function (e, ui, $widget) {

            },

            stop: function (e, ui, $widget) {
                serializeColsPositions(mtagrid, gridster);


            }
        }
    }).data('gridster');


    $.each(widgets, function (i, widget) {
        gridster.add_widget.apply(gridster, widget)
    });

    serializeColsPositions(mtagrid, gridster);



}

var genColsOrderSettings = function (colsPositions) {
    var preContent = "<header>|||</header><mtafield>";
    var postContent = "</mtafield>";
    var ColsOrderArr = [];

    var groupbyRow = _.groupBy(colsPositions, function (item) {
        return item.row;
    });

    _.each(groupbyRow, function (item) {
        var sortCol = _.sortBy(item, function (item) { item.col });
        _.each(sortCol, function (item) {
            var temp = item.data.replace(preContent, "")
            temp = temp.replace(postContent, "").trim();
            ColsOrderArr.push(temp);
        })

    });

    return JSON.stringify(ColsOrderArr).replace(/"+/g, "'");

};


function serializeColsPositions(mtagrid, gridster) {
    var colsPositions = gridster.serialize();

    var mtagridtag = $(mtagrid).find("mta-grid");

    $(mtagridtag).attr("cols", genColsOrderSettings(colsPositions))

    //$(mtagrid).find(".mta-cols-positions").val(JSON.stringify(colsPositions));
}

function createWidgetsbyMTAObjFields(mtaselectedobjid) {

    var widgetArr = [];

    var preContent = "<li> <header>|||</header><mtafield>";
    var postContent = "</mtafield></li>";

    var objmeta = JSON.parse($("#CustObjects input[id=" + mtaselectedobjid + "]").val());

    $.each(objmeta.customFields, function (index, item) {
        widgetArr.push([preContent + item.name + postContent, 1, 1]);
    })


    return widgetArr;

}


function removeNoneSettingMTAUIComponents() {
    $(".demo .MTA-UI[state='setting']").each(function () {
        $(this).remove();
    });
}


