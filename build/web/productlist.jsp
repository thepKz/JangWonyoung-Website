<%-- 
    Document   : productlist
    Created on : Mar 12, 2024, 11:07:09 PM
    Author     : ducco
--%>

<%@page import="java.util.List"%>
<%@page import="Products.AoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table>
    <div style="border: black 1px solid;">
    <%
        List<AoDTO> list = (List<AoDTO>) request.getAttribute("list");
        for (AoDTO product : list) {
            pageContext.setAttribute("product", product);
    %>
        <tr>
            <td>

                <a href="AoController?action=details&id=${product.id}"> ${product.id}</a></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.category}</td>
            <td>${product.amount}</td>
            <td>${product.color}</td>
            <td>${product.type}</td>
            <td>${product.size}</td>
            <td>${product.status}</td>



            <td><form action="StudentController" method="POST">
                    <input name="action" value="delete" type="hidden">
                    <input name="id" value="${student.id}" type="hidden">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
    <%
        }
    %>
    </div>
    <tr>
        <td>
            <form action="StudentController" method="POST">
                <input name="action" value="create" type="hidden">
                <input type="submit" value="Create">
            </form>
        </td> 
    </tr>
</table>


