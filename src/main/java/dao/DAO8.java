package dao;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Lop DAO co so, tuong ung "DAO8" trong so do lop thiet ke.
 * Cac lop DAO cu the ke thua lop nay de dung chung Connection.
 */
public abstract class DAO8 {
    protected Connection con;

    public DAO8() {
        try {
            this.con = DBUtil.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Khong ket noi duoc CSDL", e);
        }
    }
}
