<html>
<head>
	<title>GVAPI API: ${res["@name"]}</title>
	<link rel="stylesheet" href="${resource(dir:'css', file:'main.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'css', file:'GVAPI.css')}"></link>
</head>
<body>
<h1>Thomson Reuters Gene Variant API returned ${res["@totalResults"]} records: </h1>
<table>
	<thead>
		<tr><th>ID</th><th>Description</th></tr>
	</thead>
	<tbody>
		<g:set var="counter" value="${1}" />
		<g:each in="${res.SearchResults.Result}" var="GV">
			<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
				<td width="30%"><a href="${createLink(action:'GVshowTarget', id:GV.Variant['@id'])}">${GV.Variant['@id']}</a></td>
				<td>${GV.Variant}</td>
			</tr>
			<g:set var="counter" value="${counter + 1}" />
		</g:each>		
	</tbody>
</table>
</body>
</html>