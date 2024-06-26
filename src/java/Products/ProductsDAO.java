/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductsDAO {

    public List<ProductsDTO> list(String keyword) {

        List<ProductsDTO> list = new ArrayList<ProductsDTO>();

        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM products ";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE category like ? ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
            }

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    String category = rs.getString("category");
                    int amount = rs.getInt("amount");
                    String color = rs.getString("color");
                    String type = rs.getString("type");
                    String size = rs.getString("size");
                    int status = rs.getInt("status");
                    String picture = rs.getString("picture");

                    ProductsDTO product = new ProductsDTO();
                    product.setId(id);
                    product.setName(name);
                    product.setPrice(price);
                    product.setCategory(category);
                    product.setAmount(amount);
                    product.setColor(color);
                    product.setType(type);
                    product.setSize(size);
                    product.setStatus(status);
                    product.setPicture(picture);

                    list.add(product);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return list;
    }

    public List<ProductsDTO> searchName(String keyword) {

        List<ProductsDTO> list = new ArrayList<ProductsDTO>();

        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM products ";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE name like ? ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
            }

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    String category = rs.getString("category");
                    int amount = rs.getInt("amount");
                    String color = rs.getString("color");
                    String type = rs.getString("type");
                    String size = rs.getString("size");
                    int status = rs.getInt("status");
                    String picture = rs.getString("picture");

                    ProductsDTO product = new ProductsDTO();
                    product.setId(id);
                    product.setName(name);
                    product.setPrice(price);
                    product.setCategory(category);
                    product.setAmount(amount);
                    product.setColor(color);
                    product.setType(type);
                    product.setSize(size);
                    product.setStatus(status);
                    product.setPicture(picture);

                    list.add(product);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return list;
    }

    public ProductsDTO load(String id) {

        String sql = "select * from products where id like ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + id + "%");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                String category = rs.getString("category");
                int amount = rs.getInt("amount");
                String color = rs.getString("color");
                String type = rs.getString("type");
                String size = rs.getString("size");
                int status = rs.getInt("status");
                String picture = rs.getString("picture");

                ProductsDTO product = new ProductsDTO();
                product.setId(id);
                product.setName(name);
                product.setPrice(price);
                product.setCategory(category);
                product.setAmount(amount);
                product.setColor(color);
                product.setType(type);
                product.setSize(size);
                product.setStatus(status);
                product.setPicture(picture);
                return product;
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Query  error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public String insert(ProductsDTO products) {
        String sql = "INSERT INTO products( id, name, price, category, amount, color, type, size, status, picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, products.getId());
            ps.setString(2, products.getName());
            ps.setInt(3, products.getPrice());
            ps.setString(4, products.getCategory());
            ps.setInt(5, products.getAmount());
            ps.setString(6, products.getColor());
            ps.setString(7, products.getType());
            ps.setString(8, products.getSize());
            ps.setInt(9, products.getStatus());
            ps.setString(10, products.getPicture());
            
            ps.executeUpdate();

            conn.close();

            return products.getId();

        } catch (SQLException ex) {
            System.out.println("Insert Events error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(ProductsDTO products) {

        String sql = "UPDATE products SET name = ?, price = ?, category = ?, amount = ?, color = ?, type = ?, size = ?, status = ? , picture = ? WHERE id = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            
            ps.setString(1, products.getName());
            ps.setInt(2, products.getPrice());
            ps.setString(3, products.getCategory());
            ps.setInt(4, products.getAmount());
            ps.setString(5, products.getColor());
            ps.setString(6, products.getType());
            ps.setString(7, products.getSize());
            ps.setInt(8, products.getStatus());
            ps.setString(9, products.getPicture());
            ps.setString(10, products.getId());

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Update Events error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public boolean delete(String id) {
        String sql = "DELETE products WHERE id = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Delete Events error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
