<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    if (session.getAttribute("memberId") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Chi tiết phiếu mượn</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; BorrowSlipDetailUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Chi tiết phiếu mượn</h2>

    <c:if test="${empty phieuMuon}">
        <div class="alert alert-warning">Không tìm thấy phiếu mượn.</div>
    </c:if>

    <table>
        <tr><th>Mã phiếu mượn</th><td>${phieuMuon.maphieumuon}</td></tr>
        <tr><th>Ngày mượn</th><td><fmt:formatDate value="${phieuMuon.ngaymuon}" pattern="dd/MM/yyyy"/></td></tr>
        <tr><th>Ngày hẹn trả</th><td><fmt:formatDate value="${phieuMuon.ngayhentra}" pattern="dd/MM/yyyy"/></td></tr>
        <tr><th>Trạng thái</th><td>${phieuMuon.trangthai}</td></tr>
        <tr><th>Bạn đọc</th><td>${phieuMuon.banDoc.hoten} (${phieuMuon.banDoc.mabandoc})</td></tr>
        <tr><th>Nhân viên lập phiếu</th><td>${phieuMuon.nhanVien.hoten}</td></tr>
    </table>

    <br>
    <a class="btn btn-secondary" href="<%=request.getContextPath()%>/view/quanli/SelectPeriodUI8.jsp">Quay lại tra cứu</a>
</div>
</body>
</html>
