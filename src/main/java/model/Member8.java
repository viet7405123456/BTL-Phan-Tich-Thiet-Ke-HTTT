package model;

import java.util.Date;

/**
 * Lop thuc the truu tuong, tuong ung "Member 8" trong so do lop thuc the.
 */
public abstract class Member8 {
    protected int id;
    protected String tendangnhap;
    protected String matkhau;
    protected String hoten;
    protected Date ngaysinh;
    protected boolean gioitinh;
    protected String diachi;
    protected String email;
    protected String sodienthoai;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTendangnhap() { return tendangnhap; }
    public void setTendangnhap(String tendangnhap) { this.tendangnhap = tendangnhap; }

    public String getMatkhau() { return matkhau; }
    public void setMatkhau(String matkhau) { this.matkhau = matkhau; }

    public String getHoten() { return hoten; }
    public void setHoten(String hoten) { this.hoten = hoten; }

    public Date getNgaysinh() { return ngaysinh; }
    public void setNgaysinh(Date ngaysinh) { this.ngaysinh = ngaysinh; }

    public boolean isGioitinh() { return gioitinh; }
    public void setGioitinh(boolean gioitinh) { this.gioitinh = gioitinh; }

    public String getDiachi() { return diachi; }
    public void setDiachi(String diachi) { this.diachi = diachi; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getSodienthoai() { return sodienthoai; }
    public void setSodienthoai(String sodienthoai) { this.sodienthoai = sodienthoai; }
}
