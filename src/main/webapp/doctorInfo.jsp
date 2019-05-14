<%@ page import="bean.WorkDay" %>
<%@ page import="java.util.List" %>
<%@ page import="util.Util" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${doctor.dname}--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <c:if test="${sessionScope.message!=null}">
            <script>
                $(function () {
                    alert("${sessionScope.message}");
                })
            </script>
            ${sessionScope.remove("message")}
        </c:if>
        <div class="ysjs">

            <div class="title">
                <div class="t">
                    <span>${doctor.dname}</span>
                    <span class="gender">${doctor.gender}</span>
                    <span class="career">${doctor.career}</span>
                    <span class="career">${doctor.age}岁</span>
                </div>
                <div class="b">
                    <span>${doctor.office} （${doctor.room}）</span><span>出诊费：${doctor.fee}</span>
                </div>
                <img src="${doctor.picpath}">
            </div>
            <div class="content">
                <div >
                    <div>介绍：</div>
                    <div>${doctor.description}</div>
                </div>
            </div>
            <style>
                .ysjs{
                    margin: 20px;
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
                .ysjs .title .b span{
                    margin-left: 20px;
                    color: rgb(43,43,43);
                    font-size: 20px;
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
        <%--显示医生排班--%>
        <div class="container">
            <div class="row alert-info col-lg-8 h3">不能预约今天的号源</div>
        </div>

        <div class="schedule">
            <div class="week">
                <div class="ysjj1">
                    <div style="width: 30%;">
                        <div class="ysjj">
                            <div class="title1">医生介绍</div>
                            <img src="${doctor.picpath}">
                            <div class="title">
                                <div><span class="name">${doctor.dname}</span><span class="career">${doctor.career}</span><span class="gender">${doctor.gender}</span></div>
                                <p>介绍：${doctor.description}</p>
                            </div>
                            <div class="work">
                                <div>上午</div>
                                <div>下午</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="title2">
                    <%
                        List<WorkDay> workDays= (List<WorkDay>) request.getAttribute("workDays");
                        StringBuilder sb=new StringBuilder();
                        for(int i=0;i<7;i++){
                            sb.append("<ul><li class='date'>");
                            sb.append(Util.getWeek(Integer.parseInt(workDays.get(i*2).getWorktime())));
                            sb.append("<br>");
                            sb.append(Util.getDate(Integer.parseInt(workDays.get(i*2).getWorktime())));
                            sb.append("</li>");
                            for(int j=0;j<2;j++){
                                sb.append("<li class='");
                                sb.append(workDays.get(i*2+j).getState());
                                if("预约".equals(workDays.get(i*2+j).getState())&&!"今天".equals(Util.getWeek(Integer.parseInt(workDays.get(i*2).getWorktime())))){
                                    sb.append("'><a style='    height: 100%; display: block;' data-toggle=\"modal\" data-target=\"#myModal\" data-wid='");
                                }else {
                                    sb.append("'><a  data-wid='");
                                }
                                sb.append(workDays.get(i*2+j).getWid());
                                sb.append("' data-ampm='");
                                sb.append(workDays.get(i*2+j).getAmpm());
                                sb.append("' data-date='");
                                sb.append(Util.getDate(Integer.parseInt(workDays.get(i*2).getWorktime())));
                                sb.append("'><br>");
                                sb.append(workDays.get(i*2+j).getState());
                                sb.append("<br>号源数");
                                sb.append(workDays.get(i*2+j).getNsnum());
                                sb.append("</a></li>");
                            }
                            sb.append("</ul>");
                        }
                        out.write(sb.toString());
                    %>
                </div>
            </div>
            <style>
                .schedule{
                    text-align: center;
                    width: 80%;
                    border: 1px #0065AF solid;
                }
                .schedule:after{
                    content:"";
                    clear: both;
                    display: block;
                }
                .schedule .week {
                    float: left;
                    height: 250px;
                    width: 100%;
                }
                .schedule .week .title1{
                    font-size: 20px;
                }
                .schedule .week .title2{
                    width: 70%;
                }
                .schedule .week:after{
                    content: '';
                    clear: both;
                    display: block;
                }
                .ysjj{
                    width: 100%;
                    float: left;
                }
                .ysjj img{
                    width: 30%;
                    float: left;
                }
                .ysjj .title{
                    float: left;
                    width: 50%;
                    overflow: hidden;
                }
                .ysjj .title span{
                    float: left;
                    margin: 10px;
                }
                .ysjj .title .name{
                    font-size: 20px;
                }
                .ysjj .title .career{
                    font-size: 17px;
                }
                .ysjj .title .gender{
                    font-size: 15px;
                }
                .ysjj .title div:after{
                    content: '';
                    clear: both;
                    display: block;
                }
                .ysjj .title p{
                    height: 130px;
                    width: 110%;
                    overflow-y: scroll;
                }
                .ysjj .work{
                    float: left;
                    width: 20%;
                }
                .ysjj .work div{
                    width: 100%;
                    height: 100px;
                    line-height: 100px;
                    text-align: center;
                }
                .schedule .week .title2{
                    float: left;
                    height: 100%;
                }
                .schedule .week .title2 ul{
                    float: left;
                    height: 100%;
                    width: 14.26%;
                }
                .schedule .week .title2 ul li{
                    list-style: none;
                    background-color: #eeeeee;
                    height: 40%;
                    border-left: #0065AF 1px solid;
                }
                .schedule .week .title2 ul li:nth-of-type(even){
                    background: rgb(250, 250, 250);
                }
                .schedule .week .title2 .date{
                    height: 20%;
                }
                .schedule .week .title2 .预约{
                    background: rgb(219, 255, 211)!important;
                    color: rgb(61, 175, 167);
                    cursor: pointer;
                }
                .schedule .week .title2 .预约:hover{
                    color: rgb(255, 255, 255);
                    background: rgb(61, 175, 167)!important;
                }
                .schedule .week .title2 .停诊{
                    background: rgb(208, 222, 251)!important;
                    color: rgb(20, 82, 205)!important;
                }

                .schedule .week ul:after{
                    content: '';
                    clear: both;
                    display: block;
                }

                .work1{
                    width: 70%;
                    float: left;
                }
                .work1 ul li{
                    float: left;
                    list-style: none;
                    width: 12.303%;
                    height: 100px;
                    line-height: 100px;
                    text-align: center;
                    border: 1px dashed rgb(219, 219, 219);
                }
                .work1 ul li:nth-of-type(odd){
                    background: rgb(250, 250, 250);
                }
                .work1 ul .预约{
                    background: rgb(219, 255, 211)!important;
                    color: rgb(61, 175, 167);
                    cursor: pointer;
                }
                .work1 ul .预约:hover{
                    color: rgb(255, 255, 255);
                    background: rgb(61, 175, 167)!important;
                }
                .work1 ul .停诊{
                    background: rgb(208, 222, 251)!important;
                    color: rgb(20, 82, 205)!important;
                }
            </style>
            <%--修改排班--%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" style="margin-top: 200px;" role="document">
                    <div class="modal-content" style="width: 900px;left: -80px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">预约号源</h4>
                        </div>
                        <form class="form-horizontal" action='order' method='post'>
                            <input id="action" hidden value="order" name="action">
                            <input id="wid" hidden  name="wid">
                            <input  hidden  name="did" value="${doctor.did}">
                            <div class="modal-body">
                                <%--显示预约的号源信息--%>
                                <div class="haoyuan">
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button id="doalert" type="submit" class="btn btn-primary order">确定</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $('#myModal').on('show.bs.modal', function (event) {
                        var  a=$(event.relatedTarget);
                        var wid =a .data('wid');
                        var ampm =a .data('ampm');
                        var date =a .data('date');
                        $("#wid").val(wid);
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
                        $('#doalert').click(function () {
                            if($("input[type=radio]:checked").length==1){
                                $("form").submit();
                            }else {$('#myModal').modal('hide')}
                        })
                    });
                })
            </script>
        </div>

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

</body>
</html>
