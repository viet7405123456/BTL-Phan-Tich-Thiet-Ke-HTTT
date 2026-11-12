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
    <title>LibMan - Trang chủ nhân viên</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; StaffHomeUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Trang chủ nhân viên thủ thư</h2>
    <div class="alert alert-info">
        Gói <code>nhanvien</code> hiện mới có ở mức sơ đồ gói (package diagram), chưa được
        thiết kế chi tiết lớp giao diện/DAO như 2 module Đăng kí thẻ bạn đọc và Thống kê
        tài liệu, nên các chức năng dưới đây chỉ là chỗ để trống (placeholder).
    </div>
    <ul>
        <li class="placeholder-link">Nhập tài liệu (chưa triển khai)</li>
        <li class="placeholder-link">Lập phiếu mượn (chưa triển khai)</li>
        <li class="placeholder-link">Lập phiếu trả (chưa triển khai)</li>
    </ul>
</div>
</body>
</html>
