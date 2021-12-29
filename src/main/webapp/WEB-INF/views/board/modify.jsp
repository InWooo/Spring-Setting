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
               <div class="form-group">
               	<label>regDate</label><input class="form-control" name='writer' value='<c:out value="${board.regDate }"/>' readonly="readonly">
               </div>
               <div class="form-group">
               	<label>updateDate</label><input class="form-control" name='writer' value='<c:out value="${board.updateDate }"/>' readonly="readonly">
               </div>
               <button data-oper='modify' onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'" type="submit" class="btn btn-default">Modify</button>
               <a href="list"><button type="reset" class="btn btn-default" >List</button></a>              
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->       
       <jsp:include page="../include/footer.jsp"></jsp:include>
      

</body>
</html>