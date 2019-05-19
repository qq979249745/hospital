<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.WorkDay" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>患者队列--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div class="container">
            <div class="h3 alert-info info">患者队列</div>

            <%--显示患者队列--%>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <td>预约时间</td>
                    <td>就诊时间</td>
                    <td>就诊序号</td>
                    <td>预约状态</td>
                    <td>患者姓名</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.ordertime}</td>
                        <td>${item.visitdate} ${item.visitnoon} ${item.visittime}</td>
                        <td>${item.serialnumber}</td>
                        <td>${item.state}</td>
                        <td>${item.pname}</td>
                        <c:choose>
                            <c:when test="${item.state=='成功'}">
                                <td >
                                    <button type="button" data-rid="${item.rid}" data-pid="${item.pid}" data-action="finish"  class="btn btn-success btn-xs"  data-toggle="modal" data-target="#myModal">
                                        就诊完成
                                    </button>
                                    <button type="button" data-rid="${item.rid}" data-pid="${item.pid}" data-action="sy"   class="btn btn-danger btn-xs"  data-toggle="modal" data-target="#myModal">
                                        患者爽约
                                    </button>
                                </td>
                            </c:when>
                            <c:otherwise><td></td></c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
                <%--爽约或完成--%>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" style="margin-top: 200px;" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"></h4>
                            </div>
                            <form action='patientList' method='post'>
                                <input id="action" hidden value="" name="action">
                                <input id="rid" hidden name="rid">
                                <input id="pid" hidden name="pid">
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
                            var rid = button.data('rid');
                            var pid = button.data('pid');
                            var action = button.data('action');
                            $("#rid").val(rid);
                            $("#pid").val(pid);
                            $("#action").val(action);
                            var options="";
                            if(action=="finish"){
                                options+="<label><input  type='radio'>患者预约完成？</label></li>";
                            }else {
                                options+="<label><input  type='radio'>患者是否爽约？</label></li>";
                            }
                            $(".modal-body").empty();
                            ($(options)).appendTo($(".modal-body"));
                        });
                        $('#doalert').click(function () {
                            if ($("input[type=radio]:checked").length == 1) {
                                $("form").submit();
                            } else {
                                $('#myModal').modal('hide')
                            }
                        })
                    })
                </script>
            </table>

        </div>
    </div>
</div>

</body>
</html>
