<%@ page import="java.util.*,java.sql.*"%>
<%
    String fid=request.getParameter("fi");
    String fname=request.getParameter("fn");
    String fdesig=request.getParameter("fd");
    String fpass=request.getParameter("fp");
    try 
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
        String query="insert into faculty values(?,?,?,?)";
        PreparedStatement pst=con.prepareStatement(query);
        pst.setString(1,fid);
        pst.setString(2,fname);
        pst.setString(3,fdesig);
        pst.setString(4,fpass);
        int res=pst.executeUpdate();
        if(res>0)
        {
    %>
    <script>
        alert("Added Successfully");
        window.location.replace("admin1.html");
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
            window.location.replace("addfaculty.html");
         </script>
    <%
        }
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");	
    }
%>