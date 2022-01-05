<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="uploadDiv">
<input type="file" name="uploadFile" multiple>
<button id="uploadBtn">Upload</button>
</div>
</body>
<script type="text/javascript">
$("#uploadBtn").on("click",function(e){
	var formData = new FormData();
	var InputFile = $("input[name='uploadFile']");
	var files = InputFile[0].files;
	console.log(files);
})

</script>
</html>