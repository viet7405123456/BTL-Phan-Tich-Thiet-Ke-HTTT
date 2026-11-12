<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.DocumentBorrowStatisticsDAO8" %>
<%@ page import="model.DocumentBorrowStatistics8" %>
<%@ page import="java.util.List" %>
<%
    if (session.getAttribute("memberId") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // "SelectPeriodUI8" tu goi thang dao.DocumentBorrowStatisticsDAO8, dung mui ten
        // SelectPeriodUI8 --> DocumentBorrowStatisticsDAO8 trong so do lop thiet ke,
        // roi chuyen sang trang DocumentBorrowListUI8 (khong qua controller).
        String tuNgay = request.getParameter("tuNgay");
        String denNgay = request.getParameter("denNgay");

        List<DocumentBorrowStatistics8> danhSach =
                new DocumentBorrowStatisticsDAO8().getThongKeTaiLieuTheoLuotMuon(tuNgay, denNgay);

        request.setAttribute("danhSachThongKe", danhSach);
        request.setAttribute("tuNgay", tuNgay);
        request.setAttribute("denNgay", denNgay);

        request.getRequestDispatcher("DocumentBorrowListUI8.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Chọn khoảng thời gian thống kê</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; SelectPeriodUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Thống kê tài liệu theo lượt mượn</h2>
    <p class="subtitle">Chọn khoảng thời gian cần thống kê.</p>
    <form action="<%=request.getContextPath()%>/view/quanli/SelectPeriodUI8.jsp" method="post">
        <div class="form-group">
            <label>Từ ngày</label>
            <input type="date" name="tuNgay" value="2026-01-01" required>
        </div>
        <div class="form-group">
            <label>Đến ngày</label>
            <input type="date" name="denNgay" value="2026-12-31" required>
        </div>
        <button type="submit" class="btn">Xem thống kê</button>
        <a class="btn btn-secondary" href="<%=request.getContextPath()%>/view/quanli/SelectReportTypeUI8.jsp">Quay lại</a>
    </form>
</div>
</body>
</html>
