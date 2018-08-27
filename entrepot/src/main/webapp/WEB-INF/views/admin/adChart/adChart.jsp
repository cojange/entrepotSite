<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<!-- amCharts javascript sources -->
		<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
		<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>
		

		<!-- amCharts javascript code -->
		<script type="text/javascript">
			AmCharts.makeChart("chartdiv",
				{
					"type": "serial",
					"categoryField": "category",
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start"
					},
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[title]].[[category]]:[[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "graph 1",
							"type": "column",
							"valueField": "rawM"
						},
						{
							"balloonText": "[[title]].[[category]]:[[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-2",
							"title": "graph 2",
							"type": "column",
							"valueField": "accM"
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"stackType": "regular",
							"title": "지출(1,000)"
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": true,
						"useGraphSettings": true
					},
					"titles": [
						{
							"id": "Title-1",
							"size": 15,
							"text": "원자재 & 부자재"
						}
					],
					"dataProvider": [
						{
							"category": "aa",
							"rawM": 8,
							"accM": 5
						},
						{
							"category": "category 2",
							"rawM": 6,
							"accM": 7
						},
						{
							"category": "category 3",
							"rawM": 2,
							"accM": 3
						}
					]
				}
			);
		</script>
	</head>
	<body>
		<div class="container-fluid">
	  	 	<div class="row">
				<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
			</div>
		</div>
	</body>
</html>