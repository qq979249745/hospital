<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线预约挂号系统（管理员)</title>
    <jsp:include page="include/headtag.jsp"/>
    <style>
        .ysjs{
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
            overflow: hidden;
        }
        .ysjs .content div{
            padding-top: 10px;
            width: 101%;
        }.ysjs .content .description{
            height: 50px;
            overflow-y: scroll;
        }
    </style>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <p>科室：
            <select wid="offices" name="office"></select>
            <script>
                $.get("<%=request.getContextPath()%>/office?action=query",function(data,status){
                    var options="";
                    for(var i=0;i<data.length;i++){
                        options+="<option>"+data[i].officename+"</option>";
                    }
                    ($(options)).appendTo($("#offices"));
                });
            </script>
        </p>
<div wid="doctors" style="display: flex;flex-wrap: wrap;"></div>
        <script>
            function post(select,pages){
                $.post("<%=request.getContextPath()%>/querydoctor",
                    {
                        column:"office",
                        where:select,
                        pages:pages
                    },
                    function(data){
                        console.log(data);
                        var options="";
                        for(var i=0;i<data.length;i++){
                            options+="<div class=\"ysjs\">" +
                                "<div class=\"title\">" +
                                "<div class=\"t\">" +
                                "<span>"+data[i].name+"</span><span class=\"gender\">"+data[i].gender+"</span><span class=\"career\">"+data[i].career+"</span><span class=\"career\">"+data[i].age+"岁</span>" +
                                "</div>" +
                                " <div class=\"b\">" +
                                " <span>"+data[i].office+" （"+data[i].room+"）</span>" +
                                " </div>" +
                                " <img src=\"../images/docpic/default.jpg\">" +
                                " </div>" +
                                "<div class=\"content\">" +
                                "<div >" +
                                "<div>介绍：</div>" +
                                " <div class='description'>"+data[i].description+"</div>" +
                                " </div></div></div>"
                        }
                        $("#doctors").empty();
                        ($(options)).appendTo($("#doctors"));
                    });
            }
            $(function () {
                $("#offices").change(function (e) {
                    post($("#offices").val(),0);
                });
                setTimeout(function(){post($("#offices option:first").val(),0);},800);
            });

        </script>


    </div>
</div>

</body>
</html>
