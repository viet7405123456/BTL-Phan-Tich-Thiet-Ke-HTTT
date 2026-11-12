<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("memberId") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
    // Hien tai he thong chi thiet ke 1 loai bao cao: "Thong ke tai lieu theo luot muon",
    // nen trang nay chua can goi DAO, chi chuyen tiep sang SelectPeriodUI8.
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Chọn loại báo cáo</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; SelectReportTypeUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Chọn loại báo cáo</h2>
    <form action="<%=request.getContextPath()%>/view/quanli/SelectPeriodUI8.jsp" method="get">
        <div class="form-group">
            <label>Loại thống kê</label>
            <select name="loaiThongKe">
                <option value="DOCUMENT_BORROW">Thống kê tài liệu theo lượt mượn</option>
            </select>
        </div>
        <button type="submit" class="btn">Tiếp tục</button>
        <a class="btn btn-secondary" href="<%=request.getContextPath()%>/view/quanli/ManagerHomeUI8.jsp">Quay lại</a>
    </form>
</div>
</body>
</html>
