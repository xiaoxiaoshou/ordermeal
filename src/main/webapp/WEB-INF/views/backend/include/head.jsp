<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/25
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*pageContext.setAttribute("APP_PATH", request.getContextPath());*/
    request.setAttribute("APP_PATH",request.getContextPath());
    /*以斜线开始，不以斜线结束*/

   String realPath =  request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
   request.setAttribute("REAL_PATH",realPath);
%>

