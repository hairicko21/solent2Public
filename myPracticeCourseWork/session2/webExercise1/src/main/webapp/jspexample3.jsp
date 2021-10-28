<%-- 
    Document   : jspexample3
    Created on : 28 Oct 2021, 20:19:38
    Author     : hairi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%
    // retrieve the stored user list from the session
    List<String> users = (List<String>) session.getAttribute("users");
    if (users == null) {
        users = new ArrayList<String>();
        session.setAttribute("users", users);
    }
    
    String name = request.getParameter("userName");
    
    // find what action to perform on the page
    String action = request.getParameter("action");
    
    if ("removeUser".equals(action)) {
        users.remove(name);
    } else if ("addUser".equals(action)) {
        users.add(name);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <body>
        <h1>JSP Example 3: User list </h1>
        
        <h2>user lists</h2>
        <% for (String user : users) {%>
        <p><%=user%></p>
        <% 
            }
        %>
        <h2>commands</h2>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="addUser"><!-- comment -->
            <button type="submit" > add name to list </button>
        </form>
        <br><!-- comment -->
        <form action="./jspexample3.jsp" method="get">
            <P>user name <input type="text" name="userName" value=""></p><!-- comment -->
            <input type="hidden" name="action" value="removeUser"><!-- comment -->
            <button type="submit" > remove name from list</button>
            
        </form>
    </body>
</html>
