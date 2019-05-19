<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--上面导航栏-->
<nav class="navbar1"
     role="navigation">
    <div class="container1">
        <div style="position: absolute; left: 40px; top: 6px;"></div>
        <div style="position: absolute; left: 150px; top: -2px;">
            <a class="navbar-brand1" href=""><font color="#fff">在线预约挂号系统</font></a>
        </div>
        <div class="navbar-collapse1" id="top-navbar-1">
            <ul class="navbar-right1">
                <li>
                    <div>
                        <c:if test="${sessionScope.doctor == null}">
                            <jsp:forward page="../login.jsp"/>
                        </c:if>
                        <c:if test="${sessionScope.doctor != null}">
                            <a class="navbar-brand1" style="font-size: 12px;" href=""><strong><font color="#fff">欢迎您,${sessionScope.doctor.dname }</font></strong></a>
                            <a class="navbar-brand1" style="font-size: 12px;"
                               href="<%=request.getContextPath()%>/logout"><strong>注销</strong></a>
                        </c:if>
                            <a class="navbar-brand1" style="font-size: 12px;" href=""><strong>帮助中心</strong></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

