<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>카카오페이</title>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/css/common.min.css">
    <script src="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/js/lib/jquery.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    

<script>
$(document).ready(function(){
	Kakao.API.request({
	    url: '/v1/payment/ready',
		Authorization: 'KakaoAK {pajyng@naver.com}',
		cid: "TC0ONETIME",
		partner_order_id: 'partner_order_id',
		partner_user_id: 'partner_user_id',
		item_name: '엘르 8월호',
		quantity: '1',
		total_amount: 1000,
		vat_amount: 200,
		tax_free_amount: 0,
		approval_url: '/admin',
		fail_url: '/admin',
		cancel_url: '/',
	    success: function(res) {
	      	alert('성공');
	    },
	    fail: function(error) {
	      	alert('실패');
	    }
	  }); 
})

	</script>

</head>
<body>
</body>
</html>
