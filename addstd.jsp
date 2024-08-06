<%@ page import="java.util.*,java.sql.*"%>
<%
    String regn=request.getParameter("reg");
    String sname=request.getParameter("sn");
    String snum=request.getParameter("sm");
    String scou=request.getParameter("cou");
    String year=request.getParameter("year");
    String gen=request.getParameter("gen");
    String smail=request.getParameter("semail");
    String dob=request.getParameter("dob");
    String fname=request.getParameter("fn");
    String focc=request.getParameter("fo");
    String mname=request.getParameter("mn");
    String mocc=request.getParameter("mo");
    String add=request.getParameter("add");
    String pnum=request.getParameter("pm");
    String pemail=request.getParameter("pemail");
    String pwd=request.getParameter("pass");
    try 
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
        String q2="select * from student where regnum=?";
        PreparedStatement pst2=con.prepareStatement(q2);
        pst2.setString(1,regn);
        ResultSet rs1=pst2.executeQuery();
        if(rs1.next())
        {
    %>
            <script>
                alert("Student is already registered with this Registration number");
                window.location.replace("admin1.html");
            </script>
    <%
        }
        else
        {
            String query="insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,regn);
            pst.setString(2,sname);
            pst.setString(3,snum);
            pst.setString(4,scou);
            pst.setString(5,year);
            pst.setString(6,gen);
            pst.setString(7,dob);
            pst.setString(8,smail);
            pst.setString(9,fname);
            pst.setString(10,focc);
            pst.setString(11,mname);
            pst.setString(12,mocc);
            pst.setString(13,add);
            pst.setString(14,pnum);
            pst.setString(15,pemail);
            pst.setString(16,pwd);
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
                window.location.replace("addstd.html");
            </script>
    <%
            }   
        }
    }
    catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");	
    }
%>