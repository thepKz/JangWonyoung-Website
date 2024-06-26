/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OrderDetails;

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
public class OrderDetailsDAO {
    public boolean addOrderDetail(OrderDetailsDTO orderDetail) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO orderDetails VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, orderDetail.getOrderID());
            ps.setString(2, orderDetail.getProductID());

            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public List<OrderDetailsDTO> list(String orderID) {

        List<OrderDetailsDTO> list = new ArrayList<OrderDetailsDTO>();

        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM orderDetails where orderID = ? ";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, orderID);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    orderID = rs.getString("orderID");
                    String productID = rs.getString("productID");

                    OrderDetailsDTO od = new OrderDetailsDTO();
                    od.setOrderID(orderID);
                    od.setProductID(productID);

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

    public OrderDetailsDTO load(String orderid) {
        OrderDetailsDTO orderdetails = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM orderDetails WHERE orderid = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, orderid);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {
                    orderdetails = new OrderDetailsDTO();
                    orderdetails.setOrderID(rs.getString("orderID"));
                    orderdetails.setProductID(rs.getString("productID"));

                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return orderdetails;
    }

    public static void main(String[] args) {
        OrderDetailsDAO oke = new OrderDetailsDAO();
        System.out.println(oke.load("OD-1"));
    }
}
