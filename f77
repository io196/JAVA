import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestMySQL {
    public static void main(String[] args) throws SQLException {
        String url = "jdbc:mysql://127.0.0.1:3306/ys_bit?characterEncoding=utf-8&useSSL=true";
        String username = "root";
        String password = "1996";

        DataSource dataSource = new MysqlDataSource();
        ((MysqlDataSource)dataSource).setURL(url);
        ((MysqlDataSource)dataSource).setUser(username);
        ((MysqlDataSource)dataSource).setPassword(password);

        Connection connection = dataSource.getConnection();

        String sql = "select * from student";
        PreparedStatement statement = connection.prepareStatement(sql);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            System.out.print(resultSet.getInt("id") + " ");
            System.out.print(resultSet.getString("name") + " ");
            System.out.print(resultSet.getBigDecimal("score") + " ");
            System.out.println(resultSet.getString("email"));
        }

        resultSet.close();
        statement.close();
        connection.close();
    }
}
