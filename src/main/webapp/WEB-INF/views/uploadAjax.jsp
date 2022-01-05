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
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 52400000;
	function checkExtension(fileName,fileSize){
		if(fileSize>=maxSize){
			alert("파일 크기 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없음");
			return false;
		}
		return true;
	}
	for(var i=0;i<files.length;i++){
		if(!checkExtension(files[i].name,files[i].size)){
			return false;
		}
		formData.append("uploadFile",files[i])
	}
	console.log("files length : "+files.length);
	$.ajax({
		url:'/uploadAjaxAction',
		processData:false,
		contentType:false,
		data:formData,
		type:'Post',
		success:function(result){
			alert('Uploaded');
		}
	})
})

</script>
</html>