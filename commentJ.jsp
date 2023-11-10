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

    String sessionBoardNum = (String)session.getAttribute("sessionNum");
    String commentValue = request.getParameter("commentValue");
    String sessionId = (String)session.getAttribute("sessionId");

    boolean writeValid = true;

    if(sessionId == null || commentValue == null){
        writeValid = false;
    }
    else{
    String sql3 = "INSERT INTO comment(boardnum_fk, accountid_fk, contents) VALUES(?, ?, ?)";
    PreparedStatement query3 = connect.prepareStatement(sql3);

    query3.setString(1, sessionBoardNum);
    query3.setString(2, sessionId);
    query3.setString(3, commentValue);


    query3.executeUpdate();
    }


    String sql4 = "SELECT * FROM comment";
    PreparedStatement query4 = connect.prepareStatement(sql4);
    
    ResultSet result4 = query4.executeQuery();

    
    while(result4.next()){

    if(result4.getString(1).equals(sessionBoardNum) && result4.getString(3).equals(sessionId) && result4.getString(4).equals(commentValue)){
        session.setAttribute("sessionCommentNum",result4.getString(2));

    }
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

        var valid = <%= writeValid %>

        if(valid == false){
            alert("로그인 하십시오. 내용을 입력하십시오.")
            location.href = "showPostJ.jsp"
        }
        else{
        alert("댓글이 등록되었습니다.")
        location.href = "showPostJ.jsp"
        }
    </script>
</body>
</html>