package model;

import java.util.Date;

/**
 * "Reader 8" - ke thua Member8.
 */
public class Reader8 extends Member8 {
    private String mabandoc;
    private String loaibandoc;
    private String mathe;
    private Date ngaycapthe;
    private Date ngayhethanthe;
    private String trangthaithe;

    public String getMabandoc() { return mabandoc; }
    public void setMabandoc(String mabandoc) { this.mabandoc = mabandoc; }

    public String getLoaibandoc() { return loaibandoc; }
    public void setLoaibandoc(String loaibandoc) { this.loaibandoc = loaibandoc; }

    public String getMathe() { return mathe; }
    public void setMathe(String mathe) { this.mathe = mathe; }

    public Date getNgaycapthe() { return ngaycapthe; }
    public void setNgaycapthe(Date ngaycapthe) { this.ngaycapthe = ngaycapthe; }

    public Date getNgayhethanthe() { return ngayhethanthe; }
    public void setNgayhethanthe(Date ngayhethanthe) { this.ngayhethanthe = ngayhethanthe; }

    public String getTrangthaithe() { return trangthaithe; }
    public void setTrangthaithe(String trangthaithe) { this.trangthaithe = trangthaithe; }
}
