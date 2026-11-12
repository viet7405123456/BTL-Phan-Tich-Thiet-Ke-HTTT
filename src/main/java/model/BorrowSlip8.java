package model;

import java.util.Date;

public class BorrowSlip8 {
    private int id;
    private String maphieumuon;
    private Date ngaymuon;
    private Date ngayhentra;
    private String trangthai;
    private Reader8 banDoc;
    private LibraryStaff8 nhanVien;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getMaphieumuon() { return maphieumuon; }
    public void setMaphieumuon(String maphieumuon) { this.maphieumuon = maphieumuon; }
    public Date getNgaymuon() { return ngaymuon; }
    public void setNgaymuon(Date ngaymuon) { this.ngaymuon = ngaymuon; }
    public Date getNgayhentra() { return ngayhentra; }
    public void setNgayhentra(Date ngayhentra) { this.ngayhentra = ngayhentra; }
    public String getTrangthai() { return trangthai; }
    public void setTrangthai(String trangthai) { this.trangthai = trangthai; }
    public Reader8 getBanDoc() { return banDoc; }
    public void setBanDoc(Reader8 banDoc) { this.banDoc = banDoc; }
    public LibraryStaff8 getNhanVien() { return nhanVien; }
    public void setNhanVien(LibraryStaff8 nhanVien) { this.nhanVien = nhanVien; }
}
