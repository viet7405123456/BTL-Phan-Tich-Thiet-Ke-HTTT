<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO8" %>
<%
    Integer memberId = (Integer) session.getAttribute("memberId");
    if (request.getParameter("memberId") != null) {
        memberId = Integer.parseInt(request.getParameter("memberId"));
        session.setAttribute("memberId", memberId);
        session.setAttribute("hoTen", new MemberDAO8().getHoTen(memberId));
    }
    if (memberId == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Trang chủ quản lí</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; ManagerHomeUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Trang chủ quản lí</h2>
    <a class="btn" href="<%=request.getContextPath()%>/view/quanli/SelectReportTypeUI8.jsp">Xem báo cáo</a>
</div>
</body>
</html>
