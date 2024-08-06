<%@ page import="java.util.*,java.sql.*"%>
<%
    String un=request.getParameter("fid");
    String pwd=request.getParameter("fpass");
    try 
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
        String query="select * from admin where admin_id=? and password=?";
        PreparedStatement pst=con.prepareStatement(query);
        pst.setString(1,un);
        pst.setString(2,pwd);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
    %>
    <script>
        alert("Login Successfully");
        window.location.replace("admin1.html");
    </script>
    <%
        }
        else
        {
    %>
    <script>
        alert("Login Failed please check username or password");
        window.location.replace("admin_login.html");
    </script>
    <%
        } 
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");
    }
%>