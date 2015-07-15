<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MTALayoutitPage.aspx.cs" Inherits="MTALayoutitPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="title" content="MTA Layoutit(Bootstrap視覺化佈局工具)">
    <meta name="description" content="LayoutIt! 可拖放排序線上編輯的Bootstrap視覺化佈局系統">
    <meta name="keywords" content="視覺化,佈局,系統">
    <title>MTA Layoutit(Bootstrap視覺化佈局工具)</title>

    <!-- Le styles -->
    <link href="css/bootstrap-combined.min.css" rel="stylesheet">
    <link href="css/layoutit.css" rel="stylesheet">
    <link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet">
    <link href="css/ui.jqgrid.css" rel="stylesheet">
    <link href="css/jquery.gridster.css" rel="stylesheet">
    <link href="css/mta-gridster-cols.css" rel="stylesheet">

    <!-- HTML5 shim, fo\
    r IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="img/favicon.png">

    <script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="js/jquery.htmlClean.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="ckeditor/config.js"></script>
    <script type="text/javascript" src="js/underscore-min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript" src="js/jquery.gridster.js"></script>
    <script src="js/encoder.js"></script>
    <script type="text/javascript" src="js/mta-ui.js"></script>
    
</head>
<body style="min-height: 660px; cursor: auto;" class="edit">
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button">
                        <span
                            class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="brand" href="">
                        <img src="img/favicon.png">MTA View Layoutit</a>

                    <div id="mta-select">

                        <%--<span>
                            <select id="tenant-user-select" class="form-control input-large"></select></span>--%>

                        <span id="hTenant" class="label label-info"></span>
                        <span id="hPage" class="label label-info"></span>
                        <ul id="tenant-user-ul" style="visibility: hidden">
                        </ul>
                    </div>
                    <div class="nav-collapse collapse">
                        <ul class="nav" id="menu-layoutit">
                            <li class="divider-vertical"></li>
                            <li>

                                <div class="btn-group" data-toggle="buttons-radio">
                                    <button type="button" id="edit" class="btn btn-primary active">
                                        <i
                                            class="icon-edit icon-white"></i>編輯
                                    </button>
                                    <button type="button" class="btn btn-primary" id="devpreview">
                                        <i
                                            class="icon-eye-close icon-white"></i>佈局編輯
                                    </button>
                                    <button type="button" class="btn btn-primary" id="sourcepreview">
                                        <i
                                            class="icon-eye-open icon-white"></i>預覽
                                    </button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary" data-target="#downloadModal"
                                        rel="/build/downloadModal" role="button" data-toggle="modal">
                                        <i
                                            class="icon-chevron-down icon-white"></i>下載
                                    </button>
                                    <button class="btn btn-primary" href="/share/index" role="button" data-toggle="modal"
                                        data-target="#shareModal">
                                        <i class="icon-share icon-white"></i>保存
                                    </button>
                                    <button class="btn btn-primary" href="#clear" id="clear">
                                        <i class="icon-trash icon-white"></i>清空
                                    </button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn btn-primary" href="#undo" id="undo">
                                        <i
                                            class="icon-arrow-left icon-white"></i>撤銷
                                    </button>
                                    <button class="btn btn-primary" href="#redo" id="redo">
                                        <i
                                            class="icon-arrow-right icon-white"></i>重做
                                    </button>
                                </div>
                                <div class="btn-group">
                                     <button class="btn btn-success" href="#saveToMTA" id="saveToMTA">
                                        <i class="icon-retweet icon-white"></i>儲存版型至MTA Studio
                                    </button>
                                </div>
                            </li>
                        </ul>
                        <ul class="nav pull-right">
                            <li>
                                <div class="btn-group">
                                    <span>
                                        <iframe class="github-btn"
                                            src="http://ghbtns.com/github-btn.html?user=justjavac&repo=layoutit&type=watch&count=true"
                                            allowtransparency="true" frameborder="0" scrolling="0" width="80px"
                                            height="20px"></iframe>
                                    </span>
                                    <span>
                                        <iframe class="github-btn"
                                            src="http://ghbtns.com/github-btn.html?user=justjavac&repo=layoutit&type=fork&count=true"
                                            allowtransparency="true" frameborder="0" scrolling="0" width="80px"
                                            height="20px"></iframe>
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="">
                    <div class="sidebar-nav">
                        <ul class="nav nav-list accordion-group">
                            <li class="nav-header">
                                <div class="pull-right popover-info">
                                    <i class="icon-question-sign "></i>

                                    <div class="popover fade right">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title">功能</h3>

                                        <div class="popover-content">
                                            在這裡設置你的柵格佈局, 柵格總數默認為12, 用空格分割每列的柵格值, 如果您需要瞭解更多資訊，請訪問<a target="_blank"
                                                href="http://twitter.github.io/bootstrap/scaffolding.html#gridSystem">Bootstrap柵格系統.</a>
                                        </div>
                                    </div>
                                </div>
                                <i class="icon-plus icon-white"></i>佈局設置
                            </li>
                            <li style="display: list-item;" class="rows" id="estRows">
                                <div class="lyrow ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">
                                        <input value="12" type="text">
                                    </div>
                                    <div class="view">
                                        <div class="row-fluid clearfix">
                                            <div class="span12 column"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lyrow ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">
                                        <input value="6 6" type="text">
                                    </div>
                                    <div class="view">
                                        <div class="row-fluid clearfix">
                                            <div class="span6 column"></div>
                                            <div class="span6 column"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lyrow ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">
                                        <input value="8 4" type="text">
                                    </div>
                                    <div class="view">
                                        <div class="row-fluid clearfix">
                                            <div class="span8 column"></div>
                                            <div class="span4 column"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lyrow ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">
                                        <input value="4 4 4" type="text">
                                    </div>
                                    <div class="view">
                                        <div class="row-fluid clearfix">
                                            <div class="span4 column"></div>
                                            <div class="span4 column"></div>
                                            <div class="span4 column"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lyrow ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">
                                        <input value="2 6 4" type="text">
                                    </div>
                                    <div class="view">
                                        <div class="row-fluid clearfix">
                                            <div class="span2 column"></div>
                                            <div class="span6 column"></div>
                                            <div class="span4 column"></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="nav nav-list accordion-group">
                            <li class="nav-header"><i class="icon-plus icon-white"></i>基本CSS

                            <div class="pull-right popover-info">
                                <i class="icon-question-sign "></i>

                                <div class="popover fade right">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title">幫助</h3>

                                    <div class="popover-content">
                                        這裡提供了一系列基本元素樣式，你可以通過區塊右上角的編輯按鈕修改樣式設置。如需瞭解更多資訊，請訪問<a target="_blank"
                                            href="http://twitter.github.io/bootstrap/base-css.html">基本CSS.</a>
                                    </div>
                                </div>
                            </div>
                            </li>
                            <li style="display: none;" class="boxes" id="elmBase">
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal"
                                            role="button" data-toggle="modal">
                                            編輯
                                        </button>
                                        <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown"
                                            href="#">對齊 <span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li class="active"><a href="#" rel="">默認</a></li>
                                                <li class=""><a href="#" rel="text-left">靠左</a></li>
                                                <li class=""><a href="#" rel="text-center">居中</a></li>
                                                <li class=""><a href="#" rel="text-right">靠右</a></li>
                                            </ul>
                                        </span><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">標記

                                        <span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li class="active"><a href="#" rel="">默認</a></li>
                                                <li class=""><a href="#" rel="muted">禁用</a></li>
                                                <li class=""><a href="#" rel="text-warning">警告</a></li>
                                                <li class=""><a href="#" rel="text-error">錯誤</a></li>
                                                <li class=""><a href="#" rel="text-info">提示</a></li>
                                                <li class=""><a href="#" rel="text-success">成功</a></li>
                                            </ul>
                                        </span></span>

                                    <div class="preview">標題列</div>
                                    <div class="view">
                                        <h3 contenteditable="true">h3. 這是一套視覺化佈局系統.</h3>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">對齊 <span
                                                class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="text-left">靠左</a></li>
                                                    <li class=""><a href="#" rel="text-center">居中</a></li>
                                                    <li class=""><a href="#" rel="text-right">靠右</a></li>
                                                </ul>
                                            </span><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">標記

                                            <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="muted">禁用</a></li>
                                                    <li class=""><a href="#" rel="text-warning">警告</a></li>
                                                    <li class=""><a href="#" rel="text-error">錯誤</a></li>
                                                    <li class=""><a href="#" rel="text-info">提示</a></li>
                                                    <li class=""><a href="#" rel="text-success">成功</a></li>
                                                </ul>
                                            </span><a class="btn btn-mini" href="#" rel="lead">Lead</a> </span>

                                    <div class="preview">段落</div>
                                    <div class="view" contenteditable="true">
                                        <p><em>Git</em>是一個分散式的版本控制系統，最初由<b>Linus Torvalds</b>編寫，用作Linux內核代碼的管理。在推出後，Git在其它項目中也取得了很大成功，尤其是在Ruby社區中。 </p>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                            data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">地址</div>
                                    <div class="view">
                                        <address contenteditable="true">
                                            <strong>Twitter, Inc.</strong><br>
                                            795 Folsom Ave, Suite 600<br>
                                            San Francisco, CA 94107<br>
                                            <abbr title="Phone">P:</abbr>
                                            (123) 456-7890
                                        </address>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration"><a class="btn btn-mini" href="#" rel="pull-right">右對齊</a> </span>

                                    <div class="preview">引用塊</div>
                                    <div class="view clearfix">
                                        <blockquote contenteditable="true">
                                            <p>github是一個全球化的開源社區.</p>
                                            <small>關鍵字 <cite title="Source Title">開源</cite></small>
                                        </blockquote>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="unstyled">無樣式</a> <a class="btn btn-mini" href="#" rel="inline">嵌入</a> </span>

                                    <div class="preview">無序列表</div>
                                    <div class="view">
                                        <ul contenteditable="true">
                                            <li>新聞資訊</li>
                                            <li>體育競技</li>
                                            <li>娛樂八卦</li>
                                            <li>前沿科技</li>
                                            <li>環球財經</li>
                                            <li>天氣預報</li>
                                            <li>房產家居</li>
                                            <li>網路遊戲</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="unstyled">無樣式</a> <a class="btn btn-mini" href="#" rel="inline">嵌入</a> </span>

                                    <div class="preview">有序列表</div>
                                    <div class="view">
                                        <ol contenteditable="true">
                                            <li>新聞資訊</li>
                                            <li>體育競技</li>
                                            <li>娛樂八卦</li>
                                            <li>前沿科技</li>
                                            <li>環球財經</li>
                                            <li>天氣預報</li>
                                            <li>房產家居</li>
                                            <li>網路遊戲</li>
                                        </ol>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="dl-horizontal">豎向對齊</a> </span>

                                    <div class="preview">詳細描述</div>
                                    <div class="view">
                                        <dl contenteditable="true">
                                            <dt>Rolex</dt>
                                            <dd>勞力士創始人為漢斯.威爾斯多夫，1908年他在瑞士將勞力士註冊為商標。</dd>
                                            <dt>Vacheron Constantin</dt>
                                            <dd>始創於1775年的江詩丹唐已有250年歷史，</dd>
                                            <dd>是世界上歷史最悠久、延續時間最長的名表之一。</dd>
                                            <dt>IWC</dt>
                                            <dd>創立於1868年的萬國表有“機械表專家”之稱。</dd>
                                            <dt>Cartier</dt>
                                            <dd>卡地亞擁有150多年歷史，是法國珠寶金銀首飾的製造名家。</dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">樣式 <span
                                                class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="table-striped">條紋</a></li>
                                                    <li class=""><a href="#" rel="table-bordered">邊框</a></li>
                                                </ul>
                                            </span><a class="btn btn-mini" href="#" rel="table-hover">滑鼠指示</a> <a class="btn btn-mini" href="#"
                                                rel="table-condensed">緊湊</a> </span>

                                    <div class="preview">表格</div>
                                    <div class="view">
                                        <table class="table" contenteditable="true">
                                            <thead>
                                                <tr>
                                                    <th>編號</th>
                                                    <th>產品</th>
                                                    <th>交付時間</th>
                                                    <th>狀態</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>TB - Monthly</td>
                                                    <td>01/04/2012</td>
                                                    <td>Default</td>
                                                </tr>
                                                <tr class="success">
                                                    <td>1</td>
                                                    <td>TB - Monthly</td>
                                                    <td>01/04/2012</td>
                                                    <td>Approved</td>
                                                </tr>
                                                <tr class="error">
                                                    <td>2</td>
                                                    <td>TB - Monthly</td>
                                                    <td>02/04/2012</td>
                                                    <td>Declined</td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>3</td>
                                                    <td>TB - Monthly</td>
                                                    <td>03/04/2012</td>
                                                    <td>Pending</td>
                                                </tr>
                                                <tr class="info">
                                                    <td>4</td>
                                                    <td>TB - Monthly</td>
                                                    <td>04/04/2012</td>
                                                    <td>Call in to confirm</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="form-inline">嵌入</a> </span>

                                    <div class="preview">提交表單</div>
                                    <div class="view">
                                        <form>
                                            <fieldset>
                                                <legend contenteditable="true">表單項</legend>
                                                <label contenteditable="true">表簽名</label>
                                                <input type="text" placeholder="Type something…">
                                                <span class="help-block" contenteditable="true">這裡填寫説明資訊.</span>
                                                <label class="checkbox" contenteditable="true">
                                                    <input type="checkbox">
                                                    勾選同意
                                                </label>
                                                <button type="submit" class="btn" contenteditable="true">提交</button>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="form-inline">嵌入</a> </span>

                                    <div class="preview">搜索框</div>
                                    <div class="view">
                                        <form class="form-search">
                                            <input class="input-medium search-query" type="text">
                                            <button type="submit" class="btn" contenteditable="true">查找</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration"></span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                            data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">縱向表單</div>
                                    <div class="view">
                                        <form class="form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" for="inputEmail" contenteditable="true">郵箱</label>

                                                <div class="controls">
                                                    <input id="inputEmail" placeholder="Email" type="text">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="inputPassword" contenteditable="true">密碼</label>

                                                <div class="controls">
                                                    <input id="inputPassword" placeholder="Password" type="password">
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <label class="checkbox" contenteditable="true">
                                                        <input type="checkbox">
                                                        Remember me
                                                    </label>
                                                    <button type="submit" class="btn" contenteditable="true">登陸</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration"><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown"
                                                href="#">樣式 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="btn-primary">重點</a></li>
                                                    <li class=""><a href="#" rel="btn-info">信息</a></li>
                                                    <li class=""><a href="#" rel="btn-success">成功</a></li>
                                                    <li class=""><a href="#" rel="btn-warning">提醒</a></li>
                                                    <li class=""><a href="#" rel="btn-danger">危險</a></li>
                                                    <li class=""><a href="#" rel="btn-inverse">反轉</a></li>
                                                    <li class=""><a href="#" rel="btn-link">連結</a></li>
                                                </ul>
                                            </span><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">尺寸

                                            <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class=""><a href="#" rel="btn-large">大</a></li>
                                                    <li class="active"><a href="#" rel="">中</a></li>
                                                    <li class=""><a href="#" rel="btn-small">小</a></li>
                                                    <li class=""><a href="#" rel="btn-mini">微型</a></li>
                                                </ul>
                                            </span><a class="btn btn-mini" href="#" rel="btn-block">通欄</a> <a class="btn btn-mini" href="#"
                                                rel="disabled">禁用</a> </span>

                                    <div class="preview">按鈕</div>
                                    <div class="view">
                                        <button class="btn" type="button" contenteditable="true">按鈕</button>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration"><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown"
                                                href="#">樣式 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="img-rounded">圓角</a></li>
                                                    <li class=""><a href="#" rel="img-circle">圓圈</a></li>
                                                    <li class=""><a href="#" rel="img-polaroid">相框</a></li>
                                                </ul>
                                            </span></span>

                                    <div class="preview">圖片</div>
                                    <div class="view">
                                        <img alt="140x140" src="img/a.jpg">
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="nav nav-list accordion-group">
                            <li class="nav-header"><i class="icon-plus icon-white"></i>組件

                            <div class="pull-right popover-info">
                                <i class="icon-question-sign "></i>

                                <div class="popover fade right">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title">幫助</h3>

                                    <div class="popover-content">
                                        拖放組件到佈局框內. 拖入後你可以設置元件樣式. 查看這裡獲取更多幫助 <a target="_blank"
                                            href="http://twitter.github.io/bootstrap/components.html">Components.</a>
                                    </div>
                                </div>
                            </div>
                            </li>
                            <li style="display: none;" class="boxes" id="elmComponents">
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration"><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown"
                                                href="#">方向<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">橫向</a></li>
                                                    <li class=""><a href="#" rel="btn-group-vertical">豎向</a></li>
                                                </ul>
                                            </span></span>

                                    <div class="preview">按鈕組</div>
                                    <div class="view">
                                        <div class="btn-group">
                                            <button class="btn" type="button"><i class="icon-align-left"></i></button>
                                            <button class="btn" type="button"><i class="icon-align-center"></i></button>
                                            <button class="btn" type="button"><i class="icon-align-right"></i></button>
                                            <button class="btn" type="button"><i class="icon-align-justify"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="dropup">上拉</a> </span>

                                    <div class="preview">下拉式功能表</div>
                                    <div class="view">
                                        <div class="btn-group">
                                            <button class="btn" contenteditable="true">Action</button>
                                            <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                                            <ul class="dropdown-menu" contenteditable="true">
                                                <li><a href="#">操作</a></li>
                                                <li><a href="#">設置欄目</a></li>
                                                <li><a href="#">更多設置</a></li>
                                                <li class="divider"></li>
                                                <li class="dropdown-submenu"><a tabindex="-1" href="#">更多選項</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">操作</a></li>
                                                        <li><a href="#">設置欄目</a></li>
                                                        <li><a href="#">更多設置</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">樣式 <span
                                                class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class=""><a href="#" rel="nav-tabs">線框</a></li>
                                                    <li class=""><a href="#" rel="nav-pills">圖釘</a></li>
                                                </ul>
                                            </span><a class="btn btn-mini" href="#" rel="nav-stacked">切換格式</a> </span>

                                    <div class="preview">導航</div>
                                    <div class="view">
                                        <ul class="nav nav-tabs" contenteditable="true">
                                            <li class="active"><a href="#">首頁</a></li>
                                            <li><a href="#">資料</a></li>
                                            <li class="disabled"><a href="#">信息</a></li>
                                            <li class="dropdown pull-right"><a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉 <b
                                                class="caret"></b></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">操作</a></li>
                                                    <li><a href="#">設置欄目</a></li>
                                                    <li><a href="#">更多設置</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">分割線</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="well">嵌入</a> </span>

                                    <div class="preview">導航列表</div>
                                    <div class="view">
                                        <ul class="nav nav-list" contenteditable="true">
                                            <li class="nav-header">列表標題</li>
                                            <li class="active"><a href="#">首頁</a></li>
                                            <li><a href="#">庫</a></li>
                                            <li><a href="#">應用</a></li>
                                            <li class="nav-header">功能列表</li>
                                            <li><a href="#">資料</a></li>
                                            <li><a href="#">設置</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">幫助</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                            data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">麵包導航</div>
                                    <div class="view">
                                        <ul class="breadcrumb" contenteditable="true">
                                            <li><a href="#">主頁</a> <span class="divider">/</span></li>
                                            <li><a href="#">類目</a> <span class="divider">/</span></li>
                                            <li class="active">主題</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">尺寸 <span
                                                class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class=""><a href="#" rel="pagination-large">大</a></li>
                                                    <li class="active"><a href="#" rel="">中</a></li>
                                                    <li class=""><a href="#" rel="pagination-small">小</a></li>
                                                    <li class=""><a href="#" rel="pagination-mini">微型</a></li>
                                                </ul>
                                            </span><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">位置

                                            <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">靠左</a></li>
                                                    <li class=""><a href="#" rel="pagination-centered">居中</a></li>
                                                    <li class=""><a href="#" rel="pagination-right">靠右</a></li>
                                                </ul>
                                            </span></span>

                                    <div class="preview">翻頁</div>
                                    <div class="view">
                                        <div class="pagination">
                                            <ul contenteditable="true">
                                                <li><a href="#">上一頁</a></li>
                                                <li><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li><a href="#">下一頁</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">樣式 <span
                                                class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="badge-success">成功</a></li>
                                                    <li class=""><a href="#" rel="badge-warning">警告</a></li>
                                                    <li class=""><a href="#" rel="badge-important">重要</a></li>
                                                    <li class=""><a href="#" rel="badge-info">提示</a></li>
                                                    <li class=""><a href="#" rel="badge-inverse">倒數</a></li>
                                                </ul>
                                            </span></span>

                                    <div class="preview">文字標籤</div>
                                    <div class="view"><span class="label" contenteditable="true">文字標籤</span></div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">樣式 <span
                                                class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="badge-success">成功</a></li>
                                                    <li class=""><a href="#" rel="badge-warning">警告</a></li>
                                                    <li class=""><a href="#" rel="badge-important">重要</a></li>
                                                    <li class=""><a href="#" rel="badge-info">提示</a></li>
                                                    <li class=""><a href="#" rel="badge-inverse">倒數</a></li>
                                                </ul>
                                            </span></span>

                                    <div class="preview">微標</div>
                                    <div class="view"><span class="badge" contenteditable="true">1</span></div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="well">嵌入</a> </span>

                                    <div class="preview">概述</div>
                                    <div class="view">
                                        <div class="hero-unit" contenteditable="true">
                                            <h1>Hello, world!</h1>

                                            <p>這是一個視覺化佈局範本, 你可以點擊範本裡的文字進行修改, 也可以通過點擊彈出的編輯方塊進行富文本修改. 拖動區塊能實現排序. </p>

                                            <p><a class="btn btn-primary btn-large" href="#">參看更多 »</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                            data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">頁標題</div>
                                    <div class="view">
                                        <div class="page-header" contenteditable="true">
                                            <h1>頁標題範例

                                            <small>此處編寫頁標題</small>
                                            </h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                            data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">文本</div>
                                    <div class="view">
                                        <h2 contenteditable="true">標題</h2>

                                        <p contenteditable="true">本視覺化佈局程式在HTML5流覽器上運行更加完美, 能實現自動當地語系化保存, 即使關閉了網頁, 下一次打開仍然能恢復上一次的操作.</p>

                                        <p><a class="btn" href="#" contenteditable="true">查看更多 »</a></p>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                            data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">預覽列表</div>
                                    <div class="view">
                                        <ul class="thumbnails">
                                            <li class="span4">
                                                <div class="thumbnail">
                                                    <img alt="300x200" src="img/people.jpg">

                                                    <div class="caption" contenteditable="true">
                                                        <h3>馮諾爾曼結構</h3>

                                                        <p>也稱普林斯頓結構，是一種將程式指令記憶體和資料記憶體合併在一起的記憶體結構。程式指令存儲位元址和資料存儲位址指向同一個記憶體的不同物理位置。</p>

                                                        <p><a class="btn btn-primary" href="#">流覽</a> <a class="btn" href="#">分享</a></p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="span4">
                                                <div class="thumbnail">
                                                    <img alt="300x200" src="img/city.jpg">

                                                    <div class="caption" contenteditable="true">
                                                        <h3>哈佛結構</h3>

                                                        <p>哈佛結構是一種將程式指令存儲和資料存儲分開的記憶體結構，它的主要特點是將程式和資料存儲在不同的存儲空間中，進行獨立編址。</p>

                                                        <p><a class="btn btn-primary" href="#">流覽</a> <a class="btn" href="#">分享</a></p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="span4">
                                                <div class="thumbnail">
                                                    <img alt="300x200" src="img/sports.jpg">

                                                    <div class="caption" contenteditable="true">
                                                        <h3>改進型哈佛結構</h3>

                                                        <p>改進型的哈佛結構具有一條獨立的位址匯流排和一條獨立的資料匯流排，兩條匯流排由程式記憶體和資料記憶體分時複用，使結構更緊湊。</p>

                                                        <p><a class="btn btn-primary" href="#">流覽</a> <a class="btn" href="#">分享</a></p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration"><span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown"
                                                href="#">樣式 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="progress-info">提示</a></li>
                                                    <li class=""><a href="#" rel="progress-success">成功</a></li>
                                                    <li class=""><a href="#" rel="progress-warning">警告</a></li>
                                                    <li class=""><a href="#" rel="progress-danger">危險</a></li>
                                                </ul>
                                            </span><a class="btn btn-mini" href="#" rel="progress-striped">條紋</a> <a class="btn btn-mini" href="#"
                                                rel="active">動畫</a> </span>

                                    <div class="preview">進度條</div>
                                    <div class="view">
                                        <div class="progress">
                                            <div class="bar" style="width: 60%;"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span> <span
                                            class="configuration">
                                            <button type="button" class="btn btn-mini" data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="well">嵌入</a> </span>

                                    <div class="preview">嵌入媒體</div>
                                    <div class="view">
                                        <div class="media">
                                            <a href="#" class="pull-left">
                                                <img src="img/a_002.jpg" class="media-object">
                                            </a>

                                            <div class="media-body" contenteditable="true">
                                                <h4 class="media-heading">嵌入媒體標題</h4>
                                                請儘量使用HTML5相容的視頻格式和視頻代碼實現視頻播放, 以達到更好的體驗效果.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="nav nav-list accordion-group">
                            <li class="nav-header"><i class="icon-plus icon-white"></i>交互組件 <span class="label label-important">NEW!</span>

                                <div class="pull-right popover-info">
                                    <i class="icon-question-sign "></i>

                                    <div class="popover fade right">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title">幫助</h3>

                                        <div class="popover-content">
                                            拖放組件到佈局容器. 拖入後, 你可以配置顯示樣式. 如果有任何疑問可訪問 <a target="_blank"
                                                href="http://twitter.github.io/bootstrap/javascript.html">JavaScript.</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="display: none;" class="boxes mute" id="elmJS">
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">遮罩表單</div>
                                    <div class="view">
                                        <!-- Button to trigger modal -->
                                        <a id="myModalLink" href="#myModalContainer" role="button" class="btn" data-toggle="modal"
                                            contenteditable="true">觸發遮罩表單</a>

                                        <!-- Modal -->
                                        <div id="myModalContainer" class="modal hide fade" tabindex="-1" role="dialog"
                                            aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3 id="myModalLabel" contenteditable="true">標題列</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p contenteditable="true">顯示資訊</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">關閉</button>
                                                <button class="btn btn-primary" contenteditable="true">保存設置</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i
                                            class="icon-move"></i>拖動</span> <span class="configuration">
                                                <button type="button" class="btn btn-mini"
                                                    data-target="#editorModal"
                                                    role="button" data-toggle="modal">
                                                    編輯
                                                </button>
                                                <a class="btn btn-mini" href="#" rel="navbar-inverse">Inverse</a>
                                                <!--a class="btn btn-mini" href="#" rel="navbar-fixed-top">Navbar fixed top</a-->
                                            </span>

                                    <div class="preview">巡覽列</div>
                                    <div class="view">
                                        <div class="navbar">
                                            <div class="navbar-inner">
                                                <div class="container-fluid">
                                                    <a data-target=".navbar-responsive-collapse" data-toggle="collapse"
                                                        class="btn btn-navbar"><span class="icon-bar"></span><span
                                                            class="icon-bar"></span><span class="icon-bar"></span></a><a href="#" class="brand"
                                                                contenteditable="true">網站名</a>

                                                    <div class="nav-collapse collapse navbar-responsive-collapse">
                                                        <ul class="nav" contenteditable="true">
                                                            <li class="active"><a href="#">主頁</a></li>
                                                            <li><a href="#">連結</a></li>
                                                            <li><a href="#">連結</a></li>
                                                            <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">下拉式功能表

                                                            <b class="caret"></b></a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#">下拉導航1</a></li>
                                                                    <li><a href="#">下拉導航2</a></li>
                                                                    <li><a href="#">其他</a></li>
                                                                    <li class="divider"></li>
                                                                    <li class="nav-header">標籤</li>
                                                                    <li><a href="#">連結1</a></li>
                                                                    <li><a href="#">連結2</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                        <ul class="nav pull-right" contenteditable="true">
                                                            <li><a href="#">右邊連結</a></li>
                                                            <li class="divider-vertical"></li>
                                                            <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">下拉式功能表

                                                            <b class="caret"></b></a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#">下拉導航1</a></li>
                                                                    <li><a href="#">下拉導航2</a></li>
                                                                    <li><a href="#">其他</a></li>
                                                                    <li class="divider"></li>
                                                                    <li><a href="#">連結3</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- /.nav-collapse -->
                                                </div>
                                            </div>
                                            <!-- /navbar-inner -->
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i
                                            class="icon-move"></i>拖動</span> <span class="configuration">
                                                <button type="button" class="btn btn-mini"
                                                    data-target="#editorModal"
                                                    role="button" data-toggle="modal">
                                                    編輯
                                                </button>
                                                <span class="btn-group"><a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">位置

                                                <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li class="active"><a href="#" rel="">默認</a></li>
                                                        <li class=""><a href="#" rel="tabs-below">底部</a></li>
                                                        <li class=""><a href="#" rel="tabs-left">靠左</a></li>
                                                        <li class=""><a href="#" rel="tabs-right">靠右</a></li>
                                                    </ul>
                                                </span></span>

                                    <div class="preview">切換卡</div>
                                    <div class="view">
                                        <div class="tabbable" id="myTabs">
                                            <!-- Only required for left/right tabs -->
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a href="#tab1" data-toggle="tab" contenteditable="true">第一部分</a></li>
                                                <li><a href="#tab2" data-toggle="tab" contenteditable="true">第二部分</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab1" contenteditable="true">
                                                    <p>第一部分內容.</p>
                                                </div>
                                                <div class="tab-pane" id="tab2" contenteditable="true">
                                                    <p>第二部分內容.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i
                                            class="icon-move"></i>拖動</span> <span class="configuration"><span class="btn-group"><a
                                                class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">樣式 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="active"><a href="#" rel="">默認</a></li>
                                                    <li class=""><a href="#" rel="alert-info">提示</a></li>
                                                    <li class=""><a href="#" rel="alert-error">錯誤</a></li>
                                                    <li class=""><a href="#" rel="alert-success">成功</a></li>
                                                </ul>
                                            </span></span>

                                    <div class="preview">提示框</div>
                                    <div class="view">
                                        <div class="alert" contenteditable="true">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <h4>提示!</h4>
                                            <strong>警告!</strong> 請注意你的個人隱私安全.
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal"
                                            role="button" data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">手風琴切換</div>
                                    <div class="view">
                                        <div class="accordion" id="myAccordion">
                                            <div class="accordion-group">
                                                <div class="accordion-heading">
                                                    <a class="accordion-toggle" data-toggle="collapse"
                                                        data-parent="#myAccordion" href="#collapseOne"
                                                        contenteditable="true">選項卡 #1 </a>
                                                </div>
                                                <div id="collapseOne" class="accordion-body collapse in">
                                                    <div class="accordion-inner" contenteditable="true">功能塊...</div>
                                                </div>
                                            </div>
                                            <div class="accordion-group">
                                                <div class="accordion-heading">
                                                    <a class="accordion-toggle" data-toggle="collapse"
                                                        data-parent="#myAccordion" href="#collapseTwo"
                                                        contenteditable="true">選項卡 #2 </a>
                                                </div>
                                                <div id="collapseTwo" class="accordion-body collapse">
                                                    <div class="accordion-inner" contenteditable="true">功能塊...</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i
                                        class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                    <span class="configuration">
                                        <button type="button" class="btn btn-mini" data-target="#editorModal"
                                            role="button" data-toggle="modal">
                                            編輯
                                        </button>
                                    </span>

                                    <div class="preview">輪換圖</div>
                                    <div class="view">
                                        <div class="carousel slide" id="myCarousel">
                                            <ol class="carousel-indicators">
                                                <li class="active" data-slide-to="0" data-target="#myCarousel"></li>
                                                <li data-slide-to="1" data-target="#myCarousel" class=""></li>
                                                <li data-slide-to="2" data-target="#myCarousel" class=""></li>
                                            </ol>
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <img alt="" src="img/1.jpg">

                                                    <div class="carousel-caption" contenteditable="true">
                                                        <h4>棒球</h4>

                                                        <p>棒球運動是一種以棒打球為主要特點，集體性、對抗性很強的球類運動項目，在美國、日本尤為盛行。</p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img alt="" src="img/2.jpg">

                                                    <div class="carousel-caption" contenteditable="true">
                                                        <h4>衝浪</h4>

                                                        <p>衝浪是以海浪為動力，利用自身的高超技巧和平衡能力，搏擊海浪的一項運動。運動員站立在衝浪板上，或利用腹板、跪板、充氣的橡皮墊、划艇、皮艇等駕馭海浪的一項水上運動。</p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img alt="" src="img/3.jpg">

                                                    <div class="carousel-caption" contenteditable="true">
                                                        <h4>自行車</h4>

                                                        <p>以自行車為工具比賽騎行速度的體育運動。1896年第一屆奧林匹克運動會上被列為正式比賽專案。環法賽為最著名的世界自行車錦標賽。</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <a data-slide="prev" href="#myCarousel" class="left carousel-control">‹</a> <a data-slide="next"
                                                href="#myCarousel"
                                                class="right carousel-control">›</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="nav nac-list accordion-group">
                            <li class="nav-header"><i class="icon-plus icon-white"></i>MTA UI 元件

                            <div class="pull-right popover-info">
                                <i class="icon-question-sign "></i>

                                <div class="popover fade right">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title">幫助</h3>

                                    <div class="popover-content">
                                        拖放組件到佈局容器. 拖入後, 你可以配置顯示樣式. 如果有任何疑問可訪問 <a target="_blank"
                                            href="http://twitter.github.io/bootstrap/javascript.html">JavaScript.</a>
                                    </div>
                                </div>
                            </div>
                            </li>
                            <li style="display: none;" class="boxes mute" id="elmMTA">
                                <div class="box box-element ui-draggable">
                                    <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>刪除</a>
                                    <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="preview">MTA-Grid</div>
                                    <div class="view">
                                        <div class="MTA-GRID" state="init">
                                            <div class="mta-settings">
                                                <span class="label label-success mta-type">MTA-GRID</span>
                                                <span class="label mta-userinfo"></span>
                                                <span class="label">請選擇Domain Object:</span>
                                                <select class="form-control mta-object-select"></select>
                                                <input type="hidden" class="mta-selected-objid" value="">
                                                <input type="hidden" class="mta-cols-positions" value="">
                                            </div>
                                            <div class="mta-ui-show">
                                                <table class="table" contenteditable="false">
                                                    <thead>
                                                        <tr>
                                                            <th>column1</th>
                                                            <th>column2</th>
                                                            <th>column3</th>
                                                            <th>column4</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                            <td>........</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="gridster">
                                                <ul></ul>
                                            </div>
                                            <div class="mta-ui-code">
                                                <mta-grid objectid='' cols='' tenantid='1'></mta-grid>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-element ui-draggable">

                                    <div class="preview">MTA-Form</div>
                                    <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>刪除</a>
                                    <span class="drag label"><i class="icon-move"></i>拖動</span>

                                    <div class="view">
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="nav nav-list accordion-group">
                            <li class="nav-header"><i class="icon-plus icon-white"></i>應用擴展</li>
                            <li style="display: none;" class="boxes mute" id="elmComm">
                                <div class="preview">建設中...</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--/span-->
                <div class="demo ui-sortable" style="min-height: 304px;">

                    <div class="lyrow">
                        <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>remove</a>
                        <span class="drag label"><i class="icon-move"></i>drag</span>

                        <div class="preview">9 3</div>
                        <div class="view">
                            <div class="row-fluid clearfix">
                                <div class="span12 column ui-sortable">

                                    <div class="box box-element ui-draggable" style="display: block;">
                                        <a href="#close"
                                            class="remove label label-important"><i
                                                class="icon-remove icon-white"></i>刪除</a> <span class="drag label"><i class="icon-move"></i>拖動</span>
                                        <span class="configuration">
                                            <button type="button" class="btn btn-mini"
                                                data-target="#editorModal" role="button"
                                                data-toggle="modal">
                                                編輯
                                            </button>
                                            <a class="btn btn-mini" href="#" rel="well">嵌入</a> </span>

                                        <div class="preview">概述</div>
                                        <div class="view">
                                            <div class="hero-unit" contenteditable="true">
                                                <p>一種風，只流浪在一座山谷；</p>

                                                <p>一道堤，只護住一灣星河。</p>

                                                <p>每次仰望星空，我總是閉上眼，</p>

                                                <p>因為最美的一顆不在天上。</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end demo -->
                <!--/span-->
                <div id="download-layout">
                    <div class="container-fluid"></div>
                </div>
            </div>
            <!--/row-->
        </div>
        <!--/.fluid-container-->
        <div class="modal hide fade" role="dialog" id="editorModal">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>

                <h3>編輯</h3>
            </div>
            <div class="modal-body">
                <p>
                    <textarea id="contenteditor"></textarea>
                </p>
            </div>
            <div class="modal-footer">
                <a id="savecontent" class="btn btn-primary" data-dismiss="modal">保存</a> <a class="btn"
                    data-dismiss="modal">關閉</a>
            </div>
        </div>
        <div class="modal hide fade" role="dialog" id="downloadModal">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>

                <h3>下載</h3>
            </div>
            <div class="modal-body">
                <p>已在下面生成乾淨的HTML, 可以複製粘貼代碼到你的項目.</p>

                <div class="btn-group">
                    <button type="button" id="fluidPage" class="active btn btn-info">
                        <i class="icon-fullscreen icon-white"></i>
                        自我調整寬度
                    </button>
                    <button type="button" class="btn btn-info" id="fixedPage">
                        <i class="icon-screenshot icon-white"></i>固定寬度
                    </button>
                </div>
                <br>
                <br>

                <p>
                    <textarea></textarea>
                </p>
            </div>
            <div class="modal-footer"><a class="btn" data-dismiss="modal">關閉</a></div>
        </div>
        <div class="modal hide fade" role="dialog" id="shareModal">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>

                <h3>保存</h3>
            </div>
            <div class="modal-body">保存成功</div>
            <div class="modal-footer"><a class="btn" data-dismiss="modal">Close</a></div>
        </div>

        <asp:HiddenField ID="userId" runat="server" Value="" />
        <asp:HiddenField ID="tenantId" runat="server" Value="" />
        <asp:HiddenField ID="pageId" runat="server" Value="" />
        <asp:HiddenField ID="pageName" runat="server" Value="" />
        <asp:HiddenField ID="pageFilePath" runat="server" Value="" />
        <asp:HiddenField ID="pageContent" runat="server" Value="" />
        <asp:HiddenField ID="layoutitConent" runat="server" Value="" />


        <div id="CustObjects"></div>



    </form>


</body>
</html>
