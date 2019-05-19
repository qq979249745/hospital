<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.WorkDay" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div class="container">
            <div class="h3 alert-info info">医生申请列表</div>
            <%--显示医生申请列表--%>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <td>序号</td>
                    <td>申请人</td>
                    <td>申请</td>
                    <td>工作日</td>
                    <td>申请时间</td>
                    <td>原因</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach var="item" items="${maps}" varStatus="statu">
                    <tr>
                        <td>${statu.index+1}</td>
                        <td>${item.dname}</td>
                        <td>${item.request}</td>
                        <td>星期${item.worktime}${item.ampm}</td>
                        <td>${item.applytime}</td>
                        <td>${item.reason}</td>
                        <td>${item.state}</td>
                        <td>
                        <c:if test="${item.state=='等待处理'}">
                            <button type="button" data-aid="${item.aid}" data-action="agree"  class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                                同意
                            </button>
                           <button type="button" data-aid="${item.aid}" data-action="reject" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal">
                                拒绝
                            </button>
                        </c:if></td>
                    </tr>
                </c:forEach>

            </table>
            <%--取消--%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" style="margin-top: 200px;" role="document">
                    <div class="modal-content" style="width: 650px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">医生申请管理</h4>
                        </div>
                        <form action='applyManage' method='post' autocomplete="off">
                            <input id="aid" hidden  name="aid">
                            <input  hidden id="action" name="action" value="cancel">
                            <div class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button id="doalert" type="button" class="btn btn-primary order">确定</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $('#myModal').on('show.bs.modal', function (event) {
                        var button = $(event.relatedTarget);
                        var aid = button.data('aid');
                        var action = button.data('action');
                        $("#aid").val(aid);
                        $("#action").val(action);
                        var options="";
                        if(action=="agree"){
                            $('.modal-body').empty();
                            options="<label ><input class='form-control' name='nsnum'  placeholder='输入号源数'></label><br><label ><input   type='radio'>同意</label>";
                            ($(options)).appendTo($(".modal-body"));
                        }else {
                            $('.modal-body').empty();
                            options="<label><input  type='radio'>拒绝？</label>";
                            ($(options)).appendTo($(".modal-body"));
                        }
                    });
                    $('#doalert').click(function () {
                        if($("input[type=radio]:checked").length==1){
                            $("form").submit();
                        }else {$('#myModal').modal('hide')}
                    })
                })

            </script>
        </div>
    </div>
</div>

</body>
</html>
