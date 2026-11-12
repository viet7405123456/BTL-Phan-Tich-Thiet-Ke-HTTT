package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * LUU Y: lop nay KHONG nam trong so do lop thiet ke goc.
 * Duoc them vao chi de phuc vu trang chon vai tro demo (index.jsp) thay the cho
 * chuc nang dang nhap (theo thong nhat: "khong can dang nhap, demo thang vao trang chu").
 */
public class MemberDAO8 extends DAO8 {

    public MemberDAO8() {
        super();
    }

    /** Danh sach thanh vien chua la nhan vien (Staff) - ung vien de vao vai tro Ban doc. */
    public List<Object[]> getAllNonStaffMembers() {
        String sql = "SELECT m.id, m.hoten, (r.id IS NOT NULL) AS isReader " +
                "FROM tblMember8 m " +
                "LEFT JOIN tblReader8 r ON r.id = m.id " +
                "WHERE m.id NOT IN (SELECT id FROM tblStaff8) " +
                "ORDER BY m.id";
        return queryIdHotenFlag(sql);
    }

    public List<Object[]> getAllManagers() {
        String sql = "SELECT m.id, m.hoten, true FROM tblMember8 m " +
                "JOIN tblManager8 mg ON mg.id = m.id ORDER BY m.id";
        return queryIdHotenFlag(sql);
    }

    public List<Object[]> getAllLibraryStaff() {
        String sql = "SELECT m.id, m.hoten, true FROM tblMember8 m " +
                "JOIN tblLibraryStaff8 ls ON ls.id = m.id ORDER BY m.id";
        return queryIdHotenFlag(sql);
    }

    public String getHoTen(int idMember) {
        String sql = "SELECT hoten FROM tblMember8 WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idMember);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getString("hoten");
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Loi getHoTen", e);
        }
    }

    private List<Object[]> queryIdHotenFlag(String sql) {
        List<Object[]> result = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                result.add(new Object[]{rs.getInt(1), rs.getString(2), rs.getBoolean(3)});
            }
        } catch (SQLException e) {
            throw new RuntimeException("Loi truy van danh sach thanh vien", e);
        }
        return result;
    }
}
