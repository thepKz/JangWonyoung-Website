/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBUtils;

/**
 *
 * @author ducco
 */
public class UserDAO {

    public UserDTO checkLogin(String username, String password) {
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM users WHERE username = ? AND password = ? and status = 1";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {
                    user = new UserDTO();
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setMail(rs.getString("mail"));
                    user.setStatus(rs.getInt("status"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return user;
    }

    public UserDTO load(String username) {
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM users WHERE username = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {
                    user = new UserDTO();
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setMail(rs.getString("mail"));
                    user.setStatus(rs.getInt("status"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return user;
    }

    public boolean register(UserDTO user) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO users VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getMail());
            ps.setInt(4, user.getStatus());

            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean update(UserDTO user) {

        String sql = "UPDATE users SET password = ?, mail = ? WHERE username = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getPassword());
            ps.setString(2, user.getMail());
            ps.setString(3, user.getUsername());

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Update error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public List<UserDTO> list() {

        List<UserDTO> list = new ArrayList<UserDTO>();

        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM users";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String mail = rs.getString("mail");
                    int status = rs.getInt("status");

                    UserDTO user = new UserDTO();
                    user.setUsername(username);
                    user.setPassword(password);
                    user.setMail(mail);
                    user.setStatus(status);

                    list.add(user);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return list;
    }

    public String insert(UserDTO users) {
        String sql = "INSERT INTO users( username, password, mail, status) VALUES (?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, users.getUsername());
            ps.setString(2, users.getPassword());
            ps.setString(3, users.getMail());
            ps.setInt(4, users.getStatus());

            ps.executeUpdate();

            conn.close();

            return users.getUsername();

        } catch (SQLException ex) {
            System.out.println("Insert Vouchers error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update1(UserDTO users) {

        String sql = "UPDATE users SET password = ?, mail = ?, status = ? WHERE username = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, users.getPassword());
            ps.setString(2, users.getMail());
            ps.setInt(3, users.getStatus());
            ps.setString(4, users.getUsername());

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Update Vouchers error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public boolean delete(String username) {
        String sql = "DELETE users WHERE username = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Delete Vouchers error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
