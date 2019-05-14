<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确定预约--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <c:if test="${numSource != null}">
            <div class="container1">
                <style>
                    .container1 .title{color: #00E8D7;margin:20px auto;display: table;}
                    .container1 .left{float: left;width: 30%;}
                    .container1 .left .send{background-color: #009F95;color:#fff;border-radius: 5px;border: #009F95;cursor: pointer;}
                    .container1 .left .confirm{text-align: center;background-color: #009F95;color:#fff;border-radius: 10px;height:30px;cursor:pointer;}
                </style>
                <h2 class="title">预约信息核对</h2>
                <div class="left">
                    <form autocomplete="off" method="post" action="order">
                        <input hidden name="wid" value="${numSource.state}">
                        <input hidden name="did" value="${doctor.did}">
                        <input hidden name="action" value="confirm">
                        <table>
                            <tr><td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td><td>${sessionScope.patient.name}</td></tr>
                            <tr><td>预约医生：</td><td>${doctor.dname}</td></tr>
                            <tr><td>预约科室：</td><td>${doctor.office}&nbsp;&nbsp;(${doctor.room})</td></tr>
                            <tr><td>就诊时间：</td><td>${numSource.visitdate} ${numSource.visitnoon} ${numSource.visittime}第${numSource.serialnumber}号</td></tr>
                            <tr><td>诊&nbsp;&nbsp;查&nbsp;&nbsp;费：</td><td>${doctor.fee}.00元</td></tr>
                            <tr><td>你的邮箱：</td><td>${sessionScope.patient.email}<button class="send">发送验证码</button></td></tr>
                            <tr><td>验&nbsp;&nbsp;证&nbsp;&nbsp;码：</td><td><input  id="checkcode" name="checkcode"></td></tr>
                            <tr><td colspan="2"  class="confirm">确定</td></tr>
                        </table>

                    </form>
                    <script>
                        $(function () {
                            $(".confirm").bind("click",function () {
                                //$("form").submit();
                                $.post("<%=request.getContextPath()%>/order",
                                    {
                                        action:"checkcode",
                                        checkcode:$("#checkcode").val()
                                    },
                                    function(data){
                                        if(data=="true"){
                                            $("form").submit();
                                        }else {
                                            alert("验证码错误！")
                                        }
                                        console.log(data);
                                    });
                            });
                            $(".send").bind("click",function () {
                                    $(".send").attr("disabled",true);
                                    sendEmail();
                                var time=60;
                                    var timer=setInterval(function () {

                                        $(".send").text("重新发送（"+time+"s）");
                                        time--;
                                        if(time<0){
                                            time=60;
                                            $(".send").attr("disabled",false);
                                            $(".send").text("发送验证码");
                                            clearInterval(timer);
                                        }
                                    },1000);
                            });
                            function sendEmail() {
                                $.post("<%=request.getContextPath()%>/sendmail",
                                    {
                                        action:"confirm"
                                    },
                                    function(data){
                                        console.log(data);
                                    });
                            }
                        });
                    </script>
                </div>

            </div>
        </c:if>


    </div>
</div>

</body>
</html>
