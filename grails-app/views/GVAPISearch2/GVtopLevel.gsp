<html>
<head>
	<title>GVAPI API: ${res["@nodeId"]}</title>
	<link rel="stylesheet" href="${resource(dir:'css', file:'main.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'css', file:'GVAPI.css')}"></link>
</head>
<body>
<h1>Thomson Reuters Gene Variant API did not return any records for the search term entered, please select a search term below: </h1> <%-- ${res["@totalResults"]} --%> 
<table>
	<thead>
		<tr><th>Term</th></tr>
	</thead>
	<tbody>
		<g:set var="counter" value="${1}" />
		<g:each in="${res}" var="GVtop">
			<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
				<td width="40%"><a href="${createLink(action:'GVsearch2', params:[text:GVtop])}">${GVtop}</a></td> 
			</tr>
			<g:set var="counter" value="${counter + 1}" />
		</g:each> 	
	</tbody>
</table>
</body>
</html>