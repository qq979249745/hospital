<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 65px;margin-left: 300px">
    <div id="page-inner">
        <div class="container">
        <div id="myCarousel" class="carousel slide" style="height: 300px; width: 1000px; " align="center">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" style="width: 950px;height: 300px; ">
                <div class="item active">
                    <img src="images/img_0.jpg" style=" height:300px;width: 950px;" alt="First slide"><br><br>
                    <div class="carousel-caption" style="color: #2e2e2e">仁爱&nbsp;仁心&nbsp;仁术</div>
                </div>
                <div class="item">
                    <img src="images/img_3.jpg" style=" height:300px; width: 950px;" alt="Second slide"><br><br>
                    <div class="carousel-caption" style="color: #2e2e2e">祝您早日康复</div>
                </div>
                <div class="item">
                    <img src="images/img_2.jpg" style="height:300px; width: 950px;"  alt="Third slide"><br><br>
                    <div class="carousel-caption" style="color: #2e2e2e">医院视图</div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <table border="1" width="1000px;" height="550px;" >
            <tbody>
            <tr>
                <td width="760px">
                    <table border="1" width="760px;" height="550px;"cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td width="760px;" height="150px;" align="center" valign="top">
                                <div style="font-size: 30px;font-family: 华文行楷">养生小知识</div><br>
                                <div>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生活要有规律的养生知识。有自制力的人，才能让自己过上较为规律的生活。
                                    而有这种品质的人，也更能为了健康控制自己的饮食、作息。
                                    这种健康规律的生活，有助于让身体保持在较为稳定的平衡状态，这对各器官组织的功能、免疫力都至关重要。
                                    要知道，随着我们年岁渐长，这种平衡越来越不容易保持，
                                    因此，能尽量让生活规律，就意味着你的免疫力可能更强，机体功能更正常。
                                    当然平时也要注意多运动哟！
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="760px;" height="400px;">
                                <table border="1" width="760px;" height="400px;"cellpadding="0" cellspacing="0">
                                    <tbody>
                                    <tr>
                                        <td width="500px;" align="center">
                                            <table border="0" width="500px;" height="400px;">
                                                <tbody>
                                                <tr>
                                                    <td valign="top">
                                                        <div align="center" style="margin-top: 5px;font-family: 华文楷体;font-weight: bolder;font-size: 22px;">
                                                            专业科室
                                                        </div>
                                                        <div align="center" style="font-family: 华文楷体;font-weight: bolder;font-size: 16px;">
                                                            内科、外科、儿科、妇科、眼科、耳鼻喉科、口腔科、呼吸内科<br>
                                                            皮肤科、中医科、针灸推拿科、心理咨询室、消化内科、心内科、<br>
                                                            感染科、普外科、骨科、神经外科、肝胆外科等。
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style=" height: 290px;background-image: url(images/bj11.jpg) ;background-size: 500px;" valign="left">
                                                        <table border="0" width="365px;" height="200px;" style="margin-top: 20px;">
                                                            <tbody>
                                                            <tr>
                                                                <td width="90px;"></td>
                                                                <td valign="top">
                                                                    <div align="center"   style="margin-top: 5px; font-size: 20px;">就诊指南</div>
                                                                    <div style="font-size: 14px;font-family: 华文楷体;font-weight: bolder">
                                                                        一、就诊时请主动出示医保卡（证）。<br>
                                                                        二、如不在本院取药，提前告知医生。<br>
                                                                        三、开具诊断证明和休假证明当日盖章有效。<br>
                                                                        四、持医保刷卡交费，如遇特殊情况退费必须在6日内办理。<br>
                                                                        五、复印住院病历携带患者和代理人身份证原件于出院后10个工作日（遇节假日顺延）到行政楼院内病案室办理。<br>
                                                                        六、医院为无烟医院，就诊期间禁止吸烟，不要随地吐痰、大声喧哗。
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </td>
                                        <td width="260px;" valign="top" >
                                            <div style="height: 50px; font-family: 华文隶书;font-size: 25px; font-weight: bolder" align="center" >最新公告</div>
                                            <div style="font-family: 华文宋体;font-size: 18px;font-weight: bolder"><a style="text-decoration-line: none">【挂号必看】&nbsp;&nbsp;2019过年期间各大医院门诊安排</a></div><br>
                                            <div style="font-family: 华文宋体;font-size: 18px;font-weight: bolder"><a style="text-decoration-line: none">【牛牛掰】&nbsp;&nbsp;打开“俩性”之门，揭开性的神秘面纱</a></div><br>
                                            <div style="font-family: 华文宋体;font-size: 18px;font-weight: bolder"><a style="text-decoration-line: none">【萌宝健康课】&nbsp;&nbsp;宝宝病了咋办？了解宝宝生长秘密</a></div><br>
                                            <div style="font-family: 华文宋体;font-size: 18px;font-weight: bolder"><a style="text-decoration-line: none">【就医导读】&nbsp;&nbsp;对不起，这些病我不会看！</a></div>
                                            <img src="images/timg.jpg" height="150px;" width="250px;">
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
                <td width="240px">
                    <table border="0" width="100%" height="550px;" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td height="46px;" align="center" colspan="3" style="font-size: 20px; color: #f4f4f4; background-color: #00E8D7">
                                热门科室
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td height="126px;" width="75px;" >
                                <img src="images/眼科.png" style="margin-left: 5px;">
                            </td>
                            <td width="10px;"></td>
                            <td style="" align="left" valign="top" >
                                <table border="0" width="100%" height="126px;" cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #0000FF">
                                            <a href="searchDoctor?office=眼科">眼科</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #000000">
                                            眼科中心门诊
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="" style="font-size: 17px;color: #595959">
                                            &nbsp;&nbsp;&nbsp;&nbsp;专业眼科，帮助您更好的恢复视力，有一双明亮的眼！
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="126px;">
                                <img src="images/中医科.png" style="margin-left: 5px;">
                            </td>
                            <td width="10px;"></td>
                            <td style="" align="left" valign="top" >
                                <table border="0" width="100%" height="126px;" cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #0000FF">
                                            <a href="searchDoctor?office=中医妇科">中医妇科</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #000000">
                                            中医妇科
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="" style="font-size: 17px;color: #595959">
                                            &nbsp;&nbsp;&nbsp;&nbsp;汇集全城妇科专家，帮您解决疑难杂症！
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="126px;">
                                <img src="images/口腔科.png" style="margin-left: 5px;">
                            </td>
                            <td width="10px;"></td>
                            <td style="" align="left" valign="top" >
                                <table border="0" width="100%" height="126px;" cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #0000FF">
                                            <a href="searchDoctor?office=中医妇科">口腔科</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #000000">
                                            口腔科
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="" style="font-size: 17px;color: #595959">
                                            &nbsp;&nbsp;&nbsp;&nbsp;种植中心、正畸中心、修复等是特色专科。
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="126px;">
                                <img src="images/不孕不育科.png" style="margin-left: 5px;">
                            </td>
                            <td width="10px;"></td>
                            <td style="" align="left" valign="top" >
                                <table border="0" width="100%" height="126px;" cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #0000FF">
                                            <a href="searchDoctor?office=中医妇科">不孕不育科</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="22px;" style="font-size: 15px;color: #000000">
                                            不孕不育科
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="" style="font-size: 17px;color: #595959">
                                            &nbsp;&nbsp;&nbsp;&nbsp;不孕不育作为医院的重点科室，率先引进世界高成功率技术！
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>
        </div>
    </div>
</div>

</body>
</html>
