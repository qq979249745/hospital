<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线预约挂号系统（管理员)</title>
    <jsp:include page="include/headtag.jsp"/>

</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div class="search">
            <h1>科室列表</h1>
            <div class="alert-danger">${message}</div>
                <button type="button" style="color: #eeeeee"  class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#myModal">
                    添加科室
                </button>
            <form id="office" action="office" method="post" style="margin-top: 10px">
                <input  value="${office}" name="office"  autocomplete="off" class="" placeholder="科室名称">
                <input id="start" hidden value="1" name="start">
                <button type="submit">查找科室</button>
            </form>
            <style>
                .search{
                    height:180px;
                    border-bottom: 2px #2e2e2e solid;
                }
                .search input{
                    height: 40px;
                    width: 200px;
                    color: #2e2e2e;
                    padding: 0 20px;
                    border-radius: 4px;
                }
                .search button{
                    height: 40px;
                    color: #2e2e2e;
                    padding: 0 20px;
                    border-radius: 2px;
                    cursor: pointer;
                }
                .search button:hover{
                    color: #0065AF;
                }
            </style>
        </div>

        <div id="offices">
            <c:forEach items="${offices}" var="item" varStatus="id">
                <a href="officeDetail?office=${item.officename} ">
                    <div class="office-item">
                        <div class="office-name">
                            <h3>${item.officename}</h3>
                        </div>
                        <div>
                            <p>${item.doctornum}位医生</p>
                            <p  class="office-click">详细信息</p>
                        </div>
                    </div>
                </a>
            </c:forEach>

            <style>
                #offices:after{
                    content: "";
                    clear: both;
                    display: block;
                }
                .office-item{
                    width: 230px;
                    height: 180px;
                    float: left;
                    text-align: center;
                    border: 1px solid #dddddd;
                    margin: 30px ;
                }
                .office-item .office-name{
                    margin: 30px auto;
                    color: #000;
                }
                .office-item p{
                    margin: 30px auto;
                    color: #2b66a5;
                }
                .office-item .office-click{
                    color: #de615e;
                    font-size: 15px;
                    cursor: pointer;
                }
            </style>
        </div>
        <c:if test="${pages.totalPage > 0}">
            <form id="pagination">

                <ul class="pagination">
                    <li <c:if test="${pages.currentPage < 1}">class="disabled"</c:if>><a
                            onclick="jump('${pages.prePage }')">&laquo;</a></li>
                    <c:forEach begin="${pages.pageNumStart }" end="${pages.pageNumEnd }"
                               varStatus="status">
                        <li>
                            <a <c:if test="${status.index == pages.currentPage }">class="disabled"</c:if>
                               onclick="jump('${status.index }')">
                                    ${status.index } </a>
                        </li>
                    </c:forEach>
                    <li
                            <c:if test="${pages.currentPage> pages.totalPage}">class="disabled"</c:if>>
                        <a onclick="jump('${pages.nextPage }')">&raquo;</a>
                    </li>
                    <li><input id="index"></li>
                    <li><a onclick="jumpInput()">Go</a></li>
                    <li><a class="disabled">共${pages.totalPage}页${pages.totalRecord}条记录</a>

                        <script>
                            function jump(index) {
                                $("#start").val(index);
                                $("#office").submit();
                            }
                            function jumpInput() {
                                var index=$("#index").val();
                                var match = /^[1-9][0-9]*[0-9]*$/;
                                if(match.test(index)){
                                    jump(index);
                                }else {
                                    alert("请输入数字！")
                                }
                            }
                        </script>
                        <style>
                            #pagination{
                                width: 90%;
                                text-align: center;
                            }
                            .pagination {
                                display: inline-block;
                                padding-left: 0;
                                margin: 21px 0;
                                border-radius: 4px;
                            }.pagination li{
                                 display: inline;
                             }

                            .pagination a{
                                border-radius: 6px;
                                color: #eb6864;
                                cursor: pointer;
                                padding: 14px 16px;
                                font-size: 19px;
                                line-height: 1.3333333;
                                border: 1px solid #dddddd;
                                margin-left: -1px;
                            }
                            .pagination a:hover{
                                background-color: #eeeeee;
                            }
                            .pagination input{
                                border: 1px solid #dddddd;
                                width: 60px;
                                padding: 8px 12px;
                                font-size: 15px;
                                line-height: 1.5;
                                color: #777777;
                            }
                            .pagination .disabled{
                                cursor: not-allowed;
                            }
                        </style>
                </ul>
            </form>
        </c:if>

        <%--添加科室--%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" style="margin-top: 200px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加科室</h4>
                    </div>
                    <form class="form-horizontal" action='office' method='post'>
                        <input id="action" hidden value="add" name="action">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="officename" class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input   name="officename" class="form-control" id="officename" placeholder="名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="description" class="col-sm-2 control-label">描述</label>
                                <div class="col-sm-10" >
                                    <textarea id="description" name="description" class="form-control" rows="3" placeholder="请输入科室描述信息"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button  type="submit" class="btn btn-primary order">确定</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


       <%-- <div>现有的科室<br>
            <select id="offices" name="office">
            </select>
            <script>
                $.get("<%=request.getContextPath()%>/admin/office?action=query",function(data){
                    var options="";
                    for(var i=0;i<data.length;i++){
                        options+="<option>"+data[i].officename+"</option>";
                    }
                    ($(options)).appendTo($("#offices"));
                });
            </script>
            <p style="color: #F85B78">${message}</p>
            <form method="post" action="<%=request.getContextPath()%>/admin/office?action=add">
                <p>添加科室：<input name="officename"></p>
                <p>科室描述：<input name="description"></p>
                <p><input type="submit"></p>
            </form>
        </div>--%>
    </div>
</div>
</body>
</html>
