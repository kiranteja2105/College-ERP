<%@ page import="java.util.*,java.sql.*"%>
<%
    String un=request.getParameter("sid");
    try 
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
        String query="select * from student where regnum=?";
        PreparedStatement pst=con.prepareStatement(query);
        pst.setString(1,un);
        ResultSet rs=pst.executeQuery();
        String query1="select * from termone where regnum=?";
        PreparedStatement pst1=con.prepareStatement(query1);
        pst1.setString(1,un);
        ResultSet rs1=pst1.executeQuery();
        String query2="select * from termtwo where regnum=?";
        PreparedStatement pst2=con.prepareStatement(query2);
        pst2.setString(1,un);
        ResultSet rs2=pst2.executeQuery();
        if(rs.next() && rs1.next() && rs2.next())
        {
            String q1="delete from student where regnum=?";
            PreparedStatement pst3=con.prepareStatement(q1);
            pst3.setString(1,un);
            int r1=pst3.executeUpdate();
            String q2="delete from termone where regnum=?";
            PreparedStatement pst4=con.prepareStatement(q2);
            pst4.setString(1,un);
            int r2=pst4.executeUpdate();
            String q3="delete from termtwo where regnum=?";
            PreparedStatement pst5=con.prepareStatement(q3);
            pst5.setString(1,un);
            int r3=pst5.executeUpdate();
            if(r1>0 && r2>0 && r3>0)
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
        alert("student Details Not Fount");
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