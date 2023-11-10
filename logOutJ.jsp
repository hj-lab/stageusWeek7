<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%

String id = (String)session.getAttribute("sessionId");
boolean valid = true;
    if(id != null){
    session.removeAttribute("sessionId");
    session.removeAttribute("sessionPw");
    session.removeAttribute("sessionName");
    session.removeAttribute("sessionBirth");
    session.removeAttribute("sessionTel");
    valid = false;
    }
    //response.sendRedirect("login.html");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <script>
        var valid = <%= valid %>

        if(valid == true){ // id가 비어있으면 = 로그인 안한것
            alert("로그인 하십시오.")
            location.href="index.html"
        }
        else{
            alert("로그아웃 되었습니다.")
            location.href="index.html"
        }
    </script>
</body>
</html>