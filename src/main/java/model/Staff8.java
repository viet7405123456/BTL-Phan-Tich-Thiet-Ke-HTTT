package model;

/**
 * "Staff 8" - lop truu tuong, ke thua Member8.
 */
public abstract class Staff8 extends Member8 {
    protected String manhanvien;
    protected String chucvu;

    public String getManhanvien() { return manhanvien; }
    public void setManhanvien(String manhanvien) { this.manhanvien = manhanvien; }

    public String getChucvu() { return chucvu; }
    public void setChucvu(String chucvu) { this.chucvu = chucvu; }
}
