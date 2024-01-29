<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");

boolean valid = true;

String titleValue = request.getParameter("titleValue"); 
String contentValue = request.getParameter("contentValue");

String sessionId = (String)session.getAttribute("sessionId");
String sessionWriter = (String)session.getAttribute("sessionWriter");
String sessionNum = (String)session.getAttribute("sessionNum");

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

if(sessionId == null){
    valid = false;
}
else if( !sessionId.equals(sessionWriter)){
    valid = false;
}
else{
String sql = "UPDATE board SET title=?, contents=? WHERE boardnum_pk = ?";
PreparedStatement query = connect.prepareStatement(sql);

query.setString(1, titleValue);
query.setString(2, contentValue);
query.setString(3, sessionNum);

query.executeUpdate(); 

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
                alert("로그인 필요.  작성자만 수정할 수 있습니다.")
                location.href = "messageBoardJ.jsp"
            }
            else{
                // alert("정보가 수정되었습니다.")
                location.href = "messageBoardJ.jsp "
            }
        </script>
    </div>
</body>
</html>