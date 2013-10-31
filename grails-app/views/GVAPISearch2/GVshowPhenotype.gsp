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
<h1>Thomson Reuters Gene Variant API returned the following records for: </h1>
<h2>${res.GeneralInformation.VariantAttributes.Name}</h2>

<div id="infoTabs1" style="float: left; width: 500px;">
	<%-- <g:if test="${res["@totalResults"]}"> --%>
		<g:set var="counter" value="${1}" />
		
		<table>			
			<thead>
				<tr><th>Variants</th></tr>
			</thead>
			<tbody>
			<g:each in="${res.GeneralInformation.VariantAttributes.IntegrityTerms.Gene}" var="result">
				<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
					<td>${result}</td>
				</tr>
				<g:set var="counter" value="${counter + 1}" />
			</g:each>
			</tbody>
		</table>
</div>
<div id="infoTabs2" style="float: left; width: 500px;">		
		<g:set var="counter" value="${2}" />
		
		<table>			
			<thead>
				<tr><th>Biomarkers</th></tr>
			</thead>
			<tbody>
			<g:each in="${res.GeneralInformation.VariantAttributes.IntegrityTerms.Biomarker}" var="result">
				<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
					<td>${result}</td>
				</tr>
				<g:set var="counter" value="${counter + 1}" />
			</g:each>
			</tbody>
		</table>
</div>
<div id="infoTabs3" style="float: left; width: 200px;">
		<g:set var="counter" value="${1}" />
		
		<table>			
			<thead>
				<tr><th>References</th></tr>
			</thead>
			<tbody>
			<g:each in="${res.GeneralInformation.VariantAttributes.OmicsTerms.Gene.References.Reference}" var="result">
				<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
					<td><a href="${result["@url"]}${result["@ref"]}">${result["@title"]}</a></td>
				</tr>
				<g:set var="counter" value="${counter + 1}" />
			</g:each>
			</tbody>
		</table>
</div>
</body>
</html>