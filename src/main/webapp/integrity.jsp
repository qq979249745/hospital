<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2019/1/8
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的诚信度--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>

</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div class="row alert-success h3 "style="padding: 20px">你当前的诚信度为：<div class="h1">${patient.integrity}分</div></div></div>
        <c:if test="${requestScope.integrities != null}">
           <div class="container">
               <div class="row alert-info h4 "style="padding: 20px">诚信度记录</div>

               <table class="table table-hover">
                   <thead><tr><th>序号</th><th>医生</th><th>科室</th><th>时间</th><th>原因</th><th>分值</th></tr></thead>
                   <c:forEach var="item" items="${requestScope.integrities }" varStatus="statu">
                       <c:choose>
                           <c:when test="${item.score<=0}">    <!--如果 -->
                               <tr class="danger">
                           </c:when>
                           <c:otherwise>  <!--否则 -->
                               <tr class="success">
                           </c:otherwise>
                       </c:choose>

                       <th scope="row">${statu.index+1}</th>
                       <td>${item.dname}</td>
                       <td>${item.office}</td>
                       <td>${item.time}</td>
                       <td>${item.reason}</td>
                       <td>${item.score}</td>

                   </tr>
                   </c:forEach>
               </table>
           </div>
        </c:if>

    </div>
</div>

</body>
</html>
