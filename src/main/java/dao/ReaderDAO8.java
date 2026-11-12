package dao;

import model.Reader8;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

/**
 * "ReaderDAO8" - tuong ung so do lop thiet ke Module Dang ki lam the ban doc.
 */
public class ReaderDAO8 extends DAO8 {

    public ReaderDAO8() {
        super();
    }

    /**
     * Dang ki the ban doc moi (hoac cap lai/gia han the) cho mot Member da ton tai
     * (idMember), voi thong tin da duoc dong goi san trong doi tuong Reader8 (r).
     * Vi Reader8 ke thua Member8 (tblReader8 ke thua tblMember8 trong CSDL),
     * can cap nhat ca 2 bang: thong tin ca nhan (tblMember8) va thong tin the (tblReader8).
     * Nghiep vu khong con kiem tra the hieu luc truoc khi dang ki, nen ban doc da co
     * the van co the dang ki lai (duoc hieu la cap lai/gia han the) - dung UPSERT de
     * khong bi loi trung khoa chinh.
     */
    public boolean dangKyThe(int idMember, Reader8 r) {
        String updateMemberSql = "UPDATE tblMember8 SET hoten = ?, ngaysinh = ?, diachi = ?, email = ?, sodienthoai = ? WHERE id = ?";
        String upsertReaderSql = "INSERT INTO tblReader8 (id, mabandoc, loaibandoc, mathe, ngaycapthe, ngayhethanthe, trangthaithe) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?) "
                + "ON DUPLICATE KEY UPDATE mabandoc = VALUES(mabandoc), loaibandoc = VALUES(loaibandoc), "
                + "mathe = VALUES(mathe), ngaycapthe = VALUES(ngaycapthe), ngayhethanthe = VALUES(ngayhethanthe), "
                + "trangthaithe = VALUES(trangthaithe)";
        try {
            con.setAutoCommit(false);
            try (PreparedStatement ps1 = con.prepareStatement(updateMemberSql)) {
                ps1.setString(1, r.getHoten());
                ps1.setDate(2, r.getNgaysinh() == null ? null : new Date(r.getNgaysinh().getTime()));
                ps1.setString(3, r.getDiachi());
                ps1.setString(4, r.getEmail());
                ps1.setString(5, r.getSodienthoai());
                ps1.setInt(6, idMember);
                ps1.executeUpdate();
            }
            try (PreparedStatement ps2 = con.prepareStatement(upsertReaderSql)) {
                ps2.setInt(1, idMember);
                ps2.setString(2, r.getMabandoc());
                ps2.setString(3, r.getLoaibandoc());
                ps2.setString(4, r.getMathe());
                ps2.setDate(5, new Date(r.getNgaycapthe().getTime()));
                ps2.setDate(6, new Date(r.getNgayhethanthe().getTime()));
                ps2.setString(7, r.getTrangthaithe());
                ps2.executeUpdate();
            }
            con.commit();
            return true;
        } catch (SQLException e) {
            try { con.rollback(); } catch (SQLException ignored) {}
            throw new RuntimeException("Loi dangKyThe", e);
        } finally {
            try { con.setAutoCommit(true); } catch (SQLException ignored) {}
        }
    }
}
