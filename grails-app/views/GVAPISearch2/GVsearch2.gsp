<html>
<head>
	<title>GVAPI API: ${res["@nodeId"]}</title>
	<link rel="stylesheet" href="${resource(dir:'css', file:'main.css')}"></link>
	<link rel="stylesheet" href="${resource(dir:'css', file:'GVAPI.css')}"></link>
</head>
<body>
<h1>Thomson Reuters Gene Variant API returned the following records: </h1> <%-- ${res["@totalResults"]} --%> 
<table>
	<thead>
		<tr><th>Node</th><th>Node ID</th><th>Children</th></tr>
	</thead>
	<tbody>
		<g:set var="counter" value="${1}" />
		<g:each in="${res.Nodes.Node}" var="GV">
			<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
				<td width="40%"><a href="${createLink(action:'GVshowTarget2', id:GV['@nodeId'])}">${GV}</td>
				<%-- <td> createTable("${action:'GVshowTarget2', id:GV['@nodeId']}")  --%>
				<td>${GV['@nodeId']}</a></td>
				<td width="30%"><a href="${createLink(action:'GVshowTarget2', id:GV['@children'])}">${GV['@children']}</a></td> 
			</tr>
			<g:set var="counter" value="${counter + 1}" />
		</g:each> 	
	</tbody>
</table>
</body>
</html>