package dao;

import model.BorrowDetail8;
import model.BorrowSlip8;
import model.DocumentCopy8;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * "BorrowDetailDAO8" - tuong ung so do lop thiet ke Module Thong ke tai lieu theo luot muon.
 */
public class BorrowDetailDAO8 extends DAO8 {

    public BorrowDetailDAO8() {
        super();
    }

    /**
     * Lay chi tiet cac luot muon cua 1 tai lieu (idDocument) trong khoang [tuNgay, denNgay].
     */
    public List<BorrowDetail8> getChiTietLuotMuonCuaTaiLieu(int idDocument, String tuNgay, String denNgay) {
        String sql =
            "SELECT bd.id AS bdId, bd.tinhtrangbansaokhimuon, " +
            "       bs.id AS bsId, bs.maphieumuon, bs.ngaymuon, bs.ngayhentra, bs.trangthai, " +
            "       dc.id AS dcId, dc.mabansao " +
            "FROM tblBorrowDetail8 bd " +
            "JOIN tblBorrowSlip8 bs ON bs.id = bd.tblBorrowSlipid " +
            "JOIN tblDocumentCopy8 dc ON dc.id = bd.tblDocumentCopyid " +
            "WHERE dc.tblDocumentid = ? AND bs.ngaymuon BETWEEN ? AND ? " +
            "ORDER BY bs.ngaymuon DESC";

        List<BorrowDetail8> ketQua = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idDocument);
            ps.setString(2, tuNgay);
            ps.setString(3, denNgay);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // --- dong goi thong tin ---
                    BorrowSlip8 slip = new BorrowSlip8();
                    slip.setId(rs.getInt("bsId"));
                    slip.setMaphieumuon(rs.getString("maphieumuon"));
                    slip.setNgaymuon(rs.getDate("ngaymuon"));
                    slip.setNgayhentra(rs.getDate("ngayhentra"));
                    slip.setTrangthai(rs.getString("trangthai"));

                    DocumentCopy8 copy = new DocumentCopy8();
                    copy.setId(rs.getInt("dcId"));
                    copy.setMabansao(rs.getString("mabansao"));

                    BorrowDetail8 detail = new BorrowDetail8();
                    detail.setId(rs.getInt("bdId"));
                    detail.setTinhtrangbansaokhimuon(rs.getString("tinhtrangbansaokhimuon"));
                    detail.setBorrowSlip(slip);
                    detail.setDocumentCopy(copy);

                    ketQua.add(detail);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Loi getChiTietLuotMuonCuaTaiLieu", e);
        }
        return ketQua;
    }
}
