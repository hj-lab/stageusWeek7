<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
String id = (String)session.getAttribute("sessionId");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="indexC.css">
</head>
<body>
    <div id="showMyInfo">Welcome!</div>
    <div id="boxParent">
        <input type="button" id="box1" class="commentBox" value="Sign In" onclick="location.href='../html/login.html'">
        <input type="button" id="box2" class="commentBox" value="Yours" onclick="location.href='myInformationJ.jsp'">
        <input type="button" id="box3" class="commentBox" value="Board" onclick="location.href='../htmlmessageBoard.html'">
    </div>

    <script>

        
        var id= <%= idList %>

        var idParent = document.getElementById("showMyInfo")
        var idChild = document.createElement("span")
        
        if(id != null){
        idChild.innerHTML = +id+"!"
        idParent.appendChild(idChild)
        }

       
    </script>
</body>
</html>