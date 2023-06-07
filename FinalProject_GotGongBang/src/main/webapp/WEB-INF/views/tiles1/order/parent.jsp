


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


<!--   <!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>썸네일 만들기</title>
  </head>
  <body>
    <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
    <div id="image_container"></div>

    <script>
      function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
          };

          console.log(image);
          reader.readAsDataURL(image);
        }
      }
    </script>
  </body>
</html> -->

<!-- <!DOCTYPE html>
<html>
<head>
    <title>Parent</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
    
    <input type="button" value="자식창 열기" onclick="openChild()">
    <br>전달할 값 : <input type="text" id="pInput"> 
    <input type="button" value="전달" onclick="setChildText()">
    
    <script type="text/javascript">
        let openWin;

        function openChild() {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("Child.jsp", "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }

        function setChildText(){
            openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
        }
    </script>
</body>
</html> -->


<%-- <!DOCTYPE html>
<html>
<head>
  <title>부모 창</title>
  <script>
    function openChildWindow() {
      // 자식 창을 열 때 데이터를 전달할 수 있습니다.
      var dataToSend = "55";
      
   		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
      var childWindow = window.open("<%= ctxPath%>/children.got", "_blank", "modal=yes");
      childWindow.dataFromParent = dataToSend; // 자식 창에 데이터를 전달합니다.
    }

    function receiveDataFromChild(data) {
      // 자식 창으로부터 데이터를 받았을 때 호출되는 함수입니다.
      alert("자식 창으로부터 받은 데이터: " + data);
    }
  </script>
</head>
<body>
  <h1>부모 창</h1>
  <button onclick="openChildWindow()">자식 창 열기</button>
</body>
</html> --%>


<!DOCTYPE html>
<html>
<head>
    <title>Parent</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
    
    <input type="button" value="자식창 열기" onclick="openChild()">
    <br>전달할 값 : <input type="text" id="pInput"> 
    <input type="button" value="전달" onclick="setChildText()">
    
    <script type="text/javascript">
        let openWin;

        function openChild() {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("Child.html", "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }

        function setChildText(){
            openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
        }
    </script>
</body>

  


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


<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%
    String ctxPath = request.getContextPath();

%>   


<!--   <!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>썸네일 만들기</title>
  </head>
  <body>
    <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
    <div id="image_container"></div>

    <script>
      function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
          };

          console.log(image);
          reader.readAsDataURL(image);
        }
      }
    </script>
  </body>
</html> -->

<!-- <!DOCTYPE html>
<html>
<head>
    <title>Parent</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
    
    <input type="button" value="자식창 열기" onclick="openChild()">
    <br>전달할 값 : <input type="text" id="pInput"> 
    <input type="button" value="전달" onclick="setChildText()">
    
    <script type="text/javascript">
        let openWin;

        function openChild() {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("Child.jsp", "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }

        function setChildText(){
            openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
        }
    </script>
</body>
</html> -->


<%-- <!DOCTYPE html>
<html>
<head>
  <title>부모 창</title>
  <script>
    function openChildWindow() {
      // 자식 창을 열 때 데이터를 전달할 수 있습니다.
      var dataToSend = "55";
      
   		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
      var childWindow = window.open("<%= ctxPath%>/children.got", "_blank", "modal=yes");
      childWindow.dataFromParent = dataToSend; // 자식 창에 데이터를 전달합니다.
    }

    function receiveDataFromChild(data) {
      // 자식 창으로부터 데이터를 받았을 때 호출되는 함수입니다.
      alert("자식 창으로부터 받은 데이터: " + data);
    }
  </script>
</head>
<body>
  <h1>부모 창</h1>
  <button onclick="openChildWindow()">자식 창 열기</button>
</body>
</html> --%>


<!DOCTYPE html>
<html>
<head>
    <title>Parent</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
    
    <input type="button" value="자식창 열기" onclick="openChild()">
    <br>전달할 값 : <input type="text" id="pInput"> 
    <input type="button" value="전달" onclick="setChildText()">
    
    <script type="text/javascript">
        let openWin;

        function openChild() {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("Child.html", "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }

        function setChildText(){
            openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
        }
    </script>
</body>


</html>