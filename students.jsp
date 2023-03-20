
<%--
    Document   : students
    Created on : Mar 20, 2023, 10:47:21 AM
    Author     : 21cse092
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td {
  border:1px solid black;
}
            </style>
    </head>
    <body>
        <center>
            <h1> STUDENTS DATABASE </h1>
            <table>
        <%
          Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/students");
          Statement st = con.createStatement(); 
          String query="SELECT count( * ) FROM students";
          ResultSet res = st.executeQuery(query);
          res.next();
                    int count = res.getInt(1);
                    out.println("<tr><td><b>The total number of students in the database :<b></td><td>"+count+"</td></tr>");
                    ResultSet res1= st.executeQuery("SELECT avg(student_id) from students");
                    res1.next();
                           double avg=res1.getDouble(1);
                           out.println("<b><br><tr><td>The average age of all students:<b></td><td>"+String.format("%.2f",avg)+"</td></tr>");
                                ResultSet res2=st.executeQuery("select department,count(student_id) as total from students group by department order by total Desc ");
                                   res2.next();
                                     int max=res2.getInt(2);
                                     out.println("<b><br><tr><td>The department with the highest number of student is:<b></td><td>"+res2.getString("department")+"</td></tr>");

        %>
        </table>
        </center>
    </body>
</html>
