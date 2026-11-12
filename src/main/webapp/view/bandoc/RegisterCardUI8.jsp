<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ReaderDAO8" %>
<%@ page import="model.Reader8" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    // "RegisterCardUI8" tu dong goi doi tuong Reader8 roi goi thang
    // dao.ReaderDAO8.dangKyThe(), dung mui ten RegisterCardUI8 --> ReaderDAO8
    // trong so do lop thiet ke, khong qua controller.
    Integer memberId = (Integer) session.getAttribute("memberId");
    if (memberId == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    Boolean thanhCong = null;
    Reader8 the = null;
    String ngayCapStr = null;
    String ngayHetHanStr = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Tomcat mac dinh giai ma POST body bang ISO-8859-1, phai set truoc
        // khi goi getParameter() lan dau thi tieng Viet moi khong bi loi.
        request.setCharacterEncoding("UTF-8");
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String diaChi = request.getParameter("diaChi");
        String email = request.getParameter("email");
        String soDienThoai = request.getParameter("soDienThoai");
        String loaiBanDoc = request.getParameter("loaiBanDoc");
        int thoiHanNam = Integer.parseInt(request.getParameter("thoiHanThe"));

        // --- RegisterCardUI8 goi lop Reader8 yeu cau dong goi thong tin ---
        the = new Reader8();
        the.setHoten(hoTen);
        the.setNgaysinh(java.sql.Date.valueOf(ngaySinh));
        the.setDiachi(diaChi);
        the.setEmail(email);
        the.setSodienthoai(soDienThoai);
        the.setLoaibandoc(loaiBanDoc);
        the.setMabandoc(String.format("BD%04d", memberId));
        the.setMathe(String.format("THE%04d", memberId));
        LocalDate today = LocalDate.now();
        the.setNgaycapthe(java.sql.Date.valueOf(today));
        the.setNgayhethanthe(java.sql.Date.valueOf(today.plusYears(thoiHanNam)));
        the.setTrangthaithe("Hiệu lực");

        thanhCong = new ReaderDAO8().dangKyThe(memberId, the);

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        ngayCapStr = today.format(fmt);
        ngayHetHanStr = today.plusYears(thoiHanNam).format(fmt);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibMan - Đăng kí làm thẻ bạn đọc</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="navbar">
    <span class="brand">LibMan &middot; RegisterCardUI8</span>
    <span class="user-info">
        Xin chào, <b><%= session.getAttribute("hoTen") %></b>
        <a class="logout" href="<%=request.getContextPath()%>/logout.jsp">Đăng xuất</a>
    </span>
</div>

<div class="container">
    <h2>Đăng kí làm thẻ bạn đọc</h2>

    <form action="<%=request.getContextPath()%>/view/bandoc/RegisterCardUI8.jsp" method="post">
        <div class="form-group">
            <label>Họ tên</label>
            <input type="text" name="hoTen" value="<%= the != null ? the.getHoten() : "" %>" required>
        </div>
        <div class="form-group">
            <label>Ngày sinh</label>
            <input type="date" name="ngaySinh" required>
        </div>
        <div class="form-group">
            <label>Địa chỉ</label>
            <input type="text" name="diaChi" value="<%= the != null ? the.getDiachi() : "" %>" required>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="<%= the != null ? the.getEmail() : "" %>" required>
        </div>
        <div class="form-group">
            <label>Số điện thoại</label>
            <input type="text" name="soDienThoai" value="<%= the != null ? the.getSodienthoai() : "" %>" required>
        </div>
        <div class="form-group">
            <label>Loại bạn đọc</label>
            <select name="loaiBanDoc">
                <option value="Sinh viên">Sinh viên</option>
                <option value="Giảng viên">Giảng viên</option>
                <option value="Người ngoài trường">Người ngoài trường</option>
            </select>
        </div>
        <div class="form-group">
            <label>Thời hạn thẻ</label>
            <select name="thoiHanThe">
                <option value="1">1 năm</option>
                <option value="2">2 năm</option>
                <option value="4">4 năm</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Thêm</button>
        <a class="btn btn-secondary" href="<%=request.getContextPath()%>/view/bandoc/ReaderHomeUI8.jsp">Hủy</a>
    </form>
        <br>
        <br>
    <% if (thanhCong != null) {
        if (thanhCong) { %>
        <div class="alert alert-success">Đăng kí thẻ bạn đọc thành công!</div>
        <table>
            <tr><th>Mã bạn đọc</th><td><%= the.getMabandoc() %></td></tr>
            <tr><th>Mã thẻ</th><td><%= the.getMathe() %></td></tr>
            <tr><th>Họ tên</th><td><%= the.getHoten() %></td></tr>
            <tr><th>Loại bạn đọc</th><td><%= the.getLoaibandoc() %></td></tr>
            <tr><th>Ngày cấp thẻ</th><td><%= ngayCapStr %></td></tr>
            <tr><th>Ngày hết hạn</th><td><%= ngayHetHanStr %></td></tr>
            <tr><th>Trạng thái</th><td><%= the.getTrangthaithe() %></td></tr>
        </table>
        <br>
        <a class="btn" href="<%=request.getContextPath()%>/view/bandoc/ReaderHomeUI8.jsp">Về trang chủ</a>
    <%  } else { %>
        <div class="alert alert-warning">Đăng kí thất bại, vui lòng thử lại.</div>
    <%  } %>
    <% } %>
</div>
</body>
</html>
