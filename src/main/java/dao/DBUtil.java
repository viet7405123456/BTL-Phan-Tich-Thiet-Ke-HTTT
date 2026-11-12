package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Tien ich lay Connection toi MySQL.
 * Doc cau hinh tu bien moi truong (DB_URL/DB_USER/DB_PASSWORD) do docker-compose.yml truyen vao,
 * neu khong co thi dung gia tri mac dinh de chay local (khong Docker).
 */
public class DBUtil {

    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3307/libman?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = "root";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Khong tim thay MySQL JDBC Driver", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        String url = envOrDefault("DB_URL", DEFAULT_URL);
        String user = envOrDefault("DB_USER", DEFAULT_USER);
        String password = envOrDefault("DB_PASSWORD", DEFAULT_PASSWORD);
        return DriverManager.getConnection(url, user, password);
    }

    private static String envOrDefault(String key, String def) {
        String v = System.getenv(key);
        return (v == null || v.isEmpty()) ? def : v;
    }
}
