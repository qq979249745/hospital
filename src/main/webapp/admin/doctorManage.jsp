<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线预约挂号系统（管理员)</title>
    <jsp:include page="include/headtag.jsp"/>

</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">

        <div class="search">
            <h1>医生列表</h1>
            <div class="alert-danger">${message}</div>
            <button type="button" style="color: #eeeeee"  class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#myModal">
                添加医生
            </button>
            <form style="margin-top: 10px" id="office" action="doctorManage" method="post">
                <input  value="${doctor}" name="doctor"  autocomplete="off" class="" placeholder="医生名字">
                <input  value="${office}" name="office"  autocomplete="off" class="" placeholder="科室名称">
                <input id="start" hidden value="1" name="start">
                <input  hidden value="query" name="action">
                <button type="submit">查找医生</button>
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

        <div class="doctors">
            <c:forEach items="${doctors}" var="item">
                <div class="ysjs">
                    <div class="title">
                        <div class="t">
                            <span><a href="scheduleManage?did=${item.did}">${item.dname}</a></span>
                            <span class="gender">${item.gender}</span>
                            <span class="career">${item.career}</span>
                            <span class="career">${item.age}岁</span>
                        </div>
                        <div class="b">
                            <span>${item.office} （${item.room}）</span>
                        </div>
                        <img src="${item.picpath}">
                    </div>
                    <div class="content">
                        <div >
                            <div>介绍：</div>
                            <div>${item.description}</div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <style>
                .doctors:after{
                    content: "";
                    clear: both;
                    display: block;
                }
                .ysjs{
                    float: left;
                    margin: 20px ;
                    height: 300px;
                    border-radius: 8px;
                    width: 680px;
                    border: 1px #000 solid;
                }
                .ysjs .title{
                    margin: 20px;
                    position: relative;
                }
                .ysjs .title:after{
                    visibility: hidden;
                    display: block;
                    font-size: 0;
                    content: "";
                    clear: both;
                    height: 0;
                }
                .ysjs .title .t span{
                    margin: 20px;
                    color: rgb(43,43,43);
                    font-size: 30px;
                    line-height: 30px;
                }
                .ysjs .title img{
                    position: absolute;
                    top: -20px;
                    left: 480px;
                    width: 100px;
                    height: 125px;
                }
                .ysjs .title .t .gender{
                    color:rgb(95, 156, 236);
                }
                .ysjs .title .t .career{
                    font-size: 17px;
                    margin-left: 30px;
                    color:rgb(61,175,167);
                }
                .ysjs .content {
                    border-top: 1px solid rgb(219, 219, 219);
                    margin: 30px;
                    text-align: left;
                    width: 640px;
                }
                .ysjs .content div{
                    padding-top: 10px;
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
                    <li><input autocomplete="off" id="index"></li>
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
            <div class="modal-dialog" style="margin-top: 100px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加医生</h4>
                    </div>
                    <form class="form-horizontal" action='doctorManage' method='post'>
                        <input id="action" hidden value="add" name="action">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="account" class="col-sm-2 control-label">医生账号</label>
                                <div class="col-sm-10">
                                    <input   name="account" class="form-control" id="account" placeholder="医生账号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">医生密码</label>
                                <div class="col-sm-10">
                                    <input   name="password" class="form-control" id="password" placeholder="医生密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">医生姓名</label>
                                <div class="col-sm-10">
                                    <input   name="name" class="form-control" id="name" placeholder="医生姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fee" class="col-sm-2 control-label">医生出诊费</label>
                                <div class="col-sm-10">
                                    <input type="number" name="fee" class="form-control" id="fee" placeholder="医生出诊费">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="age" class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-10">
                                    <input type="number" name="age" class="form-control" id="age" placeholder="年龄">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="gender" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10" >
                                    <select class="form-control" id="gender" name="gender">
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="offices" class="col-sm-2 control-label">科室</label>
                                <div class="col-sm-10" >
                                    <select class="form-control" id="offices" name="office1">
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
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="career" class="col-sm-2 control-label">医生职称</label>
                                <div class="col-sm-10" >
                                    <select class="form-control" id="career" name="career">
                                        <option>主任医师</option>
                                        <option>副主任医师</option>
                                        <option>专家</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="rooms" class="col-sm-2 control-label">诊室</label>
                                <div class="col-sm-10" >
                                    <select class="form-control" id="rooms" name="room">
                                    </select>
                                    <script>
                                        function post(select){
                                            $.post("<%=request.getContextPath()%>/room",
                                                {
                                                    action:"query",
                                                    officename:select
                                                },
                                                function(data){
                                                    console.log(data);
                                                    var options="";
                                                    for(var i=0;i<data.length;i++){
                                                        options+="<option>"+data[i].roomname+"</option>";
                                                    }
                                                    $("#rooms").empty();
                                                    ($(options)).appendTo($("#rooms"));
                                                });
                                        }
                                        $(function () {
                                            $("#offices").change(function (e) {
                                                post($("#offices").val());
                                            });
                                            setTimeout(function(){post($("#offices option:first").val());},800);
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="description" class="col-sm-2 control-label">描述</label>
                                <div class="col-sm-10" >
                                    <textarea id="description" name="description" class="form-control" rows="3" placeholder="请输入医生描述信息"></textarea>
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
    </div>
</div>

</body>
</html>
