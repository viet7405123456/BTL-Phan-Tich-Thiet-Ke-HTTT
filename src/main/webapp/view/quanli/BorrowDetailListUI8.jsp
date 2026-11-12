<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="dao.BorrowSlipDAO8" %>
<%@ page import="model.BorrowSlip8" %>
<%
    if (session.getAttribute("memberId") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    if (request.getParameter("idBorrowSlip") != null) {
        // "BorrowDetailListUI8" tu goi thang dao.BorrowSlipDAO8, dung mui ten
        // BorrowDetailListUI8 --> BorrowSlipDAO8 trong so do lop thiet ke,
        // roi chuyen sang trang BorrowSlipDetailUI8 (khong qua controller).
        int idBorrowSlip = Integer.parseInt(request.getParameter("idBorrowSlip"));
        BorrowSlip8 phieuMuon = new BorrowSlipDAO8().getChiTietPhieuMuon(idBorrowSlip);
        request.setAttribute("phieuMuon", phieuMuon);
        request.getRequestDispatcher("BorrowSlipDetailUI8.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Chi tiết các lượt mượn</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; BorrowDetailListUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Chi tiết các lượt mượn của tài liệu "${tenTaiLieu}"</h2>

    <c:choose>
        <c:when test="${empty danhSachLuotMuon}">
            <div class="alert alert-info">Không có lượt mượn nào.</div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>TT</th>
                    <th>Mã phiếu mượn</th>
                    <th>Mã bản sao</th>
                    <th>Ngày mượn</th>
                    <th>Ngày hẹn trả</th>
                    <th>Trạng thái</th>
                    <th>Chi tiết</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="lm" items="${danhSachLuotMuon}" varStatus="st">
                    <tr>
                        <td>${st.index + 1}</td>
                        <td>${lm.borrowSlip.maphieumuon}</td>
                        <td>${lm.documentCopy.mabansao}</td>
                        <td><fmt:formatDate value="${lm.borrowSlip.ngaymuon}" pattern="dd/MM/yyyy"/></td>
                        <td><fmt:formatDate value="${lm.borrowSlip.ngayhentra}" pattern="dd/MM/yyyy"/></td>
                        <td>${lm.borrowSlip.trangthai}</td>
                        <td>
                            <c:url var="chiTietUrl" value="/view/quanli/BorrowDetailListUI8.jsp">
                                <c:param name="idBorrowSlip" value="${lm.borrowSlip.id}"/>
                            </c:url>
                            <a href="${chiTietUrl}">Chi tiết phiếu</a>
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
