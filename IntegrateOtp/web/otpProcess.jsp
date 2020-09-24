<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
              <%
                   String name=(String)session.getAttribute("name");
                   String email=(String)session.getAttribute("email");
                   String phone=(String)session.getAttribute("phone");
                   int otp= (Integer) session.getAttribute("otp");
                   String otpvalue=request.getParameter("otpvalue");
                   int enterOtp=Integer.parseInt(otpvalue);
                   if(otp==enterOtp){
                     try{
                             Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root", "root");
                             String sql="insert into donor value(?,?,?)";
                             PreparedStatement ps = null;
                             ps =conn.prepareStatement(sql);
                             int n=0;
                             ps.setString(1,name);
                             ps.setString(2,email);
                             ps.setString(3,phone);
                             n=ps.executeUpdate();
                             out.println("Thank you !!");
                    }
                     catch(Exception e){
                              out.print(e);
                              e.printStackTrace();
                    }
                  }
                  else{
                           out.println("Otp not matched");
                  }
          %>
    </body>
</html>
