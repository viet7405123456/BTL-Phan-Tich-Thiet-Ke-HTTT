package dao;

import model.DocumentBorrowStatistics8;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * "DocumentBorrowStatisticsDAO8" - tuong ung so do lop thiet ke Module Thong ke tai lieu theo luot muon.
 */
public class DocumentBorrowStatisticsDAO8 extends DAO8 {

    public DocumentBorrowStatisticsDAO8() {
        super();
    }

    /**
     * Thong ke so luot muon cua tung tai lieu trong khoang [tuNgay, denNgay].
     * Lop DocumentBorrowStatistics8 dong goi tung dong ket qua thanh 1 doi tuong.
     */
    public List<DocumentBorrowStatistics8> getThongKeTaiLieuTheoLuotMuon(String tuNgay, String denNgay) {
        String sql =
            "SELECT d.id, d.matailieu, d.tentailieu, COUNT(bd.id) AS soluotmuon " +
            "FROM tblDocument8 d " +
            "JOIN tblDocumentCopy8 dc ON dc.tblDocumentid = d.id " +
            "JOIN tblBorrowDetail8 bd ON bd.tblDocumentCopyid = dc.id " +
            "JOIN tblBorrowSlip8 bs ON bs.id = bd.tblBorrowSlipid " +
            "WHERE bs.ngaymuon BETWEEN ? AND ? " +
            "GROUP BY d.id, d.matailieu, d.tentailieu " +
            "ORDER BY soluotmuon DESC";

        List<DocumentBorrowStatistics8> ketQua = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tuNgay);
            ps.setString(2, denNgay);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // --- dong goi thong tin thong ke ---
                    DocumentBorrowStatistics8 tk = new DocumentBorrowStatistics8();
                    tk.setId(rs.getInt("id"));
                    tk.setMatailieu(rs.getString("matailieu"));
                    tk.setTentailieu(rs.getString("tentailieu"));
                    tk.setSoluotmuon(rs.getInt("soluotmuon"));
                    tk.setKhoangthoigianTK(tuNgay + " - " + denNgay);
                    ketQua.add(tk);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Loi getThongKeTaiLieuTheoLuotMuon", e);
        }
        return ketQua;
    }
}
