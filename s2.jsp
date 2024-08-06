<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Info</title>
    <link rel="icon" type="image/x-icon" href="photos/logo.png">
    <style>
        input{
            height: 5vh;
            width: 20vw;
            border-radius: 10px;
        }
        label{
            font-size: larger;
        }
        #i1{
            border: none;
        }
        table{
            border-spacing: 5vh;
        }
        #tm td{
            height:5vh;
            width: 20vw;
            text-align: center;
            font-weight:500;
        }
        #tm th{
            height:5vh;
            width: 20vw;
            text-align: center;
        }
        .logoim{
            height: 7vh;
            width: 4vw;
            margin-top: 1%;
        }
        b{
            margin-left: 55vw;
            font-size: large;
        }
    </style>
</head>
<body>
    <nav>
        <h1 style="background-color: rgb(60, 254, 238);  font-size: xx-large;height: 10vh;"><img class="logoim" src="photos/logo1.png" alt=""> Sunshine Jr College
            <%
            String un1=request.getParameter("reg");
            String pwd1=request.getParameter("spass");
        try 
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
            String query5="select * from student where regnum=? and password=?";
            PreparedStatement pst5=con.prepareStatement(query5);
            pst5.setString(1,un1);
            pst5.setString(2,pwd1);
            ResultSet rs5=pst5.executeQuery();
            if(rs5.next())
            {
                session.setAttribute("user",rs5.getString(2));
            }
        }
        catch(Exception e){}
            String rn0=(String)session.getAttribute("user");
            out.println("<b>"+"Welcome "+rn0+"..."+"</b>");
         %>
        </h1>
    </nav>
    <form action="">
        <%
        String un=request.getParameter("reg");
        String pwd=request.getParameter("spass");
        try 
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
            String query="select * from student where regnum=? and password=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,un);
            pst.setString(2,pwd);
            ResultSet rs=pst.executeQuery();
            String q2="select * from termone where regnum=?";
            PreparedStatement pst1=con.prepareStatement(q2);
            pst1.setString(1,un);
            ResultSet rs1=pst1.executeQuery();
            String q3="select * from termtwo where regnum=?";
            PreparedStatement pst2=con.prepareStatement(q3);
            pst2.setString(1,un);
            ResultSet rs2=pst2.executeQuery();
            if(rs.next() && rs1.next() && rs2.next())
            {
                //session.setAttribute("user",rs.getString(2));
                %>
                <script>
                    alert("Login Successfully");
                </script>
                <%
        %>
        <table>
            <h2>Student Information</h2>
            <tr>
                <td>
                    <label id="box">Student Registration Number <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(1)%>" readonly>
                </td>
                <td>
                    <label id="box">Student Name <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(2)%>" readonly>
                </td>
                <td>
                    <label id="box">Student Mobile Number <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(3)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="box">Course <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(4)%>" readonly>
                </td>
                <td>
                    <label id="box">Studying Year <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(5)%>" readonly>
                </td>
                <td>
                    <label id="box">Gender <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(6)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="box">Date Of Birth <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(7)%>" readonly>
                </td>
                <td>
                    <label id="box">Student Email <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(8)%>" readonly>
                </td>
            </tr>
        </table>
        <table>
            <h2>Personal Details</h2>
            <tr>
                <td>
                    <label id="box">Father Name <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(9)%>" readonly>
                </td>
                <td>
                    <label id="box">Father Occupation <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(10)%>" readonly>
                </td>
                <td>
                    <label id="box">Mother Name <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(11)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="box">Mother Occupation <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(12)%>" readonly>
                </td>
                <td>
                    <label id="box">Address <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(13)%>" readonly>
                </td>
                <td>
                    <label id="box">Parent Mobile Number <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(14)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="box">Parent Email <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                    <input type="text" value="<%=rs.getString(15)%>" readonly>
                </td>
            </tr>
        </table>
        <table id="tm" border="2px" style="border-collapse: collapse;">
            <h2>Student Marks Details</h2>
            <tr>
                <th>Subject Name</th>
                <th>1st Term Marks</th>
                <th>2nd Term Marks</th>
            </tr>
            <tr>
                <td>Subject One</td>
                <td>
                    <input id="i1" type="text" value="<%=rs1.getString(2)%>" readonly>
                </td>
                <td>
                    <input id="i1" type="text" value="<%=rs2.getString(2)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>Subject Two</td>
                <td>
                    <input id="i1" type="text" value="<%=rs1.getString(3)%>" readonly>
                </td>
                <td>
                    <input id="i1" type="text" value="<%=rs2.getString(3)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>Subject Three</td>
                <td>
                    <input id="i1" type="text" value="<%=rs1.getString(4)%>" readonly>
                </td>
                <td>
                    <input id="i1" type="text" value="<%=rs2.getString(4)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>Subject Four</td>
                <td>
                    <input  id="i1" type="text" value="<%=rs1.getString(5)%>" readonly>
                </td>
                <td>
                    <input id="i1" type="text" value="<%=rs2.getString(5)%>" readonly>
                </td>
            </tr>
            <tr>
                <td>Subject Five</td>
                <td>
                    <input id="i1" type="text" value="<%=rs1.getString(6)%>" readonly>
                </td>
                <td>
                    <input id="i1" type="text" value="<%=rs2.getString(6)%>" readonly>
                </td>
            </tr>
        </table>
    <%
            }
            else{
                %>
                <script>
                    alert("Invalid Login Details");
                    window.location.replace("std_login.html");
                </script>
                <%
            }
        }
            catch(Exception e)
    {
        out.println("<h1>"+e+"</h1>");
    }
%>
    </form>
</body>
</html>