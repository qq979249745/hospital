<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线预约挂号系统（管理员)</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>
<script src="<%=request.getContextPath()%>/scripts/echarts.min.js"></script>
<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div ><button class="btn btn-success">打印</button></div>
        <div id="main1" style="width: 600px;height: 400px;float: left"></div>
        <div id="main2" style="width: 600px;height: 400px;float: left"></div>
        <div id="main3" style="width: 600px;height: 400px;float: left"></div>

            <script type="text/javascript">
                $(".btn").bind('click',function () {
                    console.log("打印");
                    var newstr = document.getElementById("page-inner").innerHTML;//得到需要打印的元素HTML
                    var imgDom = $(newstr);
                    $('#wrapper').hide();//将左边的菜单隐藏
                    $('.navbar1').hide();//上边的导航栏隐藏
                    $('body').append(imgDom);
                    window.print();
                    imgDom.remove();
                    $('#wrapper').show();
                    $('.navbar1').show();
                });
            $.post("<%=request.getContextPath()%>/count",{action:"1"},
                function(data){
                    console.log(data);
                    var myChart1 = echarts.init(document.getElementById("main1"));
                    option = {
                        color: ['#3398DB'],
                        tooltip : {trigger: 'axis', axisPointer : {type : 'shadow'}},
                        grid: {left: '3%', right: '4%', bottom: '3%', containLabel: true},
                        xAxis : [{type : 'category', data : ['科室', '诊室', '医生', '患者'], axisTick: {alignWithLabel: true}}],
                        yAxis : [{type : 'value'}],
                        series : [{name:'数量', type:'bar', barWidth: '60%', data:data}]
                    };
                    myChart1.setOption(option);
                });
            $.post("<%=request.getContextPath()%>/count",{action:"2"},
                function(data){
                    console.log(data);
                    var myChart1 = echarts.init(document.getElementById("main2"));
                    //  app.title = '坐标轴刻度与标签对齐';
                    option = {
                        color: ['#40bfdb'],
                        tooltip : {
                            trigger: 'axis',
                            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis : [
                            {
                                type : 'category',
                                data : data.data,
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        series : [
                            {
                                name:'预约量',
                                type:'bar',
                                barWidth: '60%',
                                data:data.data1
                            }
                        ]
                    };
                    myChart1.setOption(option);
                });
            $.post("<%=request.getContextPath()%>/count",{action:"3"},
                function(data){
                    console.log(data);
                    var myChart1 = echarts.init(document.getElementById("main3"));
                    //  app.title = '坐标轴刻度与标签对齐';
                    option = {
                        color: ['#7049db'],
                        tooltip : {
                            trigger: 'axis',
                            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis : [
                            {
                                type : 'category',
                                data : ['星期天','星期一','星期二','星期三','星期四','星期五','星期六'],
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        series : [
                            {
                                name:'预约量',
                                type:'bar',
                                barWidth: '60%',
                                data:data
                            }
                        ]
                    };
                    myChart1.setOption(option);
                });
        </script>
    </div>
</div>

</body>
</html>
