
/***
* transmart Application configuration settings
* this file will be loaded by the tranSMART application when tomcat is restarted
*
*/

/************************
* configuration for search
*************************/

// Lucane index location for documentation search - this is a absolute path on your local deployment
com.recomdata.searchengine.index="/Developer/transmart/appdata/transmart/index"
// contact email address
com.recomdata.searchtool.contactUs="mailto:transmartGPLsupport@recomdata.com"
// relative context path to dataset explorer url
com.recomdata.searchtool.datasetExplorerURL="/transmart/datasetExplorer"
// absolute path to online help system
com.recomdata.searchtool.adminHelpURL="http://23.21.225.70/transmart/help/adminHelp/default.htm"
// application title 
com.recomdata.searchtool.appTitle="Search tranSMART (GPL)"
// application logo to be used in the login page
com.recomdata.searchtool.largeLogo="transmartlogo.jpg"
// application logo to be used in the search page
com.recomdata.searchtool.smallLogo="transmartlogosmall.jpg"
// set to true to enable guest auto login.If it's enabled no login is required to access tranSMART. 

com.recomdata.guestAutoLogin='true'
// default guest account user name - tranSMART will load this user as the "guest" user account
// This allows tranSMART admin to control the level of accesses a default guest account can have
// or even disable some features if necessary
com.recomdata.guestUserName='guest'

/**********************************
* configuration for dataset explorer
**********************************/
// i2b2 project management cell url
com.recomdata.datasetExplorer.pmServiceURL="http://mc.sd.genego.com:9090/i2b2/rest/PMService/"
// turn proxy on if the pm cell deployed on a different server or not through the apache proxy - this meets the javascript same origin policy
com.recomdata.datasetExplorer.pmServiceProxy='true'
// deprecated - leave it as false
com.recomdata.datasetExplorer.inforsense='false'
// set to true to enable gene pattern integration 
com.recomdata.datasetExplorer.genePatternEnabled = 'false'
// The tomcat URL that gene pattern is deployed within -usually it's proxyed through apache
com.recomdata.datasetExplorer.genePatternURL='http://23.21.225.70'
// Gene Pattern real URL with port number
com.recomdata.datasetExplorer.genePatternRealURLBehindProxy='http://23.21.225.70:7090'
// default Gene pattern user to start up - each tranSMART user will need a separate user account to be created in Gene Pattern
com.recomdata.datasetExplorer.genePatternUser='biomart'
// temporary image directories for analyses results 
com.recomdata.datasetExplorer.imageTempDir='/images/datasetExplorer'
// Absolute path to PLINK executables
com.recomdata.datasetExplorer.plinkExcutable = '/Developer/transmart/plink-1.07-x86_64/plink'


com.recomdata.i2b2.subject.domain = 'i2b2demo'
com.recomdata.i2b2.subject.projectid = 'i2b2demo'
com.recomdata.i2b2.subject.username = 'Demo'
com.recomdata.i2b2.subject.password = 'demouser'

//SAMPLE Data.
com.recomdata.i2b2.sample.domain = 'i2b2demo'
com.recomdata.i2b2.sample.projectid = 'i2b2demo'
com.recomdata.i2b2.sample.username = 'Demo'
com.recomdata.i2b2.sample.password = 'demouser'

//**************************

// max genes to display after disease search
com.recomdata.search.gene.max=250;

// set schema names for I2B2HelperService
com.recomdata.i2b2helper.i2b2hive="i2b2hive"
com.recomdata.i2b2helper.i2b2metadata="i2b2metadata"
com.recomdata.i2b2helper.i2b2demodata="i2b2demodata"

/**********************************
* configuration for solr
**********************************/

// solr application URL
com.recomdata.solr.baseURL = 'http://mc.sd.genego.com:8983'
// field list to be indexed from
com.recomdata.solr.solrFieldList = 'Pathology|Tissue|DataType|DataSet'
//This must be in alphabetical order for now.
com.recomdata.solr.resultFields = 'DataSet,DataType,Pathology,Tissue'

//This is the max number of results we retrieve 
com.recomdata.solr.maxRows = '1000000'
//This is the number of results we display before drawing the "More [+]" text.
com.recomdata.solr.maxLinksDisplayed = 10
//This is the list of columns we don't draw in the application.
com.recomdata.solr.fieldExclusionList = "text|id|"
//This is the maximum number of news stories we display.
com.recomdata.solr.maxNewsStories = 10
//This is the number of items we display in the search suggestion box.
com.recomdata.solr.numberOfSuggestions = 20
//**************************

/**********************************
* configuration for plugins
**********************************/

//This is the directory to the R plugins.
com.recomdata.plugins.pluginScriptDirectory = "/Users/eugr/.grails/2.1.0/projects/transmart/plugins/"

//This is the main temporary directory, under this should be the folders that get created per job.
com.recomdata.plugins.tempFolderDirectory = "/Developer/transmart/jobs/"

//Use this to do local development.  It causes the analysis controllers to move the image file before rendering it.
com.recomdata.plugins.transferImageFile = true

//This is the system path where we move the image file to so we can serve it.
com.recomdata.plugins.temporaryImageFolder = "/Users/eugr/Documents/git/transmart_repo/transmartApp/web-app/images/tempImages/"

//This is the path that we use to render the image.
com.recomdata.plugins.analysisImageURL = "/transmart/images/tempImages/"

//list of available plugins.
com.recomdata.plugins.available = [] 
//"lineGraph","correlationAnalysis","scatterPlot"]

/**********************************************
* configuration for Spring Security Core Plugin
***********************************************/

// Added by the Spring Security Core plugin:
// customized user GORM class
grails.plugins.springsecurity.userLookup.userDomainClassName = 'org.transmart.searchapp.AuthUser'
// customized password field
grails.plugins.springsecurity.userLookup.passwordPropertyName = 'passwd'
// customized user /role join GORM class
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'org.transmart.searchapp.AuthUser'
// customized role GORM class
grails.plugins.springsecurity.authority.className = 'org.transmart.searchapp.Role'
// request map GORM class name - request map is stored in the db
grails.plugins.springsecurity.requestMap.className = 'org.transmart.searchapp.Requestmap'
// requestmap in db
grails.plugins.springsecurity.securityConfigType = grails.plugins.springsecurity.SecurityConfigType.Requestmap
// url to redirect after login in
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/search/index'
// logout url
grails.plugins.springsecurity.logout.afterLogoutUrl='/'
// password encoding url
grails.plugins.springsecurity.password.algorithm = 'SHA'

//grails.plugins.springsecurity.anon.userAttribute = 'guest,ROLE_ANONYMOUS'

//Quartz jobs configuration
//start delay for the sweep job
com.recomdata.export.jobs.sweep.startDelay=60000 //d*h*m*s*1000
//repeat interval for the sweep job
com.recomdata.export.jobs.sweep.repeatInterval= 86400000 //d*h*m*s*1000
//specify the age of files to be deleted (in days)
com.recomdata.export.jobs.sweep.fileAge=3

com.recomdata.transmart.data.export.rScriptDirectory='/Users/eugr/Documents/git/transmart_repo/transmartApp/web-app/dataExportRScripts'

log4j = {
  appenders {
		// set up a log file in the standard tomcat area; be sure to use .toString() with ${}
		rollingFile name:'tomcatLog', file:"/Developer/transmart/logs/transmart.log".toString(), maxFileSize:'6080KB', layout:pattern(conversionPattern: '[%p] %d{HH:mm:ss} (%c{5}:%M:%L) | %m%n')
		'null' name:'stacktrace'
	}

	root {
		// change the root logger to my tomcatLog file
		info 'tomcatLog'
		additivity = true
	}

	// example for sending stacktraces to my tomcatLog file
	info tomcatLog:'StackTrace'
	info tomcatLog:'grails.app.task', 'grails.app.controller', 'grails.app.service'
	info tomcatLog:'org.codehaus.groovy.grails.plugins'
	//trace tomcatLog:'grails.app'
}

com.recomdata.searchtool.genegoURL = 'https://portal.genego.com'
com.recomdata.searchtool.cortellisEnabled = true
com.thomsonreuters.transmart.cortellisAPILogin = 'GVAPI_UserName'
com.thomsonreuters.transmart.cortellisAPIPassword = 'GVAPI_Password'
com.thomsonreuters.transmart.cortellisCertStore = '/Developer/transmart/cortellis_truststore.jks'
com.thomsonreuters.transmart.GVAPICertStore = '/Developer/transmart/gvapi.jks'
com.thomsonreuters.transmart.metacoreURL = 'http://metacore.url.com' //'http://gur.devel.genego.com'

com.thomsonreuters.transmart.cortellisAnalyticsEnable = true
com.thomsonreuters.transmart.metacoreAnalyticsEnable = true

com.thomsonreuters.transmart.metacoreDefaultLogin = 'MetaCore_UserName'
com.thomsonreuters.transmart.metacoreDefaultPassword = 'MetaCore_Password'
/*com.thomsonreuters.transmart.demoEnrichmentURL = 'http://localhost:8090'
com.thomsonreuters.transmart.demoMapBaseURL = 'http://pathwaymaps.com/maps/'
*/


