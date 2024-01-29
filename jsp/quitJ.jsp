<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");

 //세션값 불러와놓고
String sessionId = (String)session.getAttribute("sessionId");
String sessionPw = (String)session.getAttribute("sessionPw");
String sessionName = (String)session.getAttribute("sessionName");
String sessionBirth = (String)session.getAttribute("sessionBirth");
String sessionTel = (String)session.getAttribute("sessionTel");


boolean valid = true;
// 세션에서 삭제
    if(sessionId != null){ // 로그인 상태일때만 지우기
    session.removeAttribute("sessionId");
    session.removeAttribute("sessionPw");
    session.removeAttribute("sessionName");
    session.removeAttribute("sessionBirth");
    session.removeAttribute("sessionTel");

    valid = false;

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

    // 테이블에서도 삭제
    String sql = "DELETE FROM account WHERE id=?";
    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, sessionId);

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

    if(valid == true){
        alert("로그인 하십시오.")
        location.href = "../html/login.html"
    }
    else{
        alert("정상적으로 탈퇴되었습니다.")
        location.href = "../index.html"
    }
</script>
    
</body>
</html>