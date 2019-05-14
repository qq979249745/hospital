<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--右边菜单栏-->
<div id="wrapper" class="toggled1 ">

    <div id="sidebar-wrapper1">
        <ul class="sidebar-nav1">
            <li class="sidebar-brand1"><a href="#"> </a></li>
            <br />
            <br />
            <br />
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/admin/index.jsp"><font color="#fff">基本信息</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/admin/doctorManage"><font color="#fff">医生信息管理</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/admin/patientManage"><font color="#fff">患者信息管理</font></a></li>
            <!-- <li><a class="list-group-item1" href="/ssm_pro/orderIndex"><font color="#fff">快速预约</font></a></li> -->
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/admin/office"><font color="#fff">科室信息管理</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/admin/applyManage"><font color="#fff">排班申请管理</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/admin/modifyPwd.jsp"><font color="#fff">修改个人密码</font></a></li>
            <li><a class="list-group-item1" href="<%=request.getContextPath()%>/logout"><font color="#fff">安全退出</font></a></li>
        </ul>
    </div>
</div>
