<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--右边菜单栏-->
<div id="wrapper" class="toggled1 ">

    <div id="sidebar-wrapper1">
        <ul class="sidebar-nav1">
            <li class="sidebar-brand1"><a href="#"> </a></li>
            <br />
            <br />
            <br />
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/index.jsp"><font color="#fff">首页</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/searchOffice"><font color="#fff">按科室挂号</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/searchDoctor?order=doctor"><font color="#fff">按医生挂号</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/orderList"><font color="#fff">我的预约</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/integrity"><font color="#fff">诚信度</font></a></li>
            <!-- <li><a class="list-group-item1" href="/ssm_pro/orderIndex"><font color="#fff">快速预约</font></a></li> -->
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/modifyPwd.jsp"><font color="#fff">修改密码</font></a></li>
        </ul>
    </div>
</div>
