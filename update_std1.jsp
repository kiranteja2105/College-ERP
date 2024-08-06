<%@ page import="java.util.*,java.sql.*"%>
<%
        String rn1=(String)session.getAttribute("user");
        String sname=request.getParameter("sd");
        String smob=request.getParameter("sm");
        String scou=request.getParameter("cou");
        String syear=request.getParameter("year");
        String gen=request.getParameter("gen");
        String semail=request.getParameter("semail");
        String sdob=request.getParameter("dob");
        String fname=request.getParameter("fn");
        String focc=request.getParameter("fo");
        String mname=request.getParameter("mn");
        String mocc=request.getParameter("mo");
        String add=request.getParameter("add");
        String pmob=request.getParameter("pm");
        String pemail=request.getParameter("pemail");
        try 
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105"); 
            String q1="update student set stdname=?,stdmobile=?,course=?,year=?,gender=?,dob=?,stdemail=?,fname=?,foccup=?,mname=?,moccup=?,address=?,pmobile=?,pemail=? where regnum=?";
            PreparedStatement pst=con.prepareStatement(q1);
            pst.setString(1,sname);
            pst.setString(2,smob);
            pst.setString(3,scou);
            pst.setString(4,syear);
            pst.setString(5,gen);
            pst.setString(6,sdob);
            pst.setString(7,semail);
            pst.setString(8,fname);
            pst.setString(9,focc);
            pst.setString(10,mname);
            pst.setString(11,mocc);
            pst.setString(12,add);
            pst.setString(13,pmob);
            pst.setString(14,pemail);
            pst.setString(15,rn1);
            int r1=pst.executeUpdate();
            if(r1>0)
            {
        %>
                <script>
                    alert("Updation Successfully");
                    window.location.replace("admin1.html");
                </script>
        <%
            }
            else{
        %>
                <script>
                    alert("Updation Failed");
                    window.location.replace("update.html");
                </script>
        <%
            }
            con.commit();
            con.close();
        }
        catch(Exception e)
        {
            out.println("<h1>"+e+"</h1>");
        }
        %>