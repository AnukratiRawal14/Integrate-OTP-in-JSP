<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@page import=" java.net.HttpURLConnection"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Otp Processing Page</title>
    </head>
    <body>
             <%try{
                        String name=request.getParameter("name");
                        String email=request.getParameter("email");
                        String phone=request.getParameter("phone");
                        session.setAttribute("name",name);
                        session.setAttribute("email",email);
                        session.setAttribute("phone",phone);
                        String apikey="zgKhcNisyHJbEef7LwnouvSrkZBxtFld2109Mq8XIaUjQWmpOVGhTXEoxLz2bfjUtsDAde0ZpwYHvk53";
                        String sendId="FSTSMS";
                        String number = phone;
                        Random rand = new Random();
                        int otp = rand.nextInt(900000) + 100000;
                        session.setAttribute("otp",otp);
                        String message="Your OTP is:"+otp;
                                
                          //  Imp Step
                       message=URLEncoder.encode(message, "UTF-8");
                       String language="english";
                       String route="p";
                       String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apikey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;
                       
                          //Sending get request 
                       URL url=new URL(myUrl);
                       HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
                       con.setRequestMethod("GET");
                       con.setRequestProperty("User-Agent" , "Mozilla/5.0");
                       con.setRequestProperty("cache-control", "no-cache");
                       StringBuffer res=new StringBuffer();
                       BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
                       String success="Your message sent sucessfully";
                       response.sendRedirect("otpVerfication.jsp");
                       br.close();
                
                  }
                   catch(Exception e){
                          e.printStackTrace();
                  }
         %>
    </body>
</html>
