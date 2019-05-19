<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${office.officename}--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">

        <div class="search">
            <h1>科室详情</h1>
        </div>

        <div class="office-info">
            <h3 class="office-name">
                ${office.officename}
            </h3>
            <h2>科室简介</h2>
            <div>
                ${office.description}
            </div>
            <div>
                该科室有${office.doctornum}位医生
            </div>
        <style>
            .office-info{
                border-top: 2px solid #1E9EB9;
            }
            .office-info .office-name{
                border: 1px solid #E8E8E8;
                background: #F7FDFE;
            }
            .office-info h2{
                border: 1px solid #E8E8E8;
                background: #F7FDFE;
            }
        </style>
        </div>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <td>序号</td>
                <td>诊室名称</td>
                <td>医生数量</td>
                <td>操作</td>
            </tr>
            </thead>
            <c:forEach var="item" items="${list1}" varStatus="statu">
                <tr>
                    <td>${statu.index+1}</td>
                    <td>${item.roomname}</td>
                    <td>${item.doctornum}</td>
                    <c:if test="${item.doctornum==0}">
                        <td ><a href="officeDetail?office=${office.officename}&roomname=${item.roomname}&action=delete">删除</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        <div class="alert-danger">${message}</div>
        <button type="button" style="color: #eeeeee"  class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#myModal">
            添加诊室
        </button>
        <%--添加科室--%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" style="margin-top: 200px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加诊室</h4>
                    </div>
                    <form class="form-horizontal" action='officeDetail' method='post'>
                        <input id="action" hidden value="add" name="action">
                        <input  hidden value="${office.officename}" name="office">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="roomname" class="col-sm-2 control-label">诊室名称</label>
                                <div class="col-sm-10">
                                    <input   name="roomname" class="form-control" id="roomname" placeholder="诊室名称">
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
