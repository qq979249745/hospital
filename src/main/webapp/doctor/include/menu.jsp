<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--右边菜单栏-->
<div id="wrapper" class="toggled1 ">

    <div id="sidebar-wrapper1">
        <ul class="sidebar-nav1">
            <li class="sidebar-brand1"><a href="#"> </a></li>
            <br />
            <br />
            <br />
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/doctor/myWork"><font color="#fff">排班信息</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/doctor/myApply"><font color="#fff">我的申请</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/doctor/patientList"><font color="#fff">患者队列</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/doctor/myInfo"><font color="#fff">我的信息</font></a></li>
            <!-- <li><a class="list-group-item1" href="/ssm_pro/orderIndex"><font color="#fff">快速预约</font></a></li> -->
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/doctor/modifyPwd.jsp"><font color="#fff">修改密码</font></a></li>
        </ul>
    </div>
</div>
