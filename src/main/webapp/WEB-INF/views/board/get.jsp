<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="../resources/js/reply.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Modify</h1>
		</div>
		<div class="form-group">
			<label>Bno</label><input class="form-control" name='bno'
				value='<c:out value="${board.bno }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>Title</label><input class="form-control" name='title'
				value='<c:out value="${board.title }"/>'>
		</div>
		<div class="form-group">
			<label>Content</label>
			<textarea class="form-control" rows="3" name='content'><c:out
					value="${board.content }" /></textarea>
		</div>
		<div class="form-group">
			<label>Writer</label><input class="form-control" name='writer'
				value='<c:out value="${board.writer }"/>' readonly="readonly">
		</div>
		<button data-oper='modify' class="btn btn-info">Modify</button>
		<button data-oper='list' class="btn btn-danger">List</button>
		<form id="operForm" action="/board/modify" method="get">
			<input type='hidden' id='bno' name='bno'
				value='<c:out value="${board.bno }"/>'> <input type='hidden'
				id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
			<input type='hidden' id='amount' name='amount'
				value='<c:out value="${cri.amount }"/>'> <input
				type='hidden' name='keyword' value="${cri.keyword }" /> <input
				type='hidden' name='type' value="${cri.type }" />
		</form>

	</div>
	<!-- /.panel-body -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i> Reply
			<button id='addReplyBtn' type="button"
				class="btn btn-Primary btn-xs pull-right">New Reply</button>
		</div>
		<div class="panel-body">
			
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user000</strong> <small
									class="pull-right text-muted">2021-05-18 13:13</small>
							</div>
							<p>Good Job</p>
						</div>
					</li>
				</ul>
				
		</div>	<!--/panel-body-->
		<div class="panel-footer">
		</div>	<!-- /panel-footer -->
	</div>
</div>
<!-- /.panel -->

<!-- reply modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control" name='reply'
						value='New Reply!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name='replyer'
						value='New Reply!!'>
				</div>
				<div class="form-group">
					<label>ReplyDate</label> <input class="form-control"
						name='replyDate' value='New Reply!!!'>
				</div>
				<div class="modal-footer">
					<button id='modalRegisterBtn' type="button" class="btn btn-Primary">Register</button>
					<button id='modalModBtn' type="button" class="btn btn-info">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-Danger">Remove</button>
					<button id='modalCloseBtn' type="button" class="btn btn-Secondary">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>

<script type="text/javascript">
   $(document).ready(function(){
      var operForm = $("#operForm");
      $('button[data-oper="modify"]').on("click",function(e){
         operForm.attr("action","/board/modify").submit();//컨트롤러에서 작업 수행한다
      });
      $('button[data-oper="list"]').on("click",function(e){
         operForm.find("#bno").remove(); //이전 조회 기록 삭제 
         operForm.attr("action","/board/list");// 페이지 이동 경로를 다시 설정해주는 작업이다
         operForm.submit();
      });
      console.log(replyService);
      
      //댓글 관리 영역
      var bnoValue='<c:out value="${board.bno}"/>';
      /*replyService.add(
            {reply:"JS TEST",replyer:"js tester",bno:bnoValue},//댓글 데이터
            function(result){
               alert("RESILT :" + result);
            });
      replyService.getList(
            {bno:bnoValue,page:1}
            ,function(list){
               for(var i=0,len=list.length||0 ; i<len ;i++){
                  console.log(list[i]);
               }
            });*/
      /* replyService.remove(
            7,//rno
            function(count){
               console.log(count);
               if(count ==="success"){alert("REMOVED");}
            },function(err){
               alert("error occurred");
            
            }); //제거 영역*/ 
            
      /* replyService.update({
         rno:5,
         bno:bnoValue,
         reply:"modefied reply..."
         },function(result){
            alert("수정완료");
         
      });   
      replyService.get(4,function(data){
         console.log(data);
      }); */
      
      
      var replyUL = $(".chat");
      showList(1);
      function showList(page){
         replyService.getList(
               {bno:bnoValue,page:page||1}
               ,function(replyCnt,list){
                  console.log("replyCnt:" + replyCnt);
                  console.log("list:"+list);
                  if(page==0){
                     pageNum = Math.ceil(replyCnt/10.0);
                     showList(pageNum);
                     return ;
                  }
                  
                  var str ="";
                  if(list == null || list.length == 0){
                     replyUL.html("");
                     return ;
                  }
                  for( var i=0, len= list.length ||0 ; i<len ;i++){
                     str += "<li class ='left clearfix' data-rno='"+list[i].rno+" '>";
                     str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
                     str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small><div>";
                     str += "<p>"+ list[i].reply+"</p><div></li>";
                    
                  }
                  replyUL.html(str);
                  showReplyPage(replyCnt);
               });
      }
      
      var modal = $(".modal");
      var modalInputReply = modal.find("input[name='reply']");
      var modalInputReplyer = modal.find("input[name='replyer']");
      var modalInputReplyDate = modal.find("input[name='replyDate']");
      
      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");
      var modalCloseBtn = $("#modalCloseBtn");
      
      $("#addReplyBtn").on("click",function(e){
         modal.find("input").val("");
         modalInputReplyDate.closest("div").hide();
         modal.find("button[id != 'modalCloseBtn']").hide();
         modalRegisterBtn.show();
         $(".modal").modal("show");
      });
      
      
      
      $(".chat").on("click","li",function(e){
         modalInputReplyDate.closest("div").show();
         var rno = $(this).data("rno");
         console.log(rno);
         replyService.get(rno,function(reply){
            modalInputReply.val(reply.reply);
            modalInputReplyer.val(reply.replyer);
            modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
            .attr("readonly","readonly");
            modal.data("rno",reply.rno);
            
            modal.find("button[id != 'modalCloseBtn']").hide();
            modalModBtn.show();
            modalRemoveBtn.show();
            $(".modal").modal("show");
         });
      });
      
      modalRegisterBtn.on("click",function(e){
         var reply={
               reply:modalInputReply.val(),
               replyer:modalInputReplyer.val(),
               bno:bnoValue
         };
         replyService.add(reply ,function(result){
            alert(result);
            modal.find("input").val("");
            modal.modal("hide");
            showList(0);
         });
      });
      
      
      modalModBtn.on("click",function(e){
         var reply ={rno:modal.data("rno"),reply:modalInputReply.val()};
         replyService.update(reply,function(result){
            alert(result);
            modal.modal("hide");
            showList(1);
         });
         
      });
      
      modalRemoveBtn.on("click",function(e){
         var rno = modal.data("rno");
         replyService.remove(rno,function(result){
            alert(result);
            modal.modal("hide");
            showList(1);
         });
      });
      
      modalCloseBtn.on("click",function(e){
         modal.modal("hide");
      });
      
      var pageNum = 1;
      var replyPageFooter = $(".panel-footer");
      function showReplyPage(replyCnt){
         console.log("showReplyPage : "+ replyCnt);
         var endNum = Math.ceil(pageNum/10.0)*10;
         var startNum = endNum -9;
         var prev = startNum !=1;
         var next = false;
         if(endNum * 10 >= replyCnt){endNum = Math.ceil(replyCnt/10.0);}
         if(endNum*10 < replyCnt){next = true;}
         var str ="<ul class='pagination pull-right'>";
         if(prev){
            str += "<li class='page-item'><a class='page-link' href=' "+(startNum-1)+" '>Previous</a></li> ";
         }
         for( var i = startNum ; i<=endNum ;i++){
            var active = pageNum == i ? "active ":"";
            str += "<li class='page-item "+active+" '><a class = 'page-link' href=' "+i+" '>"+i+"</a></li>";
         }
         if(next){
            str += "<li class='page-item'><a class='page-link' href=' "+(endNum-1)+" '>Next</a></li> ";
         }
         str += "</ul></div>";
         console.log(str);
         replyPageFooter.html(str);
      }
   });
</script>
<!-- 

replyService.add( { reply:"JS TEST",replyer:"js tester",bno:bnoValue
},function(result){ alert("RESULT : "+result); }); replyService.getList(
{bno:bnoValue,page:1}, function(list){ for(var i=0,len=list.length||0;i
<len
	;i++){
								console.log(list[i]);
							}
						} 
						); */

						/*
	replyService.remove(
							23,function(count){
								console.log(count);
								if(count===
	"success"){alert("REMOVED");}
							},function(err){
								alert('error
	occurred....');
							}); */

						/*
	replyService.update({
							rno:4,
							bno:bnoValue,
							reply:"modified
	reply"
						}, function(result){
							alert("수정
	완료");
						});
						
						replyService.get(4,function(data){
							console.log(data);
						})
	*/

						$('button[data-oper="modify"
	]').on(
								"click",
								function(e) {
									operForm.attr("action", "/board/modify")
											.submit();
								});
						$('button[data-oper="list"]').on("click", function(e) {
							operForm.find("#bno").remove();
							operForm.attr("action", "/board/list");
							operForm.submit();
						});
					}); -->


</body>
</html>