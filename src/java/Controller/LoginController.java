/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Products.ProductsDAO;
import Products.ProductsDTO;
import Users.UserDAO;
import Users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ducco
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String keyword = "Shirt";

            if (action == null || action.equals("login")) {
                UserDAO dao = new UserDAO();
                UserDTO user = dao.checkLogin(username, password);

                if (user != null) {
                    if (user.getUsername().equals("admin")) {
                        HttpSession session = request.getSession(true);
                        ProductsDAO daoP = new ProductsDAO();
                        List<ProductsDTO> list = daoP.list(keyword);
                        request.setAttribute("list", list);
                        session.setAttribute("usersession", user);
                        request.setAttribute("admin", user);
                        request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
                    } else {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("usersession", user);
                        request.setAttribute("user", user);
                        RequestDispatcher rd = request.getRequestDispatcher("loginSucc.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Username or password is incorrect");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            } else if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                    request.setAttribute("error", "Logout successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            } else if (action.equals("edit")) {
                username = request.getParameter("username");

                UserDTO user = null;
                UserDAO dao = new UserDAO();
                if (username != null) {
                    user = dao.load(username);
                }

                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("useredit.jsp");
                rd.forward(request, response);

            } else if (action.equals("save")) {
                username = request.getParameter("username");

                password = request.getParameter("password");
                String mail = request.getParameter("mail");

                UserDTO user = null;
                UserDAO dao = new UserDAO();
                if (username != null) {
                    user = dao.load(username);
                }

                user.setPassword(password);
                user.setMail(mail);

                dao.update(user);
                user = dao.load(username);
                request.setAttribute("user", user);
                user = dao.checkLogin(username, password);
                HttpSession session = request.getSession(true);
                session.setAttribute("usersession", user);
                RequestDispatcher rd = request.getRequestDispatcher("loginSucc.jsp");
                rd.forward(request, response);

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
