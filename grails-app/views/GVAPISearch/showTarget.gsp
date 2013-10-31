<html>
<head>
	<title>GV API: ${res.Gene.Name}</title>
	<link rel="stylesheet" href="${resource(dir:'js',file:'ext/resources/css/ext-all.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'js',file:'ext/resources/css/xtheme-gray.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'css', file:'main.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'css', file:'cortellis.css')}"></link>
	<style type="text/css">
		.x-tab-panel-body .x-panel-body {
	    	padding: 10px;
		}
	</style>
	<script type="text/javascript" src="${resource(dir:'js', file:'ext/adapter/ext/ext-base.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'ext/ext-all.js')}"></script>
	<script language="JavaScript">
		Ext.onReady(function(){
		    var tabs = new Ext.TabPanel({
		        renderTo: 'infoTabs',
		        //width: 700,
		        activeTab: 0,
				frame: false,
		        defaults :{
		            bodyPadding: 5,
					autoHeight: true
		        },
		        items: [
					<g:if test="${res.Gene.size()}">
					{
			            contentEl:'Gene', 
			            title: 'Gene'
			            //closable: true
		        	},
					</g:if>
					<g:if test="${res.Gene.Name.size()}">
					{
			            contentEl:'Name', 
			            title: 'Name'
			            //closable: true
		        	},
					</g:if>
					<g:if test="${res.Gene.Organism.size()}">
					{
						contentEl:'Organism',
						title: 'Organism'
						//closable: true
					},
					</g:if>
					<g:if test="${res.Gene.References.size()}">
					{
						contentEl:'References',
						title: 'References'
						//closable: true
					}
					</g:if>					
				]
			});
		});
	</script>
</head>
<body>
<h1>${res.Gene.Name}</h1>

<div id="infoTabs">
	<g:if test="${res.Gene.size()}">
	<div id="Gene" class="x-hide-display">
		${res.Gene["@shortName"]}
	</div>
	</g:if>
	<g:if test="${res.Gene.Organism.size()}">
	<div id="Organism" class="x-hide-display">
		<ul>
			<g:each in="${res.Gene.Organism}" var="Organism">
				<li>${Organism}</li>
			</g:each>
		</ul>
	</div>
	</g:if>
	<g:if test="${res.Gene.References.size()}">
	<div id="References" class="x-hide-display">
		<g:set var="counter" value="${1}" />
		<table>
			<thead>
				<tr><th>Reference</th><th>Title</th></tr>
			</thead>
			<tbody>
			<g:each in="${res.Gene.References}" var="References">
				<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
					<td><a href=References["@url"]>${References["@ref"]}</td>
					<td>${References["@title"]}</td>
				</tr>
				<g:set var="counter" value="${counter + 1}" />
			</g:each>
			</tbody>
		</table>
	</div>
	</g:if>
</div>

</body>
</html>