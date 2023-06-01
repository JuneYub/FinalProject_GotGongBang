
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%
    String ctxPath = request.getContextPath();

%>   

<!-- <!DOCTYPE html>
<html>
<head>
    <title>Child</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
 
    <input type="text" id="cInput"><br><br>
    <input type="button" value="창닫기" onclick="window.close()">
</body>
</html> -->

<!-- <!DOCTYPE html>
<html>
<head>
  <title>자식 창</title>
  <script>
    window.onload = function() {
      // 부모 창으로부터 데이터를 받습니다.
      var dataReceived = window.opener.dataFromParent;
      window.opener.receiveDataFromChild(dataReceived); // 부모 창에 데이터를 전달합니다.
    }
  </script>
</head>
<body>
  <h1>자식 창</h1>
  <p>부모 창에서 전달받은 데이터를 사용합니다.</p>
</body>
</html> -->


<!DOCTYPE html>
<html>
<head>
    <title>Child</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
 
    <input type="text" id="cInput"><br><br>
    <input type="button" value="창닫기" onclick="window.close()">
</body>
</html>