<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
request.setCharacterEncoding("utf-8");

String idValue = request.getParameter("id"); 
String pwValue = request.getParameter("pw");
String pwCheckValue = request.getParameter("pwCheck");
String nameValue = request.getParameter("name");
String birthValue = request.getParameter("birth");
String telValue = request.getParameter("tel");


Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

//SQL 만들기 (회원탈퇴하고싶으면 sql문만 바꿔주면됨 -> insert,update,delete 다 똑같음)
String sql = "INSERT INTO account(id, pw, name, birth, tel) VALUES(?, ?, ?, ?, ?)";
PreparedStatement query = connect.prepareStatement(sql);
// db에 전달될 sql을 보통 query라고 변수 명명함

//id는 unique, 비밀번호 제한, 생년월일은 오늘날짜보다 앞
query.setString(1, idValue);
query.setString(2, pwValue);
query.setString(3, nameValue);
query.setString(4, birthValue);
query.setString(5, telValue);
// 1번쟤,2번째 value에 - values ? ? 에 넣는거

//query 전송
query.executeUpdate();

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <script>

        // var id = <%=idValue%>
        // var pw = <%=pwValue%>
        // var name = <%=nameValue%>
        // var birth = <%=birthValue%>
        // var tel = <%=telValue%>
        alert("회원가입에 성공하였습니다.")
        location.href="../html/signUp.html"
        // console.log(id+" "+pw+" "+name+" "+birth+" "+tel)
    </script>
</body>