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

</head>
<body>
<h1>${res.Gene.Name[0]}</h1>

<div id="infoTabs">
	<g:if test="${res.Gene.size()}">
		<g:set var="counter" value="${1}" />
		<table>
			<thead>
				<tr><th>Assembly</th><th>Name</th><th>Organism</th><th>Reference</th><th>Title</th></tr>
			</thead>
			<tbody>
			<g:each in="${res}" var="result">
			<g:if test="${result["@title"].size() > 0}">
				<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
					<td>${result["@title"]}</td>
					<td>${result.Gene["@shortName"]}</td>
					<td>${result.Gene.Organism}</td>
					<td><a href="${result.Gene.References.Reference["@url"]}${result.Gene.References.Reference["@ref"]}">${result.Gene.References.Reference["@ref"]}</td>
					<td>${result.Gene.References.Reference["@title"]}</td>
				</tr>
				</g:if>
				<g:set var="counter" value="${counter + 1}" />
			</g:each>
			</tbody>
		</table>
	</g:if>
</div>
</body>
</html>