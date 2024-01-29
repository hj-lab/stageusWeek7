session.setAttribute("sessionCommentNum", commentNum);

<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

String modifyComment = request.getParameter("modifyCommentValue"); 
String sessionCommentNum = (String)session.getAttribute("sessionCommentNum");
String sessionId = (String)session.getAttribute("sessionId");

boolean valid = true;

if(sessionId == null){
    valid = false;
}
else{
String sql = "UPDATE comment SET contents=? WHERE commentnum_pk = ? ";
PreparedStatement query = connect.prepareStatement(sql);

query.setString(1,modifyComment);
query.setString(2,sessionCommentNum);

query.executeUpdate();
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var valid = <%=valid%>

        if(valid == false){
            alert("로그인 하십시오. ")
            location.href = "showPostJ.jsp"
        }
        else{
            alert("수정되었습니다.")
            location.href = "showPostJ.jsp"
        }
        
    </script>
</body>
</html>