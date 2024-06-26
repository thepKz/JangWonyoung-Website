/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    public boolean order(OrderDTO order) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO orders VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, order.getId());
            ps.setString(2, order.getUserID());
            ps.setString(3, order.getAddress());
            ps.setInt(4, order.getPhone());
            ps.setString(5, order.getStatus());
            ps.setInt(6, order.getTotalPrice());

            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public String getMaxOrderID() {
        String sql = "SELECT MAX(id) FROM orders";
        String maxIDString = "0";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int maxID = rs.getInt(1) + 1;
                maxIDString = String.valueOf(maxID);
                return maxIDString;
            }

        } catch (SQLException ex) {
            System.out.println("MaxID error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return null;
    }

    public List<OrderDTO> list() {

        List<OrderDTO> list = new ArrayList<OrderDTO>();

        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM orders ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String userID = rs.getString("userID");
                    String address = rs.getString("address");
                    int phone = rs.getInt("phone");
                    String status = rs.getString("status");
                    int totalPrice = rs.getInt("totalPrice");

                    OrderDTO od = new OrderDTO();
                    od.setId(id);
                    od.setUserID(userID);
                    od.setAddress(address);
                    od.setPhone(phone);
                    od.setStatus(status);
                    od.setTotalPrice(totalPrice);

                    list.add(od);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return list;
    }

    public OrderDTO load(String id) {

        String sql = "select * from orders where id = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                id = rs.getString("id");
                String userID = rs.getString("userID");
                String address = rs.getString("address");
                int phone = rs.getInt("phone");
                String status = rs.getString("status");

                int totalPrice = rs.getInt("totalPrice");

                OrderDTO orders = new OrderDTO();
                orders.setId(id);
                orders.setUserID(userID);
                orders.setAddress(address);
                orders.setPhone(phone);
                orders.setStatus(status);
                orders.setTotalPrice(totalPrice);
                return orders;
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Query  error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(OrderDTO orders) {

        String sql = "UPDATE orders SET status = ? WHERE id = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, orders.getStatus());
            ps.setString(2, orders.getId());

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Update Events error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
