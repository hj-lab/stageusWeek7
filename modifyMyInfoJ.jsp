<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");


boolean valid = true;

String idValue = request.getParameter("idValue"); 
String pwValue = request.getParameter("pwValue");
String pwCheckValue = request.getParameter("pwCheckValue");
String nameValue = request.getParameter("nameValue");
String birthValue = request.getParameter("birthValue");
String telValue = request.getParameter("telValue");

String sessionId = (String)session.getAttribute("sessionId");

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");


if(sessionId == null){
    valid = false;
}
else{
String sql = "UPDATE account SET id=?, pw=?, name=?, birth=?, tel=? WHERE id = ?";
PreparedStatement query = connect.prepareStatement(sql);

query.setString(1, idValue);
query.setString(2, pwValue);
query.setString(3, nameValue);
query.setString(4, birthValue);
query.setString(5, telValue);
query.setString(6, sessionId);

query.executeUpdate();

session.setAttribute("sessionId", idValue);
session.setAttribute("sessionPw", pwValue);
session.setAttribute("sessionName", nameValue);
session.setAttribute("sessionBirth", birthValue);
session.setAttribute("sessionTel", telValue); 

}


%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet">
</head>
<body>

        <script>
            var valid = <%=valid%>
            
            if(valid == false){
                alert("로그인 하십시오.")
                location.href = "myInformationJ.jsp"
            }
            else{
                alert("정보가 수정되었습니다.")
                location.href = "myInformationJ.jsp "
            }
        </script>
    </div>
</body>
</html>