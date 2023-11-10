<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");

String idValue = request.getParameter("id"); 

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

String sql = "SELECT id FROM account";
PreparedStatement query = connect.prepareStatement(sql);

ResultSet result = query.executeQuery();

ArrayList<String>idList = new ArrayList<String>();

while(result.next()){
    String id= result.getString("id");
    idList.add("\""+id+"\"");
}



%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <script>
            var idList = <%=idList%> //db의 id list
            var checkId = window.opener.document.getElementById("idValue").value
            var flag = true
            
            for(var i=0; i<idList.length; i++){
                if(idList[i] == checkId){
                    flag = false;
                    break;
                }
            }

            if(flag){
                alert("사용 가능한 id입니다.")
                window.close()
            }
            else{
                alert("중복된 id입니다.")
                window.close()
            }
            
    </script>
</body>