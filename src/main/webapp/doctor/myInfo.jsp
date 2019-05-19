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
            <div class="h3 alert-info info">我的信息</div>
            <div class="row">
            <div class="ysjs ">
                <div class="title">
                    <div class="t">
                        <span><a href="showWeek?wid=${doctor.did}">${doctor.dname}</a></span>
                        <span class="gender">${doctor.gender}</span>
                        <span class="career">${doctor.career}</span>
                        <span class="career">${doctor.age}岁</span>
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
                    .ysjs:after{
                        content: "";
                        clear: both;
                        display: block;
                    }
                    .ysjs{
                        float: left;
                        margin: 20px auto;
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
            </div>
            <div class="row"> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">更新我的信息</button></div>
        </div>
        <%--修改预约和取消--%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" style="margin-top: 200px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                    </div>
                    <form enctype="multipart/form-data" autocomplete="off" action='myInfo' method='post'>
                        <div class="modal-body">

                                <input id="action" hidden value="alter" name="action">
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input value="${doctor.dname}" name="name"  class="form-control" id="name" placeholder="姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="age" class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-10">
                                    <input value="${doctor.age}" type="number" name="age" class="form-control" id="age" placeholder="年龄">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="age" class="col-sm-2 control-label">描述</label>
                                <div class="col-sm-10">
                                    <textarea  id="description" name="description" class="form-control" rows="3">${doctor.description}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile">照片</label>
                                <input name="pic" type="file" id="exampleInputFile">
                                <p class="help-block">选择你的照片</p>
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
