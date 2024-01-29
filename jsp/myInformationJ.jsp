<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
String id = (String)session.getAttribute("sessionId");
String name = (String)session.getAttribute("sessionName");
String birth = (String)session.getAttribute("sessionBirth");
String tel = (String)session.getAttribute("sessionTel");

ArrayList<String> idList = new ArrayList<String>();
ArrayList<String> nameList = new ArrayList<String>();
ArrayList<String> birthList = new ArrayList<String>();
ArrayList<String> telList = new ArrayList<String>();
idList.add("\""+id+"\"");
nameList.add("\""+name+"\"");
birthList.add("\""+birth+"\"");
telList.add("\""+tel+"\"");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="../css/myInformationC.css">
</head>
<body>
    <div>
        <input type="button" id="GoMain" value="Main" onclick="location.href='../index.html'">
    </div>
    <div id="informationParent">
        <h1 id="InformationComment">My Information</h1>
        <div id="myInformation">
            <div id="id">
                id : 
            </div>
            <div id="name">이름 :  </div>
            <div id="birth">생년월일 :  </div>
            <div id="tel">전화번호 :  </div>
        </div>

        <div id="myinformationMore">
            <input type="button" class="myinformationMoreBtn" value="정보 수정하기" onclick="location.href='../html/modifyMyInfo.html'">
            <input type="button" class="myinformationMoreBtn" value="회원 탈퇴" onclick="location.href='../html/quit.html'">
        </div>
    
    </div>

    <script>
        var id = <%= idList %>
        var name = <%= nameList %>
        var birth = <%= birthList %>
        var tel = <%= telList %>

        // 근데 왜 이거 안됨?
        if(!id || id=="" || id == undefined || id == null){
            alert("로그인 하십시오.")
            console.log("id가 null이다.")
            location.href = "../index.html"
        }

        var idParent = document.getElementById("id")
        var idChild = document.createElement("span")
        idChild.innerHTML = id
        idParent.appendChild(idChild)

        var nameParent = document.getElementById("name")
        var nameChild = document.createElement("span")
        nameChild.innerHTML = name
        nameParent.appendChild(nameChild)

        var birthParent = document.getElementById("birth")
        var birthChild = document.createElement("span")
        birthChild.innerHTML = birth
        birthParent.appendChild(birthChild)

        var telParent = document.getElementById("tel")
        var telChild = document.createElement("span")
        telChild.innerHTML = tel
        telParent.appendChild(telChild)


    </script>
</body>
</html>