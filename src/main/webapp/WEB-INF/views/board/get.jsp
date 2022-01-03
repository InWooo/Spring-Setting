<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="../resources/js/reply.js" ></script> 
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
               <input type='hidden' id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
               <input type='hidden' id='amount' name='amount' value='<c:out value="${cri.amount }"/>'>
               <input type='hidden' name='keyword' value="${cri.keyword }"/>
			   <input type='hidden' name='type' value="${cri.type }"/>
               </form>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->       
       <jsp:include page="../include/footer.jsp"></jsp:include>
      
      <script >
      $(document).ready(function(){
    	  console.log(replyService);
    	  var operForm = $("#operForm");
    	  var bnoValue='<c:out value="${board.bno}"/>';
    	  
    	  replyService.add(
    		{
    			reply:"JS TEST",replyer:"js tester",bno:bnoValue
    		},function(result){
    			alert("RESULT : "+result);
    		});
    	  
    	  replyService.getList(
    		{bno:bnoValue,page:1},
    		function(list){
    			for(var i=0,len=list.length||0;i<len;i++){
    				console.log(list[i]);
    			}
    		});
    	  
    	 /*  replyService.remove(
    			23,function(count){
    				console.log(count);
    				if(count==="success"){alert("REMOVED");}
    			},function(err){
    				alert('error occurred....');
    			}); */
    			
    			replyService.update({
    				rno:4,
    				bno:bnoValue,
    				reply:"modified reply"
    			}, function(result){
    				alert("수정 완료");
    			});
    			
    			replyService.get(4,function(data){
    				console.log(data);
    			})
    		
    	  
     $('button[data-oper="modify"]').on("click",function(e){
    	  operForm.attr("action","/board/modify").submit();
      });
      $('button[data-oper="list"]').on("click",function(e){
    	  operForm.find("#bno").remove();
    	  operForm.attr("action","/board/list");
    	  operForm.submit();
      });
      });
      </script>

</body>
</html>