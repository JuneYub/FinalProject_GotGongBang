
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%
    String ctxPath = request.getContextPath();

%>   


<!DOCTYPE html>
<html>
<head>
    <title>사진 업로드 및 미리보기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 파일 선택 시 미리보기 기능
        function previewImages() {
            var preview = document.querySelector('#preview');
            var files = document.querySelector('input[type=file]').files;

            function readAndPreview(file) {
                // 파일을 읽기 위한 FileReader 객체 생성
                var reader = new FileReader();

                // 파일 로드 완료 시 미리보기 영역에 이미지 추가
                reader.onloadend = function () {
                    var img = document.createElement('img');
                    img.src = reader.result;
                    img.className = 'preview-img';
                    preview.appendChild(img);
                }

                if (file) {
                    // FileReader를 사용하여 파일 읽기
                    reader.readAsDataURL(file);
                }
            }

            if (files) {
                // 선택한 모든 파일에 대해 미리보기 생성
                [].forEach.call(files, readAndPreview);
            }
        }
    </script>
</head>
<body>
    <h1>사진 업로드 및 미리보기</h1>
    <form method="post" action="/upload" enctype="multipart/form-data">
        <input type="file" name="images" multiple onchange="previewImages()" />
        <input type="submit" value="업로드" />
    </form>
    <div id="preview"></div>
</body>
</html>