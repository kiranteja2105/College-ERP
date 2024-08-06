<%@ page import="java.util.*,java.sql.*"%>
<%
    String m1=request.getParameter("s1");
    String m2=request.getParameter("s2");
    String m3=request.getParameter("s3");
    String m4=request.getParameter("s4");
    String m5=request.getParameter("s5");
    String r=request.getParameter("r1");
    try 
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
        String q1="select * from termone where regnum=?";
        PreparedStatement pst1=con.prepareStatement(q1);
        pst1.setString(1,r);
        ResultSet rs=pst1.executeQuery();
        String q2="select * from student where regnum=?";
        PreparedStatement pst2=con.prepareStatement(q2);
        pst2.setString(1,r);
        ResultSet rs1=pst2.executeQuery();
        if(rs.next())
        {
    %>
            <script>
                alert("Marks Already Inserted");
                window.location.replace("faculty1.jsp");
            </script>
    <%
        }
        else if(rs1.next()){
            String query="insert into termone values(?,?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,r);
            pst.setString(2,m1);
            pst.setString(3,m2);
            pst.setString(4,m3);
            pst.setString(5,m4);
            pst.setString(6,m5);
            int res=pst.executeUpdate();
            if(res>0)
             {
    %>
        <script>
            alert("Added Term one marks Successfully");
            window.location.replace("faculty1.jsp");
        </script>
	    <%
		    con.commit();
		    con.close();
            }
            else
            {
        %>
            <script>
                alert("insertion Failed");
                window.location.replace("termone.html");
            </script>
    <%
        }
    }
    else
    {
    %>
      <script>
        alert("Student Details Not Found");
        window.location.replace("faculty1.jsp");
      </script>
    <%
    }
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");	
    }
%>