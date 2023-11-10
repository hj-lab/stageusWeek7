<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%

request.setCharacterEncoding("utf-8");

ArrayList<String> numList = new ArrayList<String>();
ArrayList<String> titleList = new ArrayList<String>();
ArrayList<String> writerList = new ArrayList<String>();
ArrayList<String> dateList = new ArrayList<String>();

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

String sql = "SELECT boardnum_pk, title, accountid_fk, createAt FROM board";
PreparedStatement query = connect.prepareStatement(sql);
ResultSet result = query.executeQuery();

while(result.next()){ 
    String num = result.getString(1);
    String title = result.getString(2);
    String writer = result.getString(3);
    String date = result.getString(4);

    numList.add("\""+num+"\""); 
    titleList.add("\""+title+"\""); 
    writerList.add("\""+writer+"\""); 
    dateList.add("\""+date+"\""); 

}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="messageBoardC.css">
</head>
<body>
    <div>
        <input type="button" id="GoMain" value="Main" onclick="location.href='index.html'">
    </div>
    <div id="messageBoardParent">
        <div id="messageBoardComment">Message Board</div>
        
        <div id="writeBtnParent">
            <input type="button" id="writeBtn" value="글쓰기" onclick="location.href='write.html'">
        </div>

        <table id="boardList">
        <thread> <!-- 1행 -->
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>날짜</td>
        </thread>
        <tbody>
            
        </tbody>
    
    </div>

    <script>
        var numList = <%=numList%>
        var titleList = <%=titleList%>
        var writerList = <%=writerList%>
        var dateList = <%=dateList%>

        var tableParent = document.getElementById("boardList")

        console.log(numList+"작성자list: "+writerList)

        for(var i=0; i<numList.length; i++){
            var newRow = tableParent.insertRow() // 행 1개 추가

            var newCell1 = newRow.insertCell(0) // 열 4개 추가
            var newCell2 = newRow.insertCell(1)
            var newCell3 = newRow.insertCell(2)
            var newCell4 = newRow.insertCell(3)

            newCell1.innerHTML = numList[i]
            newCell2.innerHTML = titleList[i]
            newCell3.innerHTML = writerList[i]
            newCell4.innerHTML = dateList[i]

           // var numValue = numList[i]
            newRow.setAttribute("data-num", numList[i])
            newRow.setAttribute("data-writer", writerList[i])

            
            newRow.onclick = function(numValue){
            var numValue = this.getAttribute("data-num")
			var writerValue = this.getAttribute("data-writer")
            location.href = "sessionSaveJ.jsp?num="+numValue+"&writer="+writerValue
		    }
        }

    </script>
    
</body>
</html>