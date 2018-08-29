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
	        <div class="card-header">잡지 거래처 등록</div>
	        <div class="card-body">
	          <form>
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="mocm_date" name="mocm_date" class="form-control" placeholder="거래처 정보 등록일" required="required" autofocus="autofocus">
	                    <label for="mocm_date">거래처 정보 등록일</label>
	                  </div>
	                </div>
	                ~
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="macm_update" name="macm_update" class="form-control" placeholder="거래처 정보 수정일" required="required" autofocus="autofocus">
	                    <label for="macm_update">거래처 정보 수정일</label>
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
	              <div class="form-label-group">
	               <input type="text" id="com_name" name="com_name" class="form-control" placeholder="회사명" required="required" autofocus="autofocus">
	               <label for="com_name">회사명</label>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="mocm_name" name="mocm_name" class="form-control" placeholder="대표명" required="required" autofocus="autofocus">
	                    <label for="mocm_name">대표명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="mcom_tel" name="mcom_tel" class="form-control" placeholder="대표 연락처" required="required" autofocus="autofocus">
	                    <label for="mcom_tel">대표 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-label-group">
	                <input type="text" id="com_no" name="com_no" class="form-control" placeholder="사업자번호" required="required">
	                <label for="com_no">사업자번호</label>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-label-group">
	                <input type="text" id="mocm_add" name="mocm_add" class="form-control" placeholder="주소" required="required">
	                <label for="mocm_add">주소</label>
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
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_email" name="char_email" class="form-control" placeholder="담당자 이메일" required="required" autofocus="autofocus">
	                    <label for="char_email">담당자 이메일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_fax" name="char_fax" class="form-control" placeholder="담당자 Fax" required="required" autofocus="autofocus">
	                    <label for="char_fax">담당자 Fax</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_manager" name="acc_manager" class="form-control" placeholder="회계부 이름" required="required" autofocus="autofocus">
	                    <label for="acc_manager">회계부 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_tel" name="acc_tel" class="form-control" placeholder="회계부 연락처" required="required" autofocus="autofocus">
	                    <label for="acc_tel">회계부 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_email" name="acc_email" class="form-control" placeholder="회계부 이메일" required="required" autofocus="autofocus">
	                    <label for="acc_email">회계부 이메일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_fax" name="acc_fax" class="form-control" placeholder="회계부 Fax" required="required" autofocus="autofocus">
	                    <label for="acc_fax">회계부 Fax</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="rzip_code" name="rzip_code" class="form-control" placeholder="환불 우편번호" required="required" autofocus="autofocus">
	                    <label for="rzip_code">환불 우편번호</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="raddress" name="raddress" class="form-control" placeholder="환불 주소" required="required" autofocus="autofocus">
	                    <label for="raddress">환불 주소</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	             <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="bacc_bank" name="bacc_bank" class="form-control" placeholder="입금 은행명" required="required" autofocus="autofocus">
	                    <label for="bacc_bank">입금 은행명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="bacc_name" name="bacc_name" class="form-control" placeholder="예금주" required="required" autofocus="autofocus">
	                    <label for="bacc_name">예금주</label>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="bacc_accno" name="bacc_accno" class="form-control" placeholder="계좌번호" required="required" autofocus="autofocus">
	                    <label for="bacc_accno">계좌번호</label>
	                  </div>
	                </div>
	              </div>
	             </form>
	            </div>
	            <a class="btn btn-primary btn-block" id="magSubmit">등록</a>
	            <a class="btn btn-primary btn-block" id="magExit">취소</a>
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
					$("#magExit").click(function(){
						//등록버튼 누를 시 실행 : window.opener.location.reload();
	    				self.close();
	    			});
				})
			</script>  
		
	</body>
</html>