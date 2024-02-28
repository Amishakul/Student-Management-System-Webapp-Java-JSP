<%@ page import="java.sql.*" %>

<html>
<head>
    <title> Student Management System </title>
    <link rel="stylesheet" href="mystyle.css"/>
</head>
<body>
    <center>
        <h1> View records of the student </h1>
        <%
        String un = (String) session.getAttribute("un");
        if (un == null) {
            response.sendRedirect("index.jsp");
        } 
        %>

        <table border="5" style="width: 60%; margin-top: 20px; margin-bottom: 20px;">
            <tr>
                <th style="padding: 10px;"> Rno </th>
                <th style="padding: 10px;"> Name </th>
                <th style="padding: 10px;"> Marks </th>
            </tr>

       
            <%
            try 
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/sms_19july23";
                Connection con = DriverManager.getConnection(url, "root", "amishaka");
                String sql = "SELECT rno, name, marks FROM sms";
                PreparedStatement pst = con.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();

                while(rs.next()) {
            %>
            <tr style="text-align:center;">
                <td style="padding: 10px;"> <%= rs.getString(1) %> </td>
                <td style="padding: 10px;"> <%= rs.getString(2) %> </td>
                <td style="padding: 10px;"> <%= rs.getString(3) %> </td>
            </tr>
      <%    }

                con.close();
            }
            catch(SQLException e)
            {
                out.println("sql issue " + e);
            }
            catch(ClassNotFoundException e)
            {
                out.println("Class not found: " + e);
            }
            %>
        </table>

        <br><br>
        <form method="POST">
            <button class="login-button" type="submit" name="btn">Back</button>
        </form>
        <br><br><br>
        <% if (request.getParameter("btn") != null) {
            response.sendRedirect("sms.jsp");
            return;
        } %>
    </center>
</body>
</html>
