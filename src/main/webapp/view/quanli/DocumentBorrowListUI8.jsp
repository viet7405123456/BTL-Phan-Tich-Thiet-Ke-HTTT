<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.BorrowDetailDAO8" %>
<%@ page import="model.BorrowDetail8" %>
<%@ page import="java.util.List" %>
<%
    if (session.getAttribute("memberId") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    if (request.getParameter("idDocument") != null) {
        // "DocumentBorrowListUI8" tu goi thang dao.BorrowDetailDAO8, dung mui ten
        // DocumentBorrowListUI8 --> BorrowDetailDAO8 trong so do lop thiet ke,
        // roi chuyen sang trang BorrowDetailListUI8 (khong qua controller).
        int idDocument = Integer.parseInt(request.getParameter("idDocument"));
        // Lay lai tuNgay/denNgay tu DocumentBorrowStatistics8.khoangthoigianTK (duoc
        // dinh kem san vao link "Chi tiet" cua tung dong ket qua), khong doc tu session.
        String khoangThoiGianTK = request.getParameter("khoangThoiGianTK");
        String[] ngay = khoangThoiGianTK.split(" - ");
        String tuNgay = ngay[0];
        String denNgay = ngay[1];

        List<BorrowDetail8> danhSachLuotMuon =
                new BorrowDetailDAO8().getChiTietLuotMuonCuaTaiLieu(idDocument, tuNgay, denNgay);

        request.setAttribute("danhSachLuotMuon", danhSachLuotMuon);
        request.setAttribute("tenTaiLieu", request.getParameter("tenTaiLieu"));
        request.getRequestDispatcher("BorrowDetailListUI8.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Danh sách tài liệu theo lượt mượn</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; DocumentBorrowListUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Danh sách tài liệu theo lượt mượn</h2>
    <p class="subtitle">Khoảng thời gian: ${tuNgay} &ndash; ${denNgay}</p>

    <c:choose>
        <c:when test="${empty danhSachThongKe}">
            <div class="alert alert-info">Không có tài liệu nào được mượn trong khoảng thời gian này.</div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>TT</th>
                    <th>Mã tài liệu</th>
                    <th>Tên tài liệu</th>
                    <th>Số lượt mượn</th>
                    <th>Chi tiết</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tl" items="${danhSachThongKe}" varStatus="st">
                    <tr>
                        <td>${st.index + 1}</td>
                        <td>${tl.matailieu}</td>
                        <td>${tl.tentailieu}</td>
                        <td>${tl.soluotmuon}</td>
                        <td>
                            <c:url var="chiTietUrl" value="/view/quanli/DocumentBorrowListUI8.jsp">
                                <c:param name="idDocument" value="${tl.id}"/>
                                <c:param name="tenTaiLieu" value="${tl.tentailieu}"/>
                                <c:param name="khoangThoiGianTK" value="${tl.khoangthoigianTK}"/>
                            </c:url>
                            <a href="${chiTietUrl}">Chi tiết</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <br>
    <a class="btn btn-secondary" href="<%=request.getContextPath()%>/view/quanli/SelectPeriodUI8.jsp">Quay lại</a>
</div>
</body>
</html>
