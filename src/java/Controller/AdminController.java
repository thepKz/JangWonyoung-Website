/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Order.OrderDAO;
import Order.OrderDTO;
import OrderDetails.OrderDetailsDAO;
import OrderDetails.OrderDetailsDTO;
import Products.ProductsDAO;
import Products.ProductsDTO;
import Users.UserDAO;
import Users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserController", urlPatterns = { "/user" })
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String keyword = request.getParameter("keyword");
            ProductsDAO productsDAO = new ProductsDAO();
            OrderDAO ordersDAO = new OrderDAO();
            OrderDetailsDAO orderdetailsDAO = new OrderDetailsDAO();
            UserDAO userDAO = new UserDAO();

            if (action.equals("list")) {
                ProductsDAO dao = new ProductsDAO();
                List<ProductsDTO> list = dao.list(keyword);
                request.setAttribute("list", list);
                request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
            } else if (action.equals("orderlist")) {
                OrderDAO od = new OrderDAO();
                List<OrderDTO> orderlist = od.list();
                request.setAttribute("orderlist", orderlist);
                request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
            } else if (action.equals("userlist")) {
                UserDAO user = new UserDAO();
                List<UserDTO> userlist = user.list();
                request.setAttribute("userlist", userlist);
                request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
            } else {
                switch (action) {
                    case "details":
                        String id = request.getParameter("id");

                        ProductsDTO products = null;
                        if (id != null) {
                            products = productsDAO.load(id);
                        }

                        request.setAttribute("products", products);
                        RequestDispatcher rd = request.getRequestDispatcher("productadmindetail.jsp");
                        rd.forward(request, response);
                        break;
                    case "edit":
                        id = null;
                        id = request.getParameter("id");
                        products = null;
                        if (id != null) {
                            products = productsDAO.load(id);
                        }

                        request.setAttribute("products", products);
                        request.setAttribute("nextaction", "update");

                        rd = request.getRequestDispatcher("productadminedit.jsp");
                        rd.forward(request, response);

                        break;
                    case "create":
                        id = null;
                        id = request.getParameter("id");
                        products = new ProductsDTO();
                        products.setId(id);
                        request.setAttribute("products", products);
                        request.setAttribute("nextaction", "insert");
                        rd = request.getRequestDispatcher("productadminedit.jsp");
                        rd.forward(request, response);
                        break;
                    case "update":
                        id = null;
                        id = request.getParameter("id");

                        String name = request.getParameter("name");
                        int price = Integer.parseInt(request.getParameter("price"));
                        String category = request.getParameter("category");
                        int amount = Integer.parseInt(request.getParameter("amount"));
                        String color = request.getParameter("color");
                        String type = request.getParameter("type");
                        String size = request.getParameter("size");
                        int status = Integer.parseInt(request.getParameter("status"));
                        String picture = request.getParameter("picture");

                        products = null;
                        if (id != null) {
                            products = productsDAO.load(id);
                        }

                        products.setName(name);
                        products.setPrice(price);
                        products.setCategory(category);
                        products.setAmount(amount);
                        products.setColor(color);
                        products.setType(type);
                        products.setSize(size);
                        products.setStatus(status);
                        products.setPicture(picture);

                        productsDAO.update(products);

                        request.setAttribute("products", products);
                        request.setAttribute("nextaction", "update");
                        rd = request.getRequestDispatcher("productadmindetail.jsp");
                        rd.forward(request, response);

                        break;
                    case "insert":
                        id = null;
                        id = request.getParameter("id");

                        name = request.getParameter("name");
                        price = Integer.parseInt(request.getParameter("price"));
                        category = request.getParameter("category");
                        amount = Integer.parseInt(request.getParameter("amount"));
                        color = request.getParameter("color");
                        type = request.getParameter("type");
                        size = request.getParameter("size");
                        status = Integer.parseInt(request.getParameter("status"));
                        picture = request.getParameter("picture");

                        products = new ProductsDTO();
                        products.setId(id);
                        products.setName(name);
                        products.setPrice(price);
                        products.setCategory(category);
                        products.setAmount(amount);
                        products.setColor(color);
                        products.setType(type);
                        products.setSize(size);
                        products.setStatus(status);
                        products.setPicture(picture);

                        productsDAO.insert(products);

                        request.setAttribute("products", products);
                        rd = request.getRequestDispatcher("productadmindetail.jsp");
                        rd.forward(request, response);
                        break;
                    case "delete":
                        id = null;
                        id = request.getParameter("id");

                        productsDAO.delete(id);

                        List<ProductsDTO> list = productsDAO.list(keyword);
                        request.setAttribute("list", list);
                        request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
                        break;

                    case "order-edit":
                        id = null;
                        id = request.getParameter("id");

                        OrderDTO orders = new OrderDTO();
                        if (id != null) {
                            orders = ordersDAO.load(id);
                        }

                        request.setAttribute("orders", orders);
                        request.setAttribute("nextaction", "order-update");

                        rd = request.getRequestDispatcher("orderadminedit.jsp");
                        rd.forward(request, response);

                        break;

                    case "order-update":
                        id = null;
                        id = request.getParameter("id");
                        String userID = request.getParameter("userID");
                        String address = request.getParameter("address");
                        int phone = Integer.parseInt(request.getParameter("phone"));
                        String status1 = request.getParameter("status");

                        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));

                        orders = new OrderDTO();
                        if (id != null) {
                            orders = ordersDAO.load(id);
                        }

                        orders.setUserID(userID);
                        orders.setAddress(address);
                        orders.setPhone(phone);
                        orders.setStatus(status1);
                        orders.setTotalPrice(totalPrice);

                        ordersDAO.update(orders);

                        request.setAttribute("orders", orders);
                        request.setAttribute("nextaction", "order-update");
                        rd = request.getRequestDispatcher("orderadmindetail.jsp");
                        rd.forward(request, response);
                        break;

                    case "order-admin-detail":
                        id = null;
                        id = request.getParameter("id");
                        String productID = request.getParameter("productID");

                        List<OrderDetailsDTO> orderdetaillist = orderdetailsDAO.list(id);
                        request.setAttribute("orderdetaillist", orderdetaillist);
                        rd = request.getRequestDispatcher("orderdetaillist.jsp");
                        rd.forward(request, response);
                        break;
                    case "user-edit":
                        username = null;
                        username = request.getParameter("username");

                        UserDTO users = new UserDTO();
                        users = null;
                        if (username != null) {
                            users = userDAO.load(username);
                        }

                        request.setAttribute("users", users);
                        request.setAttribute("nextaction", "user-update");

                        rd = request.getRequestDispatcher("useradminedit.jsp");
                        rd.forward(request, response);

                        break;
                    case "user-create":
                        username = null;
                        username = request.getParameter("username");
                        users = new UserDTO();
                        users.setUsername(username);
                        request.setAttribute("users", users);
                        request.setAttribute("nextaction", "user-insert");
                        rd = request.getRequestDispatcher("useradminedit.jsp");
                        rd.forward(request, response);
                        break;
                    case "user-update":
                        username = null;
                        username = request.getParameter("username");
                        password = null;
                        password = request.getParameter("password");
                        String mail = request.getParameter("mail");
                        status = Integer.parseInt(request.getParameter("status"));

                        users = new UserDTO();
                        if (username != null) {
                            users = userDAO.load(username);
                        }

                        users.setUsername(username);
                        users.setPassword(password);
                        users.setMail(mail);
                        users.setStatus(status);

                        userDAO.update1(users);

                        request.setAttribute("users", users);
                        request.setAttribute("nextaction", "user-update");
                        rd = request.getRequestDispatcher("useradmindetail.jsp");
                        rd.forward(request, response);

                        break;
                    case "user-insert":
                        username = null;
                        username = request.getParameter("username");
                        password = request.getParameter("password");
                        mail = request.getParameter("mail");
                        status = Integer.parseInt(request.getParameter("status"));

                        users = new UserDTO();
                        users.setUsername(username);
                        users.setPassword(password);
                        users.setMail(mail);
                        users.setStatus(status);

                        userDAO.insert(users);

                        request.setAttribute("users", users);
                        rd = request.getRequestDispatcher("useradmindetail.jsp");
                        rd.forward(request, response);
                        break;
                    case "user-delete":
                        username = null;
                        username = request.getParameter("username");

                        userDAO.delete(username);

                        List<UserDTO> userlist = userDAO.list();
                        request.setAttribute("userlist", userlist);
                        request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
                        break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
