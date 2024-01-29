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
 String sessionWriter = (String)session.getAttribute("sessionWriter");
 String sessionNum = (String)session.getAttribute("sessionNum");
 

boolean valid = true;
// 세션에서 삭제

    if(sessionId == null || !sessionId.equals(sessionWriter)){
        valid = false;
    }
    else{ // 로그인 상태일때만 지우기
    session.removeAttribute("sessionNum");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

    // 테이블에서도 삭제
    String sql = "DELETE FROM board WHERE boardnum_pk=?";
    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, sessionNum);

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
        alert("로그인 하십시오. 작성자만 삭제할 수 있습니다.")
        location.href = "messageBoardJ.jsp"
    }
    else{
        // alert("삭제되었습니다.")
        location.href = "messageBoardJ.jsp"
    }
</script>
    
</body>
</html>