<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>  </title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
    	  
     	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
     	<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
    	<!-- 모바일 웹 페이지 설정 -->
    	<!-- 모바일 웹 페이지 설정 종료 -->

    	<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
    	<!-- [if lt IE 9] -->
        <!-- <script src="/resources/include/js/html5shiv.js"</script> -->
     	<!-- [endif] -->
     	
	    <!-- Bootstrap core CSS-->
	    <link href="/resources/include/admin/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	
	    <!-- Custom fonts for this template-->
	    <link href="/resources/include/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	    <!-- Page level plugin CSS-->
	    <link href="/resources/include/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="/resources/include/admin/css/sb-admin.min.css" rel="stylesheet">
	    
	    <!-- 사용자 추가사항 -->
	    <link href="/resources/include/admin/css/ad-add.css" rel="stylesheet">
	    <link href="/resources/include/admin/css/card-slides.css" rel="stylesheet">
		     	 		
	</head>
	<body class="bg-dark">
	    <div class="container">
	      <div class="card mx-auto mt-5">
	        <div class="card-header">택배 거래처 등록</div>
	        <div class="card-body">
	          <form>
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id=couacc_date" name="couacc_date" class="form-control" placeholder="거래처 정보 등록일" required="required" autofocus="autofocus">
	                    <label for="couacc_date">거래처 정보 등록일</label>
	                  </div>
	                </div>
	                ~
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="couacc_update" name="couacc_update" class="form-control" placeholder="거래처 정보 수정일" required="required" autofocus="autofocus">
	                    <label for="couacc_update">거래처 정보 수정일</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="startdate" name="startdate" class="form-control" placeholder="거래 시작일" required="required" autofocus="autofocus">
	                    <label for="startdate">거래 시작일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="enddate" name="enddate" class="form-control" placeholder="거래 종료일" required="required" autofocus="autofocus">
	                    <label for="enddate">거래 종료일</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_area" name="couacc_area" class="form-control" placeholder="거래 계약지역" required="required" autofocus="autofocus">
	                    <label for="couacc_area">거래 계약지역</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_cnt" name="couacc_cnt" class="form-control" placeholder="거래건수" required="required" autofocus="autofocus">
	                    <label for="couacc_cnt">거래건수</label>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_cost" name="couacc_cost" class="form-control" placeholder="건당 할인요금" required="required" autofocus="autofocus">
	                    <label for="couacc_cost">건당 할인요금</label>
	                  </div>
	               </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_name" name="couacc_name" class="form-control" placeholder="회사명" required="required" autofocus="autofocus">
	               		<label for="couacc_name">회사명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_tel" name="couacc_tel" class="form-control" placeholder="회사 연락처" required="required" autofocus="autofocus">
	                    <label for="couacc_tel">회사 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_email" name="couacc_email" class="form-control" placeholder="회사 이메일" required="required">
	                <label for="couacc_email">회사 이메일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_fax" name="couacc_fax" class="form-control" placeholder="회사 Fax" required="required">
	                <label for="couacc_fax">회사 Fax</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	             <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_manager" name="char_manager" class="form-control" placeholder="담당자 이름" required="required" autofocus="autofocus">
	                    <label for="char_manager">담당자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_tel" name="char_tel" class="form-control" placeholder="담당자 연락처" required="required" autofocus="autofocus">
	                    <label for="char_tel">담당자 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	             </form>
	            </div>
	            <a class="btn btn-primary btn-block" id="couSubmit">등록</a>	         
	            <a class="btn btn-primary btn-block" id="couExit">취소</a>	
	      </div>
	    </div>
			<!-- Bootstrap core JavaScript-->
		    <script src="/resources/include/admin/vendor/jquery/jquery.min.js"></script>
		    <script src="/resources/include/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	 	    <!-- Core plugin JavaScript-->
		    <script src="/resources/include/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
		    
		    <!-- 사용자 정의 js -->
		    <script src="/resources/include/common/js/common.js"></script>
		
			<script type="text/javascript">
				$(function(){
					$("#couExit").click(function(){
						//등록버튼 누를 시 실행 : window.opener.location.reload();
	    				self.close();
	    			});
				})
			</script>  
		
	</body>
</html>