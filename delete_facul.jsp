<%@ page import="java.util.*,java.sql.*"%>
<%
    String un=request.getParameter("sid");
    try 
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
        String query="select * from faculty where faculty_id=?";
        PreparedStatement pst=con.prepareStatement(query);
        pst.setString(1,un);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
            String q1="delete from faculty where faculty_id=?";
            PreparedStatement pst3=con.prepareStatement(q1);
            pst3.setString(1,un);
            int r1=pst3.executeUpdate();
            if(r1>0)
            {
    %>
              <script>
                alert("Deleted Successfully");
                window.location.replace("admin1.html");
              </script>  
    <%
            }
            else
            {
    %>
                <script>
                    alert("Deletion Failed");
                    window.location.replace("admin1.html");
                </script>
    <%
            }
            con.commit();
            con.close();
        }
        else
        {
    %>
    <script>
        alert("Faculty Details Not Fount");
        window.location.replace("admin1.html");
    </script>
    <%
        } 
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");
    }
%>