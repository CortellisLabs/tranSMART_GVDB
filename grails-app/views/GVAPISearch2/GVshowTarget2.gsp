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
<h1>Thomson Reuters Gene Variant API returned ${res["@totalResults"]} records:</h1>

<div id="infoTabs">
	<%-- <g:if test="${res["@totalResults"]}"> --%>
		<g:set var="counter" value="${1}" />
		<table>
			<thead>
				<tr><th>Variant</th><%--<th>Result ID</th>--%><th>Disease</th><th>Drug</th><th>Drug Type</th></tr>
			</thead>
			<tbody>
			<g:each in="${res.SearchResults.Result}" var="result">
			<g:if test="${result.Drug.size()}">
				<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
					<td><a href="${createLink(action:'GVpheno', id:result["@id"])}">${result.Variant}></a></td>
					<td>${result["@id"]}</td>
					<td>${result.Disease}</td>
					<td>${result.Drug}</td>
					<td>${result.Drug["@type"]}</td>
				</tr>
				<</g:if> 
				<g:set var="counter" value="${counter + 1}" />
			</g:each>
			</tbody>
		</table>
	<%-- </g:if> --%>
</div>
</body>
</html>