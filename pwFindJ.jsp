<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");

String idValue = request.getParameter("idValue");
String nameValue = request.getParameter("nameValue"); // account table에서 3번쨰 column
String birthValue = request.getParameter("birthValue"); // 4번째 
String telValue = request.getParameter("telValue"); // 5번째

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

String sql = "SELECT * FROM account";
PreparedStatement query = connect.prepareStatement(sql);

ResultSet result = query.executeQuery();

boolean valid = false;

String pw = null;

while(result.next()){
    if( result.getString(1).equals(idValue) && result.getString(3).equals(nameValue) && result.getString(4).equals(birthValue) && result.getString(5).equals(telValue) ){
        pw = result.getString(2);
        valid = true;
    }
}

ArrayList<String> pwList = new ArrayList<String>();
pwList.add("\""+pw+"\"");


%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet">
</head>
<body>

        <script>
            var valid = <%=valid%>
            var mypw = <%=pwList%>
            

            if(valid == false){
                alert("존재하는 정보가 없습니다.")
                location.href = "login.html"
            }
            else{
                alert("당신의 password는 "+mypw+" 입니다.")
                location.href = "login.html"
            }
        </script>
    </div>
</body>
</html>