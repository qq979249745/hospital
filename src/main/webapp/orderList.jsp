<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2019/1/8
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预约记录--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>

</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <c:if test="${requestScope.list != null}">
            <div class="container1">
                <style>
                    .yyjj{
                        width: 750px;
                        height: 30px;
                        text-align: left;
                        text-indent: 15px;
                        background: rgb(61, 175, 167);
                        border-bottom: 1px solid rgb(219, 219, 219);
                        color: rgb(255,255,255);
                        font-size: 18px;
                        line-height: 30px;
                    }
                    .box{
                        margin: 10px 0;
                        width:750px;
                        height: 125px;
                        border: #44495a 1px solid;
                    }
                    .box:after{
                        content: '';
                        clear: both;
                        display: block;
                    }
                     .pic{
                        width:100px;
                        float: left;
                         height: 125px;
                    }
                    .pic img{
                        width:100px;
                        height: 123px;
                    }
                    .box table{
                        float: left;
                        margin: 10px;
                    }
                    .box .operate{
                        line-height: 60px;
                    }
                    .box .operate div{
                        margin-left: 20px;
                        float: left;
                    }
                    a{
                        color: #0065AF;
                    }
                    a:hover{
                        text-decoration:underline;
                    }
                </style>
                <div class="yyjj">预约记录</div>
                <c:if test="${sessionScope.message!=null}">
                    <script>
                        $(function () {
                            alert("${sessionScope.message}");
                        })
                    </script>
                    ${sessionScope.remove("message")}
                </c:if>
                <c:forEach var="item" items="${requestScope.list}">
                    <div class="box">
                        <div class="pic"><img src="${item.picpath}"></div>
                        <table style="width: 28%">
                            <tr><td>医生：</td><td><a href="showWeek?did=${item.did}">${item.dname}</a></td></tr>
                            <tr><td>科室：</td><td><a href="searchOffice?office=${item.office}">${item.office}</a></td></tr>
                            <tr><td>诊室：</td><td>${item.room}</td></tr>
                            <tr><td>诊费：</td><td>${item.fee}.00元</td></tr>
                        </table>
                        <table>
                            <tr><td>预约时间：</td><td>${item.ordertime}</td></tr>
                            <tr><td>就诊时间：</td><td>${item.visitdate} ${item.visitnoon} ${item.visittime}</td></tr>
                            <tr><td>序号：</td><td>${item.serialnumber}号</td></tr>
                            <tr><td>状态：</td><td>${item.state}</td></tr>
                        </table>
                        <c:if test="${item.state=='成功'}">
                        <div class="operate">
                            <div><button type="button" data-ampm="${item.visitnoon}" data-date="${item.visitdate}" data-rid="${item.rid}" data-wid="${item.wid}" class="btn btn-primary btn-xs" style="margin-top: 20px;" data-toggle="modal" data-target="#myModal">
                                修改预约
                            </button></div>
                            <div><button type="button" data-rid="${item.rid}"  class="btn btn-warning btn-xs" style="margin-top: 20px;" data-toggle="modal" data-target="#myModal">
                                取消预约
                            </button></div>
                        </div></c:if>
                    </div>
                </c:forEach>


                <%--修改预约和取消--%>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" style="margin-top: 200px;" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"></h4>
                            </div>
                            <form action='order' method='post'>
                            <input id="action" hidden value="alter" name="action">
                            <input id="rid" hidden  name="rid">
                            <div class="modal-body">
                                <div class="haoyuan">
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                                <style>
                                .haoyuan{
                                    margin: 20px auto;
                                    height: 500px;
                                    overflow-y: scroll;
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
                            var wid = button.data('wid');
                            var rid = button.data('rid');
                            var ampm = button.data('ampm');
                            console.log(rid);
                            $("#rid").val(rid);
                            if(ampm==null){
                                $("#action").val("cancel");
                                var options="";
                                 options+="<label><input  type='radio'>确定取消吗？</label></li>";
                                $(".modal-body").empty();
                                ($(options)).appendTo($(".modal-body"));
                            }else {
                                $("#action").val("alter");
                                var date = button.data('date');
                                var options="<div class='haoyuan'><ul></ul></div>";
                                $(".modal-body").empty();
                                ($(options)).appendTo($(".modal-body"));
                                $.post("<%=request.getContextPath()%>/queryNumSource",{wid:wid,ampm:ampm,date:date},
                                    function(data){
                                        console.log(data);
                                        var options="";
                                        for(var i=0;i<data.length;i++){
                                            options+="<li class='"+data[i].state+"' ><label>" +
                                                "<input  type='radio' name='data' value='"+data[i].serialnumber+","+data[i].date+","+data[i].ampm+","+data[i].time+"'>" +
                                                "就诊序号-"+data[i].serialnumber+"号 号源时间 - "+data[i].date+data[i].ampm+data[i].time+" "+data[i].state+"</label></li>"
                                        }
                                        $(".haoyuan ul").empty();
                                        ($(options)).appendTo($(".haoyuan ul"));
                                        $('.已被预约 input').attr("disabled","true");
                                    });
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
        </c:if>


    </div>
</div>

</body>
</html>
