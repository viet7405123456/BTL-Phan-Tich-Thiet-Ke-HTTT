package dao;

import model.BorrowSlip8;
import model.LibraryStaff8;
import model.Reader8;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * "BorrowSlipDAO8" - tuong ung so do lop thiet ke Module Thong ke tai lieu theo luot muon.
 */
public class BorrowSlipDAO8 extends DAO8 {

    public BorrowSlipDAO8() {
        super();
    }

    /**
     * Lay chi tiet 1 phieu muon (idBorrowSlip), kem thong tin ban doc va nhan vien lap phieu.
     */
    public BorrowSlip8 getChiTietPhieuMuon(int idBorrowSlip) {
        String sql =
            "SELECT bs.maphieumuon, bs.ngaymuon, bs.ngayhentra, bs.trangthai, " +
            "       r.id AS readerId, m1.hoten AS readerHoten, r.mabandoc, " +
            "       ls.id AS staffId, m2.hoten AS staffHoten " +
            "FROM tblBorrowSlip8 bs " +
            "JOIN tblReader8 r ON r.id = bs.tblReaderid " +
            "JOIN tblMember8 m1 ON m1.id = r.id " +
            "LEFT JOIN tblLibraryStaff8 ls ON ls.id = bs.tblLibraryStaffid " +
            "LEFT JOIN tblMember8 m2 ON m2.id = ls.id " +
            "WHERE bs.id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idBorrowSlip);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // --- dong goi thong tin ---
                    Reader8 reader = new Reader8();
                    reader.setId(rs.getInt("readerId"));
                    reader.setHoten(rs.getString("readerHoten"));
                    reader.setMabandoc(rs.getString("mabandoc"));

                    LibraryStaff8 staff = new LibraryStaff8();
                    staff.setId(rs.getInt("staffId"));
                    staff.setHoten(rs.getString("staffHoten"));

                    BorrowSlip8 slip = new BorrowSlip8();
                    slip.setId(idBorrowSlip);
                    slip.setMaphieumuon(rs.getString("maphieumuon"));
                    slip.setNgaymuon(rs.getDate("ngaymuon"));
                    slip.setNgayhentra(rs.getDate("ngayhentra"));
                    slip.setTrangthai(rs.getString("trangthai"));
                    slip.setBanDoc(reader);
                    slip.setNhanVien(staff);
                    return slip;
                }
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Loi getChiTietPhieuMuon", e);
        }
    }
}
