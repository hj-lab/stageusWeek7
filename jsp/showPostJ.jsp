<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("utf-8");

    // boardNum이랑 같은 번호를 가진 글을 board에서 불러와서 보여주기
    //String boardNum = request.getParameter("num");
   // String writer = request.getParameter("writer");
    
   // session.setAttribute("sessionNum", boardNum);
    //session.setAttribute("sessionWriter", writer);

    String id = (String)session.getAttribute("sessionId");
    String boardNum = (String)session.getAttribute("sessionNum");
    String sessionWriter = (String)session.getAttribute("sessionWriter");

    boolean valid = true;

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/page","heeju","1234");

    String sql = "SELECT boardnum_pk, title, accountid_fk, contents, createAt FROM board WHERE boardnum_pk = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, boardNum);  

    ResultSet result = query.executeQuery();

    String number = null;
    String title = null;
    String accountid = null;
    String contents = null;
    String createAt = null;

    while(result.next()){
        number = result.getString(1);
        title = result.getString(2);
        accountid = result.getString(3);
        contents = result.getString(4); 
        createAt = result.getString(5);
    }

    ArrayList<String> numberList = new ArrayList<String>();
   numberList.add("\""+number+"\"");

    ArrayList<String> titleList = new ArrayList<String>();
        titleList.add("\""+title+"\"");

    ArrayList<String> accountList = new ArrayList<String>();
        accountList.add("\""+accountid+"\"");

    ArrayList<String> contentsList = new ArrayList<String>();
        contentsList.add("\""+contents+"\"");

    ArrayList<String> createList = new ArrayList<String>();
        createList.add("\""+createAt+"\"");

    // △ 여기까지가 게시글 관련

    // ▽ 댓글 보여주기
    
    String sql2 = "SELECT commentnum_pk, accountid_fk, contents, createAt FROM comment WHERE boardnum_fk=?";
    PreparedStatement query2 = connect.prepareStatement(sql2);
    query2.setString(1, boardNum);  
    ResultSet result2 = query2.executeQuery();

    
    ArrayList<String> commentNumList = new ArrayList<String>();
    ArrayList<String> commentWriterList = new ArrayList<String>();
    ArrayList<String> commentContentsList = new ArrayList<String>();
    ArrayList<String> commentDateList = new ArrayList<String>();
     
    String commentNum = null;
    String commentWriter = null;
    String commentContents = null;
    String commentDate = null;

    while(result2.next()){ 
        commentNum = result2.getString(1);
        commentWriter = result2.getString(2);
        commentContents = result2.getString(3);
        commentDate = result2.getString(4);
    
        commentNumList.add("\""+commentNum+"\""); 
        commentWriterList.add("\""+commentWriter+"\""); 
        commentContentsList.add("\""+commentContents+"\""); 
        commentDateList.add("\""+commentDate+"\""); 
    
    }


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="../css/showPostC.css">

</head>
<body>
    <div>
        <input type="button" id="GoMain" value="Main" onclick="location.href='../index.html'">
    </div>
    
    <div id="showPostParent">
        <div id="post">
            <h1 id="postTitle"></h1>
            <div id="postInform">
                <div id="postId"></div>
                <div id="postDate"></div>
                <div id="rightBtn">
                    <input type="button" value="수정" id="transformBtn" onclick="location.href='../html/modifyPost.html'">
                    <input type="button" value="삭제" id="transformBtn" onclick="location.href='../html/delPost.html'">
                </div>
            </div>
            <div id="postContent" ></div>
        </div>

        <form id="comment" action="commentJ.jsp"> 
            <textarea name="commentValue" id="commentIn" placeholder="댓글을 입력하세요"></textarea>
            <input type="submit" id="commentBtn" value="댓글달기" >
        </form>


        <table id="commentList">
        
               
                

      
    </div>

    <script>
        // 게시글 자세히보기
        var number = <%=numberList%>
        var title = <%=titleList%>
        var accountid = <%=accountList%>
        var contents= <%=contentsList%>
        var createAt = <%=createList%>


        var boardNum = <%=boardNum%>
        console.log("boardNum : "+boardNum)

        var titleParent = document.getElementById("postTitle")
        var idParent = document.getElementById("postId")
        var contentsParent = document.getElementById("postContent")
        var createParent = document.getElementById("postDate")

        titleParent.innerHTML = title
        idParent.innerHTML = "작성자 : "+accountid
        contentsParent.innerHTML = contents
        createParent.innerHTML = "날짜 : "+createAt


        // 댓글 작성할때
        var commentNumList = <%=commentNumList%>
        var commentWriterList = <%=commentWriterList%>
        var commentContentsList = <%=commentContentsList%>
        var commentDateList = <%=commentDateList%>

        var commentParent = document.getElementById("commentList")

        for(var i=0; i<commentNumList.length; i++){
            var newRow = commentParent.insertRow()

            var newCell1 = newRow.insertCell(0) // 열 4개 추가
            var newCell2 = newRow.insertCell(1)
            var newCell3 = newRow.insertCell(2)
            var newCell4 = newRow.insertCell(3)

            var newCell5 = newRow.insertCell(4)
            var newCell6 = newRow.insertCell(5)

            newCell1.innerHTML = commentNumList[i]
            newCell2.innerHTML = commentWriterList[i]
            newCell3.innerHTML = commentContentsList[i]
            newCell4.innerHTML = commentDateList[i]

            var modifyBtn = document.createElement("input")
            modifyBtn.type = "button"
            modifyBtn.value = "수정"
            modifyBtn.onclick = function(){
                location.href = '../html/modifyComment.html'
            }
            
            newCell5.appendChild(modifyBtn)

            var delBtn = document.createElement("input")
            delBtn.type = "button"
            delBtn.value = "삭제"
            delBtn.onclick = function(){
                location.href = '../html/delComment.html'
            }
            
            newCell5.appendChild(delBtn)
         
        }


        // 댓글 작성하고 나서
       
    </script>
</body>
</html>