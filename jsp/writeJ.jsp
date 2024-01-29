<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
request.setCharacterEncoding("utf-8");

String titleValue = request.getParameter("titleValue"); 
String contentValue = request.getParameter("contentValue");

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

String id = (String)session.getAttribute("sessionId");
boolean valid = true;

if(id != null){ //로그인 상태라면
String sql = "INSERT INTO board(title, accountid_fk, contents) VALUES(?, ?, ?)";
PreparedStatement query = connect.prepareStatement(sql);

query.setString(1, titleValue);
query.setString(2, id);
query.setString(3, contentValue);

query.executeUpdate();

valid = false; 
}

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <script>
        var valid = <%=valid%>

        if(valid == true){
            alert("로그인 해야 글을 작성할 수 있습니다.")
            location.href = "../html/login.html"
        }
        else{
            // alert("글을 작성하였습니다.")
            location.href = "messageBoardJ.jsp"
        }

    </script>
</body>