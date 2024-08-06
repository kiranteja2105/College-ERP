<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Details111</title>
    <link rel="stylesheet" href="addstd.css">
    <link rel="icon" type="image/x-icon" href="photos/logo.png">
    <style>
        p{
            width: 100%;
            height: 36px;
            display: block;
            border-radius: 4px;
            border: 1px solid #1B1B1B46;
            padding-left: 8px;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="registration-header">
            <h2>Update Student Details</h2>
            <span class="divider"></span>
        </div>
        <div class="registration-body">
    <%
        String un=request.getParameter("sid");
        session.setAttribute("user",un);
        try 
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kiran","2105");
            String query="select * from student where regnum=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,un);
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            {
    %>
                <form action="update_std1.jsp">
                    <div class="registration-box">
                        <div class="input-box">
                            <label for="">Student Registration Number <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="sn" value="<%=rs.getString(1)%>"  readonly>
                        </div>
                        <div class="input-box">
                            <label for="">Student Name <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="sd"  value="<%=rs.getString(2)%>"  placeholder="Enter Student Name">
                        </div>
                        <div class="input-box">
                            <label for="">Student Mobile Number <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="sm" value="<%=rs.getString(3)%>"  placeholder="Enter Std Contact Number">
                        </div>
                        <div class="input-box">
                            <label for="">Course <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="cou" value="<%=rs.getString(4)%>"  placeholder="Enter Course">
                        </div>
                        <div class="input-box">
                            <label for="">Studying Year <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="year" value="<%=rs.getString(5)%>"  placeholder="Enter Studying Year">
                        </div>
                        <div class="input-box1">
                            <label for="">Gender <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label> <br>
                            <input type="radio"  name="gen" value="male">Male
                            <input type="radio"  name="gen" value="Female">Female
                        </div>
                        <div class="input-box">
                            <label for="">Email <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="email" class="input-field" name="semail" value="<%=rs.getString(8)%>"  placeholder="Enter Std Email">
                        </div>
                        <div class="input-box">
                            <label for="">Date Of Birth <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="date" class="input-field" name="dob" value="<%=rs.getString(7)%>"  placeholder="dd-m_name-yyyy">
                        </div>
                        <div class="input-box">
                            <label for="">Father Name <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="fn" value="<%=rs.getString(9)%>"  placeholder="Enter Std Father Name">
                        </div>
                        <div class="input-box">
                            <label for="">Father Occupation <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="fo" value="<%=rs.getString(10)%>"  placeholder="Enter Father Occupation">
                        </div>
                        <div class="input-box">
                            <label for="">Mother Name <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="mn" value="<%=rs.getString(11)%>"  placeholder="Enter Std Mother Name">
                        </div>
                        <div class="input-box">
                            <label for="">Mother Occupation <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="mo" value="<%=rs.getString(12)%>"  name placeholder="Enter Std Address">
                        </div>
                        <div class="input-box">
                            <label for="">Address <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="add" value="<%=rs.getString(13)%>"  placeholder="Enter Parent mobile number">
                        </div>
                        <div class="input-box">
                            <label for="">Parent Mobile Number <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="text" class="input-field" name="pm" value="<%=rs.getString(14)%>"  placeholder="Enter Parent Email">
                        </div>
                        <div class="input-box">
                            <label for="">Parent Email <span style="color: red;font-weight: bold;font-size: 12pt;">*</span></label>
                            <input type="email" class="input-field" name="pemail" value="<%=rs.getString(15)%>"  placeholder="Enter Your Password">
                        </div>
                    </div>
                    <button type="reset" class="btn-register">Reset</button>
                    <button type="submit" class="btn-register">Update Now</button>
                </form>
    <%    
            con.commit();
            con.close();
            }
            else
            {
    %>
                <script>
                    alert("Student Details Not Found");
                    window.location.replace("update.html");
                </script>
    <%
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>
        </div>
    </div>
</body>
</html>