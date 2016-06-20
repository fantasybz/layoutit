/**
 * Created by fantasybz on 2015/5/19.
 */

var MTAServiceURL = "http://192.168.1.103:8080/MTAServiceResful/";

function getTenantUserItems() {

    var deferred = $.Deferred();

    var userlistUrl = MTAServiceURL + 'ulist';


    $.ajaxq("MTAQueue", {
        type: "GET",
        url: userlistUrl,
        cache: false,
        dataType: 'jsonp',
        jsonpCallback: 'processData',
        async: false,
        success: function (data) {

            $("#tenant-user-ul").empty();
            $.each(data, function (index, item) {
                $("#tenant-user-ul").append('<li tenantName="' + item.tenantName + ' tenantName="' + item.id + '"></li>');
            });

            return deferred.promise();


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

    $.ajaxq("MTAQueue", {
        type: "GET",
        url: userUrl,
        cache: false,
        dataType: 'jsonp',
        jsonpCallback: 'processData',
        async: false,
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
    });

    var olistUrl = MTAServiceURL + 'comdlist?tid=' + $("#tenantId").val();

    return $.ajaxq("MTAQueue", {
        type: "GET",
        url: olistUrl,
        dataType: 'jsonp',
        jsonpCallback: 'processData',
        async: false,
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

}

function getTenantUserDetailCustomObj(objid) {
    var relUrl = MTAServiceURL + 'cr?tid=' + $("#tenantId").val() + "&cid=" + objid;
    var custObj = null;
    return $.ajaxq("MTAQueue", {
        type: "GET",
        url: relUrl,
        cache: false,
        dataType: 'jsonp',
        jsonpCallback: 'processData',
        success: function (data) {
            custObj = data;
        },
        error: function (jqXHR, exception) {
        }
    }).done(function (data) {
        return custObj;
    });

}




function handleMTAUIComponents() {

    changeMTAUIState("init", "setting");

    handleMTAGrid();
    handleMTAEditor();


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
    /// <summary>
    /// 重新載入頁面時，重新設定MTA GRID 操作介面
    /// </summary>
    $(".demo .MTA-GRID[state='done']").each(function () {
        $(this).find(".mta-userinfo").text($("#hTenant").text());
        var mtagridtag = $(this).find("mta-grid");

        setMtaGridObjSelectItem(this, mtagridtag, true);


    });


}

function handleMTAGrid() {
    $(".demo .MTA-GRID[state='setting']").each(function () {
        $(this).find(".mta-userinfo").text($("#hTenant").text());
        var mtagridtag = $(this).find("mta-grid");

        $(mtagridtag).attr("objectid", -1);
        $(mtagridtag).attr("tenantid", $("#tenantId").val());

        setMtaGridObjSelectItem(this, mtagridtag, false);


    });

}

function handleMTAEditor() {
    $(".demo .MTA-EDITOR[state='setting']").each(function () {
        $(this).find(".mta-userinfo").text($("#hTenant").text());
        var mtaeditortag = $(this).find("mta-editor");

        $(mtaeditortag).attr("objectid", -1)
        $(mtaeditortag).attr("tenantid", $("#tenantId").val());

        setMtaEditorObjSelectItem(this, mtaeditortag, false);
    });
}

function initMtaSelectItem(selectObect) {
    $(selectObect).empty();
    $(selectObect).append('<option value = "-1">請選擇</option>');


    $("#CustObjects input[type='hidden']").each(function () {

        $(selectObect).append('<option value = "' + this.id + '">' + this.name + '</option>');


    });
}

function setMtaEditorObjSelectItem(mtaeditor, mtaeditortag, isRestore) {
    var selectObect = $(mtaeditor).find(".mta-object-select");
    var mtauishow = $(mtaeditor).find(".mta-ui-show");
    var mtaformbuilder = $(mtaeditor).find(".mta-form-builder");
    var mtaselectedobjid = $(mtaeditor).find(".mta-selected-objid");

    $(mtaformbuilder).hide();

    if (isRestore == false) {

        initMtaSelectItem(selectObect)
    } else {

    }



    $(selectObect).on('change', function () {


        $(mtaeditortag).attr("objectid", $(this).val());

        $(mtaformbuilder).find("fieldset .component:gt(0)").remove();

        if ($(this).val() == -1) {
            $(mtaformbuilder).hide();
            $(mtauishow).show();
            $(mtaeditor).attr("state", "setting");
        } else {

            $(mtaformbuilder).show();
            $(mtauishow).hide();
            $(mtaselectedobjid).val($(this).val());

            createFormBuilderFromMTAObject(mtaformbuilder, $(mtaselectedobjid).val());


            $(mtaeditor).attr("state", "done");

        }
    });


}

function createFormBuilderFromMTAObject(mtaFormBuilder, mtaObjID) {

    var fieldsetZone = $(mtaFormBuilder).find("fieldset");
   
    $.when(getTenantUserDetailCustomObj(mtaObjID))
        .done(function (objmeta) {
            $.each(objmeta.customFields, function (index, item) {

                addMtaFormItemByCustomField(fieldsetZone, item, objmeta.customRelationships, objmeta.pkCustomField)

            })
        });



}

function addMtaFormItemByCustomField(fieldsetZone, fieldItem, relationships, pkField) {
    /// <summary>
    /// 
    /// </summary>
    /// <param name="fieldsetZone"></param>
    /// <param name="fieldItem"></param>
    /// <param name="relationships"></param>
    /// <param name="pkField"></param>
   

    if (fieldItem.type.value == 5) {
        //var ary = item.name.split("_");
        //if (ary[0] != $("#coName").val()) {
        //relAry[relAry.length] = item.id;
        ////console.log(ary[0])
        //appendStr += "<tr><td><label name=\"fieldName\">" + ary[0] + "</label></td>";
        //appendStr += "<td>&nbsp;<select name='selCr'></select>";
        //appendStr += "<input type='hidden' id='cfType' name='cfType' value='" + item.type.value + "'>";
        //if (arg != 0) appendStr += "<button name='btnViewRel' class='btn'>View</button>";
        ////console.log("Val" + value);
        //appendStr += "<input type='hidden' name='cfValue' value='" + value + "'>";
        //appendStr += "<input type='hidden' name='relObjId' value=''>";
        //appendStr += "<input type='hidden' id='cfId' name='cfId' value='" + item.id + "'></td></tr>";
        //} else {
        //if (arg != 0) {
        //    appendStr += "<tr><td><label name=\"fieldName\">" + ary[1] + "</label></td>";
        //    appendStr += "<td>";
        //    appendStr += "<button name='btnViewRel' class='btn'>View</button>";
        //    appendStr += "<input type='hidden' name='relObjId' value='" + $("#coId").val() + "'>";
        //    appendStr += "<input type='hidden' name='fieldValue' value='" + value + "'>";
        //    appendStr += "<input type='hidden' id='cfId' name='cfId' value='" + item.id + "'></td></tr>";
        //}
        //}

    } else {
        if (fieldItem.indexType.value == 1) {

            var textinputgroup = $("#mta-form-builder-control .mta-textinput-group").clone()

            setMTAFormControlBind(textinputgroup, ".mta-textinput", fieldItem);

            $(fieldsetZone).append(textinputgroup);

        } else if (fieldItem.type.value == 2) {

            var dateinputgroup = $("#mta-form-builder-control .mta-dateinput-group").clone()

            setMTAFormControlBind(dateinputgroup, ".mta-mta-dateinput", fieldItem);

            $(fieldsetZone).append(dateinputgroup);

            $(dateinputgroup).children(".date").datepicker({
                format: "yyyy/mm/dd",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true,
                todayHighlight: true
            });

        } else if (fieldItem.type.value == 6) {

            var texttextareagroup = $("#mta-form-builder-control .mta-textarea-group").clone()

            setMTAFormControlBind(texttextareagroup, ".mta-textarea", fieldItem);

            $(fieldsetZone).append(texttextareagroup);

        } else {
            var textinputgroup = $("#mta-form-builder-control .mta-textinput-group").clone()

            setMTAFormControlBind(textinputgroup, ".mta-textinput", fieldItem);

            $(fieldsetZone).append(textinputgroup);
        }
    }


    

}


function setMTAFormControlBind(targetControl, controlClass, mtaField) {
    var ctlIndex = $(".demo " + controlClass).length + 1;
    var ctlId = controlClass + "-" + ctlIndex;

    $(targetControl).find(controlClass).attr("id", ctlId);
    $(targetControl).find(".control-label").attr("for", ctlId);
    $(targetControl).find(".control-label").html(mtaField.name);
    $(targetControl).find(".mta-field-info").html(mtaField.name);


}


function setMtaGridObjSelectItem(mtagrid, mtagridtag, isRestore) {
    /// <summary>
    ///  設定MTA GRID 繫結MTA Object 行為
    /// </summary>
    /// <param name="mtagrid"></param>
    /// <param name="mtagridtag"></param>
    /// <param name="isRestore">是否為重新載入狀態</param>

    var selectObect = $(mtagrid).find(".mta-object-select");
    var mtauishow = $(mtagrid).find(".mta-ui-show");
    var gridster = $(mtagrid).find(".gridster");
    var mtaselectedobjid = $(mtagrid).find(".mta-selected-objid");

    if (isRestore == false) {

        initMtaSelectItem(selectObect)
    } else {

        $(selectObect).val($(mtagridtag).attr("objectid"));

        var widgets = createWidgetsbyMTAObjFields($(mtaselectedobjid).val());

        initGridsterZone(mtagrid, gridster, widgets.length);

    }


    $(selectObect).on('change', function () {
        $(gridster).find("ul").remove();
        $(gridster).append("<ul></ul>");
        $(mtagrid).find(".mta-cols-positions").val("");

        $(mtagridtag).attr("objectid", $(this).val());


        if ($(this).val() == -1) {
            $(gridster).hide();
            $(mtauishow).show();
            $(mtagrid).attr("state", "setting");
        } else {

            $(gridster).show();
            $(mtauishow).hide();
            $(mtaselectedobjid).val($(this).val());
            applyMTAObjColsSelect(mtagrid, gridster, $(mtaselectedobjid).val());
            $(mtagrid).attr("state", "done");

        }
    });


}

function initGridsterZone(mtagrid, mtacolseditzone, max_cols) {
    /// <summary>
    /// 初始化 GridsterZone
    /// </summary>
    /// <param name="mtagrid"></param>
    /// <param name="mtacolseditzone"></param>
    var gridster = $(mtacolseditzone).find("ul").gridster({
        widget_margins: [5, 5],
        widget_base_dimensions: [120, 120],
        max_cols: max_cols,
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

    return gridster;
}

function applyMTAObjColsSelect(mtagrid, mtacolseditzone, mtaselectedobjid) {


    var widgets = createWidgetsbyMTAObjFields(mtaselectedobjid);

    var gridster = initGridsterZone(mtagrid, mtacolseditzone, widgets.length);

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


