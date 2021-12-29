<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
     <jsp:include page="../include/header.jsp"></jsp:include>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Modify</h1>
                </div>
                <form role="form" action="/board/modify" method="post">
               <div class="form-group">
               	<label>Bno</label><input class="form-control" name='bno' value='<c:out value="${board.bno }"/>'readonly="readonly">
               </div>
               <div class="form-group">
               	<label>Title</label><input class="form-control" name='title' value='<c:out value="${board.title }"/>'>
               </div>
                <div class="form-group">
               	<label>Content</label><textarea class="form-control" rows="3" name='content' ><c:out value="${board.content }"/></textarea>
               </div>
                <div class="form-group">
               	<label>Writer</label><input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
               </div>
               <div class="form-group">
               	<input class="form-control" name="regDate" value='<fmt:formatDate value="${board.regDate}" pattern="yyyy/MM/dd"/>' readonly="readonly">
               </div>
               <div class="form-group">
               	<input class="form-control" name="updateDate" value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy/MM/dd"/>' readonly="readonly">
               </div>
               <button type="submit" data-oper='modify' class="btn btn-info">Modify</button>
               <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
               <a href="list"><button type="submit" data-oper='list' class="btn btn-success" >List</button></a>              
                           </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->       
       <jsp:include page="../include/footer.jsp"></jsp:include>
      
<script type="text/javascript">
$(document).ready(function(){
	var formObj=$("form");
$('button').on("click",function(e){
	e.preventDefault();
	var operation = $(this).data("oper");
	console.log(operation);
	if(operation==='remove'){
		formObj.attr("action","/board/remove");
	}else if(operation ==='list'){
		//move to list
		formObj.attr("action","board/list").attr("method","get");
		formObj.empty();
	}
	formObj.submit();	
});
});

</script>
</body>
</html>