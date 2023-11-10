<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");

String idValue = request.getParameter("idValue"); 
String pwValue = request.getParameter("pwValue");
//login.html에서 내가 입력한 id, pw값 받아옴

// 예외처리 필요 !!!!!!!!

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

String sql = "SELECT * FROM account";
PreparedStatement query = connect.prepareStatement(sql);

ResultSet result = query.executeQuery();

boolean valid = false;

// if(result.next()) 로 바꾸자
while(result.next()){
    if(result.getString(1).equals(idValue) && result.getString(2).equals(pwValue)){
        valid = true;
        session.setAttribute("sessionId", idValue);
        session.setAttribute("sessionPw", pwValue);
        session.setAttribute("sessionName", result.getString(3));
        session.setAttribute("sessionBirth", result.getString(4));
        session.setAttribute("sessionTel", result.getString(5));  
    }
        
}

String id = (String)session.getAttribute("sessionId");
ArrayList<String> idList = new ArrayList<String>();
idList.add("\""+id+"\"");

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <script>
        var valid = <%= valid %>
        var id = <%= idList %>
        if(valid == false){
            alert("일치하는 로그인 정보가 없습니다.")
            location.href = "index.html"
        }
        else{
            alert(id+"님, 반갑습니다.")
            location.href="index.html"
        }
        
    </script>
</body>