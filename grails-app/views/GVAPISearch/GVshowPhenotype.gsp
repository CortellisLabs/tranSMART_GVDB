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
					{
			            contentEl:'WildTypeInfo', 
			            title: 'Wild Type Info'
			            //closable: true
		        	},
					{
			            contentEl:'VariantAttributes',
			            title: 'Variant Attributes'
			            //closable: true
		        	},
		        	<g:if test="${res.GeneralInformation.DrugAttributes.size()}">
					{
			            contentEl:'DrugAttributes',
			            title: 'Drug Attributes'
			            //closable: true
		        	},
		        	</g:if>
		        	<g:if test="${res.GeneralInformation.DiseaseAttributes.size()}">
		        	{
			            contentEl:'DiseaseAttributes',
			            title: 'Disease Attributes'
			            //closable: true
		        	},
		        	</g:if>
		        	{
			            contentEl:'Associations',
			            title: 'Associations'
			            //closable: true
		        	}
				]
			});
		});
	</script>
	
</head>


<body>
<h1>Thomson Reuters Gene Variant API returned the following records for: </h1>
<h1>${res.GeneralInformation.VariantAttributes.Name}</h1>

<g:set var="recordID" value = "${res["@recordId"]}.toString()" />
<div id="infoTabs" style="float: left; width: 1500px;">
	<div id="WildTypeInfo" class="x-hide-display">
		<div id="WTDesc">
			<g:set var="counter" value="${1}" />
				<table>
				<caption align="top" style="color:#ff9100">${res2.WTGeneAttributes.Assembly.Gene.Name[0]}</caption>			
					<thead>
						<tr><th>ShortName</th><th>Organism</th><th>Description</th><th>References</th></tr>
					</thead>
					<tbody>
					<g:each in="${res2.WTGeneAttributes.Assembly.Gene[0]}" var="result">
						 <tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result["@shortName"]}</td>
							<td>${result.Organism}</td>
							<td>${result.Description}</td>
							<td><g:each in="${result.References.Reference}" var="ref">
									<a href="${ref["@url"]}${ref["@ref"]}">${ref["@title"]}</a></br></g:each></td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
					</tbody>
				</table>
			</br>
		</div>
		<div id="WTRelations">
			<g:set var="counter" value="${1}" />
				<table>
				<caption align="top" style="color:#ff9100">Wild Type Relations</caption>			
					<thead>
						<tr><th>Processes</th><th>Localizations</th><th>Mol Functions</th><th>Tissues</th><th>Fluids</th><th>Cell Lines</th></tr>
					</thead>
					<tbody>
					<g:each in="${res2.Relations.Gene}" var="result">
						 <tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td><g:each in="${result.Processes.Process}" var="proc">${proc}</br></g:each></td>
							<td><g:each in="${result.Localizations.Localization}" var="loc">${loc}</br></g:each></td>
							<td><g:each in="${result.MolFunctions.MolFunction}" var="mol">${mol}</br></g:each></td>
							<td><g:each in="${result.Tissues.Tissue}" var="tissue">${tissue}</br></g:each></td>
							<td><g:each in="${result.Fluids.Fluid}" var="fluid">${fluid}</br></g:each></td>
							<td><g:each in="${result.CellLines.CellLine}" var="cell">${cell}</br></g:each></td>									
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
					</tbody>
				</table>							
		</div>
	</div>	
	<div id="VariantAttributes" class="x-hide-display">
		<div id="Allele">
			<g:set var="counter" value="${1}" />
			<table>
				<thead>
					<tr><th>Allele</th></tr>
				</thead>		
				<tbody>
					<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
						<td>${res.GeneralInformation.VariantAttributes.SNPs.SNP.Allele}</td>
					</tr>
					<g:set var="counter" value="${counter + 1}" />
				</tbody>
			</table>
			</br>
		</div>
		<div id="Gene Location" style="float: left; width: 1000px;">
			<g:set var="counter" value="${1}" />
			<table title="${res.GeneralInformation.VariantAttributes.SNPs.SNP.SnpData.Assembly["@title"] }">
				<thead>
					<tr><th>Assembly</th><th>Chromosome</th><th>Strand</th><th>Start Position</th><th>End Position</th><th>Functional Class</th></tr>
				</thead>		
				<tbody>
					<g:each in="${res.GeneralInformation.VariantAttributes.SNPs.SNP.SnpData.Assembly}" var="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result["@title"]}</td>
							<td>${result.GenomeLocation.Chromosome}</td>
							<td>${result.GenomeLocation.Strand}</td>
							<td>${result.GenomeLocation.StartPosition}</td>
							<td>${result.GenomeLocation.EndPosition}</td>
							<td>${result.GeneInformation.FunctionalClass}</td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />	
					</g:each>		
				</tbody>
			</table>
			</br>
		</div>
		<div id="VariantAttributes">
			<g:set var="counter" value="${1}" />
			<table>
				<thead>
					<tr><th>Zygosity</th><th>Type</th><th>Description</th><th>Synonyms</th><th>References</th><th>Short Name</th></tr>
				</thead>		
				<tbody>
					<g:each in="${res.GeneralInformation.VariantAttributes}" var ="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result.Zygosity}</td>
							<td>${result.Type}</td>
							<td>${result.Description}</td>
							<td><g:each in="${result.Synonyms.Synonym}" var="syn">
									${syn}</br></g:each></td>
							<td><g:each in="${result.References.Reference}" var="ref">
									<a href="${ref["@url"]}${ref["@ref"]}">${ref["@title"]}</a></br></g:each></td>
							<td>${result.Gene["@shortName"]}</td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
				</tbody>
			</table>
			<br>
		</div>	
		<div id="VarSynonyms" style="float: left; width: 500px;">
			<%-- <g:if test="${res["@totalResults"]}"> --%>
				<g:set var="counter" value="${2}" />				
				<table>			
					<thead>
						<tr><th>Variant Synonyms</th></tr>
					</thead>
					<tbody>
					<g:each in="${res.GeneralInformation.VariantAttributes.Synonyms.Synonym}" var="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result}</td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
					</tbody>
				</table> 
				</br>
		</div>
		<div id="SNPSynonyms" style="float: left; width: 500px;">
				<g:set var="counter" value="${1}" />				
				<table>			
					<thead>
						<tr><th>SNP Synonyms</th></tr>
					</thead>
					<tbody>
					<g:each in="${res.GeneralInformation.VariantAttributes.SNPs.SNP.Synonyms.Synonym}" var="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result}</td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
					</tbody>
				</table>
				</br>
		</div>
		<div id="SNPReferences" style="float: left; width: 200px;">		
				<g:set var="counter" value="${2}" />
				
				<table>			
					<thead>
						<tr><th>SNP References</th></tr>
					</thead>
					<tbody>
					<g:each in="${res.GeneralInformation.VariantAttributes.SNPs.SNP.References.Reference}" var="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td><a href="${result["@url"]}${result["@ref"]}">${result["@title"]}</a></td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
					</tbody>
				</table>
				</br>
		</div>
	</div>
	<div id="DrugAttributes" class="x-hide-display">
		<div id="DrugAtt">
			<g:set var="counter" value="${1}" />
			<table>
			<caption align="top" style="color:#ff9100">Drug Attributes - ${res.GeneralInformation.DrugAttributes["@type"]}</caption> 
				<thead>
					<tr><th>Name</th><th>Synonym</th><th>Mechanisms-Cellular</th><th>Mechanisms-Molecular</th><th>Product Categories</th><th>Therapeutic Groups</th></tr>
				</thead>		
				<tbody>
					<g:each in="${res.GeneralInformation.DrugAttributes}" var ="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result.Name}</td>
							<td><g:each in="${result.Synonyms.Synonym}" var="syn">${syn}</br></g:each></td>
							<td><g:each in="${result.MechanismOfAction.MechanismsCellular.MechanismCellular}" var="mechcell">
								${mechcell}</br></g:each></td>
							<td><g:each in="${result.MechanismOfAction.MechanismsMolecular.MechanismMolecular}" var="mechmole">
								${mechmole}</br></g:each></td>
							<td><g:each in="${result.ProductCategories.Category}" var="cat">
								${cat}</br></g:each></td>
							<td><g:each in="${result.TherapeuticGroups.TherapeuticGroup}" var="group">
								${group}</br></g:each></td>
						</tr>
					<g:set var="counter" value="${counter + 1}" />
					</g:each>
				</tbody>
			</table>
			<br>
		</div>
	</div>
	<div id="DiseaseAttributes" class="x-hide-display">
		<g:set var="counter" value="${1}" />
			<table>			 
				<thead>
					<tr><th>Name</th><th>Description</th><th>Synonyms</th><th>References</th></tr>
				</thead>		
				<tbody>
					<g:each in="${res.GeneralInformation.DiseaseAttributes}" var ="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result.Name}</td>
							<td>${result.Description}</td>
							<td><g:each in="${result.Synonyms.Synonym}" var="syn">
									${syn}</br></g:each></td>
							<td><g:each in="${result.References.Reference}" var="ref">
									<a href="${ref["@url"]}${ref["@ref"]}">${ref["@title"]}</a></br></g:each></td>
						</tr>
						<g:set var="counter" value="${counter + 1}" />
					</g:each>
				</tbody>
			</table>
		<br>
	</div>
	<div id="Associations" class="x-hide-display">
		<g:if test="${res.AssociationInformation.BiomarkerUses.size()}">
		<div id="Biomarkers">
			<g:set var="counter" value="${1}" />
			<table>
			<caption align="top" style="color:#ff9100">Biomarker Uses</caption> 
				<thead>
					<tr><th>Indication</th><th>Type</th><th>Role</th><th>Population</th><th>Technique</th><th>Validity</th><th>References</th></tr>
				</thead>		
				<tbody>
					<g:each in="${res.AssociationInformation.BiomarkerUses.BiomarkerUse}" var ="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result.Indication}</td>
							<td>${result.Type}</td>
							<td>${result.Role}</td>
							<td>${result.Population}</td>
							<td>${result.Technique}</td>
							<td>${result.Validity}</td>
							<td><g:each in="${result.References.Reference}" var="ref">
									<a href="${ref["@url"]}${ref["@ref"]}">${ref["@title"]}</a></br></g:each></td>
						</tr>
					<g:set var="counter" value="${counter + 1}" />
					</g:each>
				</tbody>
			</table>
			<br>
		</div>
		</g:if>
		<g:if test="${res.AssociationInformation.TreatmentEfficacy.BiomarkerUses.size()}">			
		<div id="Biomarkers">
			<g:set var="counter" value="${1}" />
			<table>
			<caption align="top" style="color:#ff9100">Biomarker Uses</caption> 
				<thead>
					<tr><th>Indication</th><th>Type</th><th>Role</th><th>Population</th><th>Technique</th><th>Validity</th><th>Reference</th></tr>
				</thead>		
				<tbody>
					<g:each in="${res.AssociationInformation.TreatmentEfficacy.BiomarkerUses.BiomarkerUse}" var ="result">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
							<td>${result.Indication}</td>
							<td>${result.Type}</td>
							<td>${result.Role}</td>
							<td>${result.Population}</td>
							<td>${result.Technique}</td>
							<td>${result.Validity}</td>
							<td><g:each in="${result.References.Reference}" var="ref">
									${ref["@type"]}, ${ref["@evidenceType"]}</br></g:each></td>
						</tr>
					<g:set var="counter" value="${counter + 1}" />
					</g:each>
				</tbody>
			</table>
			<br>
		</div>
		</g:if>
		<g:if test="${res.AssociationInformation.CausalAssociations.size()}">
		<div id="CausalAssociations">
			<g:set var="counter" value="${1}" />
			<g:set var="counter2" value="${1}" />
			<table>
			<caption align="top" style="color:#ff9100">Associations</caption>
				<thead><tr><th>Strength</th><th>Correlation</th><th>Associations</th></tr></thead>
				<tbody>
					<g:each in="${res.AssociationInformation.CausalAssociations.Association}" var="assoc">
						<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
						<td>${assoc["@associationStrength"]}</td>
						<td>${assoc["@correlation"]}													
						<td>
							<table>
								<thead>
									<tr>
										<th>Reference Type</th><th>Inheritance</th><th>Influence on Expression</th><th>Influence on Disease</th>
										<th>Disease Names</th><th>Method</th><th>Tissues</th><th>Experimental Groups</th>
									</tr>
								</thead>		
								<tbody>
									<g:each in="${assoc.Reference}" var ="result">
										<tr class="${counter % 2 == 0 ? 'even' : 'odd'}">
											<td>${result["@type"]}</td>						
											<td>${result.Inheritance}</td>
											<td>${result.InfluenceOnExpression}</td>
											<td>${result.InfluenceOnDisease}</td>
											<td><g:each in="${result.DiseaseNamesFromArticle.Name}" var="name">
													${name}</br></g:each></td>
											<td>${result.Method}</td>
											<td><g:each in="${result.Tissues.Tissue}" var="tissue">
													${tissue}</br></g:each></td>
											<td><g:each in="${result.ExperimentalGroups.Group}" var="group">
													${group["@name"]} (${group["@count"]})</br>
												</g:each>
											</td>
										</tr>
									<g:set var="counter" value="${counter + 1}" />
									</g:each>
								</tbody>
							</table>
						</td></tr>
					<g:set var="counter2" value="${counter2 + 1}" />
					</g:each>
				</tbody>
			</table>
			</br>
		</div>
		</g:if>
	</div>
</div>

</body>
</html>