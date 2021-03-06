<html>
<head>
	<title>GVAPI API</title>
	<link rel="stylesheet" href="${resource(dir:'css', file:'main.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'css', file:'cortellis.css')}"></link>
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">
		google.load('visualization', '1.1', {packages: ['controls','corechart']});
		function drawVisualization() {

			var data = google.visualization.arrayToDataTable([
				['Variant', 'Type', 'Disease', 'Drug Name', 'Variant Name'],
				<g:each in="${res.SearchResults.Result}" var="GV">
					['<a href="${createLink(action:'GVpheno', params:[id:GV["@id"], Vid:GV.Variant["@id"]])}">${GV.Variant.toString().replace('\'','')}</a>', 
							'${GV["@type"]}','${GV.Disease}','${GV.Drug}','${GV.Variant.toString().replace('\'','')}'],
				</g:each>
			]);

			var categoryPicker1 = new google.visualization.ControlWrapper({
				'controlType': 'CategoryFilter',
				'containerId': 'control1',
				'options': {
					'filterColumnLabel': 'Type',
					'ui': {
						'labelStacking': 'vertical',
						'allowTyping': true,
						'allowMultiple': true
					}
				}
			});


			var categoryPicker2 = new google.visualization.ControlWrapper({
				'controlType': 'CategoryFilter',
				'containerId': 'control2',
				'options': {
					'filterColumnLabel': 'Disease',
					'ui': {
						'labelStacking': 'vertical',
						'allowTyping': true,
						'allowMultiple': true
					}
				}
			});      

			var categoryPicker3 = new google.visualization.ControlWrapper({
				'controlType': 'CategoryFilter',
				'containerId': 'control3',
				'options': {
					'filterColumnLabel': 'Variant Name',
					'ui': {
						'labelStacking': 'vertical',
						'allowTyping': true,
						'allowMultiple': true
					}
				}
			  }); 

			var categoryPicker4 = new google.visualization.ControlWrapper({
				'controlType': 'CategoryFilter',
				'containerId': 'control4',
				'options': {
					'filterColumnLabel': 'Drug Name',
					'ui': {
						'labelStacking': 'vertical',
						'allowTyping': true,
						'allowMultiple': true
					}
				}
			  }); 

			var table = new google.visualization.ChartWrapper({
				'chartType': 'Table',
				'containerId': 'table',
				'options': {
					'allowHtml': true, 'showRowNumber': true, 'page': 'enable', 'pageSize': 10, width: '1050px'
				},
				'view': {'columns': [0,1,2,3]}
			});

			new google.visualization.Dashboard(document.getElementById('dashboard')).
			bind([categoryPicker1, categoryPicker2, categoryPicker3, categoryPicker4], [table]).
			draw(data);
		}        
		google.setOnLoadCallback(drawVisualization);

    		<g:each in="${res.Filters.Filter}" var="filter">
    	
    			<g:if test="${filter['@name']=='diseaseId'}">

					function drawVisualization2() {
	   				var data = google.visualization.arrayToDataTable([
	     				['Disease', 'Variants'],
	     				<g:each in="${filter.FilterOption}" var="option" status="i">
							<g:if test="${(i < 5)}">
								['${option['@label']}',${option['@count']}],
							</g:if>          					       								
						</g:each>
	     
	   				]);
	
	    				new google.visualization.ColumnChart(document.getElementById('bar2')).
	       				draw(data, {title:"Disease", width:600, height:300, legend:{position: 'none'}});
	 				}
	
	 				google.setOnLoadCallback(drawVisualization2);
				</g:if>
				
    			<g:if test="${filter['@name']=='recordType'}">

     				function drawVisualization3() {
       	
       				var data = google.visualization.arrayToDataTable([
         				['Type', 'Variants'],
         				<g:each in="${filter.FilterOption}" var="option" status="j">
	         				<g:if test="${(j < 3)}">
	       	  					['${option['@label']}',${option['@count']}],
	       	  				</g:if>
 						</g:each>
              		]);
      					new google.visualization.ColumnChart(document.getElementById('bar1')).
           				draw(data, {title:"Type", width:300, height:300,  legend:{position: 'none'}, colors:['red']});
     				}
     				
     				google.setOnLoadCallback(drawVisualization3);
				</g:if>

				<g:if test="${filter['@name']=='drugIdDrugType'}">

 				function drawVisualization4() {
   	
   				var data = google.visualization.arrayToDataTable([
     				['Type', 'Variants'],
     				<g:each in="${filter.FilterOption}" var="option" status="k">
         				<g:if test="${(k < 5)}">
       	  					['${option['@label']}',${option['@count']}],
       	  				</g:if>
						</g:each>
          		]);
  					new google.visualization.ColumnChart(document.getElementById('bar3')).
       				draw(data, {title:"Drug", width:600, height:300,  legend:{position: 'none'}, colors:['green']});
 				}
 				
 				google.setOnLoadCallback(drawVisualization4);
				</g:if>				
							
		</g:each>
	</script>	
</head>
<body>
<h1>Thomson Reuters Gene Variant API returned ${res["@totalResults"]} records:</h1>

<div id="bar1" style="float: left; width: 230px; height: 300px;"></div>
<div id="bar2" style="float: left; width: 525px; height: 300px;"></div>
<div id="bar3" style="float: left; width: 525px; height: 300px;"></div>

<div id="dashboard" style="clear: both;">
	<table>
        	<tr style='vertical-align: top'>
          		<td style='width: 150px; font-size: 0.7em;'>
            			<div id="control1"></div>
            			<BR><BR>
            			<div id="control2"></div>
            			<BR><BR>
            			<div id="control3"></div>
						<BR><BR>
            			<div id="control4"></div>
          		</td>
          		<td style='width: 1050px; font-size: 0.7em;'>
            			<div style="float: left;" id="table"></div>
          		</td>
        	</tr>
      	</table>
</div>



</body>
</html>