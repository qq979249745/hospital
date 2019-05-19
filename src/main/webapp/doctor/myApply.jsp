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
            <div class="h3 alert-info info">我的申请</div>
            <%--显示我的申请--%>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <td>序号</td>
                    <td>申请</td>
                    <td>星期</td>
                    <td>申请时间</td>
                    <td>原因</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach var="item" items="${maps}" varStatus="statu">
                    <tr>
                        <td>${statu.index+1}</td>
                        <td>${item.request}</td>
                        <td>星期${item.worktime}${item.ampm}</td>
                        <td>${item.applytime}</td>
                        <td>${item.reason}</td>
                        <td>${item.state}</td> <td class="btn btn-info btn-link" data-aid="${item.aid}"data-toggle="modal" data-target="#myModal">
                        <c:if test="${item.state=='等待处理'}">
                           取消
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
                            <h4 class="modal-title" id="myModalLabel">请选择要锁定的号源</h4>
                        </div>
                        <form action='myApply' method='post'>
                            <input id="aid" hidden  name="aid">
                            <input  hidden  name="action" value="cancel">
                            <div class="modal-body">
                                <div class="haoyuan">
                                    <label><input  type='radio'>确定取消吗？</label></li>
                                </div>
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
                        $("#aid").val(aid);
                    });
                    $('#doalert').click(function () {
                        if($("input[type=radio]:checked").length==1){
                            $("form").submit();
                        }else {$('#myModal').modal('hide')}
                    })
                })

            </script>
            <%--显示预约的号源信息--%>
            <style>
                .haoyuan{
                    margin: 20px auto;
                    background-color: #eeeeee;
                }
                .haoyuan:after{
                    display: block;
                    content: '';
                    clear: both;
                }
                .haoyuan ul{
                    list-style: none;
                }
                .haoyuan ul li{
                    float: left;
                    margin:10px 20px;
                }
                .haoyuan ul .已被预约{
                    color: #999;
                }
                .haoyuan ul .可预约{
                    color: #0065AF;
                    cursor: pointer;
                }
                .haoyuan ul .可预约:hover{
                    background-color: #00E8D7;
                }
            </style>
        </div>
    </div>
</div>

</body>
</html>
