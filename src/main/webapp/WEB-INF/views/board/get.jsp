<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <jsp:include page="../include/header.jsp"></jsp:include>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Modify</h1>
                </div>
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
               <button data-oper='modify' class="btn btn-info">Modify</button>
               <button data-oper='list' class="btn btn-danger" >List</button>
               <form id="operForm" action="/board/modify" method="get">
               <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
               </form>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->       
       <jsp:include page="../include/footer.jsp"></jsp:include>
      
      <script>
      $(document).ready(function(){
    	  var operForm = $("#operForm");
     $('button[data-oper="modify"]').on("click",function(e){
    	  operForm.attr("action","/board/modify").submit();
      });
      $('button[data-oper="list"]').on("click",function(e){
    	  operForm.fine("#bno").remove();
    	  operForm.attr("action","/board/list");
    	  operForm.submit();
      });
      });
      </script>

</body>
</html>