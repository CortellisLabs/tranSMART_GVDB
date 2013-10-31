/*************************************************************************
 * Add-on module for tranSMART - translational medicine data mart
 * 
 * Copyright 2012 Thomson Reuters
 * 
 * This product includes software developed at Thomson Reuters
 * 
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License 
 * as published by the Free Software  * Foundation, either version 3 of the License, or (at your option) any later version, along with the following terms:
 * 1.	You may convey a work based on this program in accordance with section 5, provided that you retain the above notices.
 * 2.	You may convey verbatim copies of this program code as you receive it, in any medium, provided that you retain the above notices.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS    * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 *
 ******************************************************************/
  
package com.thomsonreuters.lsps.transmart

import groovyx.net.http.*
import java.security.KeyStore
import org.apache.http.conn.scheme.Scheme
import org.apache.http.conn.ssl.SSLSocketFactory

class GVAPISearch2Controller {
	    
    def GVsearch2 = { 
    	def apiLogin = grailsApplication.config.com.thomsonreuters.transmart.cortellisAPILogin
    	def apiPassword = grailsApplication.config.com.thomsonreuters.transmart.cortellisAPIPassword

    	//System.setProperty("javax.net.debug", "ssl")
    	
    	if (apiLogin && apiPassword) {

			def site = new HTTPBuilder("https://lsapi.thomsonreuterslifesciences.com/ls-api-ws/ws/rs/GeneVariants-v1/")
			site.auth.basic apiLogin, apiPassword
			
			//if (System.properties.proxyHost && System.properties.proxyPort)
				//site.setProxy(System.properties.proxyHost, System.properties.proxyPort.toInteger(), null)
			      site.setProxy("webproxy.int.westgroup.com", 80, null)


			def keyStore = KeyStore.getInstance( KeyStore.defaultType )
 
			keyStore.load( 
				new FileInputStream(grailsApplication.config.com.thomsonreuters.transmart.GVAPICertStore), 
				"password".toCharArray() )

						 
			site.client.connectionManager.schemeRegistry.register( 
        		new Scheme("https", new SSLSocketFactory(keyStore), 443) )
			
			site.get( path: "getTopLevel") { //, query : [query: "${URLEncoder.encode(params.text)}&offset=0&hits=500&enableFilters=true"]) {
				resp, xml ->				
				
				def topLevelID
				
				for(element in xml.TopLevelElements.TopLevelElement)
				{
					
					if (element.toString().equalsIgnoreCase(params.text)) 
						topLevelID = element["@id"].toString()
				}
				
				if(topLevelID != null) 
				{
					site.get( path: "getHierarchy", query : [nodeId:"${URLEncoder.encode(topLevelID)}"]) {
						resp2, xml2 ->
							
						render(view:'GVsearch2', model:[res:xml2])
						
						}
				}
				
				else 
				{
					render(view:'GVtopLevel', model:[res:xml.TopLevelElements.TopLevelElement])
				}	
			}
    	}
    }

    def GVshowTarget2 = {
    	def apiLogin = grailsApplication.config.com.thomsonreuters.transmart.cortellisAPILogin
    	def apiPassword = grailsApplication.config.com.thomsonreuters.transmart.cortellisAPIPassword

    	//System.setProperty("javax.net.debug", "ssl")
    	
    	if (apiLogin && apiPassword) {
	    	def site = new HTTPBuilder("https://lsapi.thomsonreuterslifesciences.com/ls-api-ws/ws/rs/GeneVariants-v1/")
			site.auth.basic apiLogin, apiPassword
			
			//if (System.properties.proxyHost && System.properties.proxyPort)
				//site.setProxy(System.properties.proxyHost, System.properties.proxyPort.toInteger(), null)
				site.setProxy("webproxy.int.westgroup.com", 80, null)

			def keyStore = KeyStore.getInstance( KeyStore.defaultType )

			keyStore.load( 
				new FileInputStream(grailsApplication.config.com.thomsonreuters.transmart.GVAPICertStore), 
				"password".toCharArray() )
						 
			site.client.connectionManager.schemeRegistry.register( 
	    		new Scheme("https", new SSLSocketFactory(keyStore), 443) )

			site.get( path: "getResults", query : [query: "diseaseId:${URLEncoder.encode(params.id)}&offset=0&hits=500&enableFilters=true"]) {
			//site.get( path: "getWildTypeRecord", query : [variantId: "${URLEncoder.encode(params.id)}"]) {
				targetResp, xml ->

				if (targetResp.status == 200) {
					render(view:'GVshowTarget2', model:[res:xml])
				}
				else {
					render "Internal Error"
				}
			}  	
		}
    }
	
	def GVpheno = {
		def apiLogin = grailsApplication.config.com.thomsonreuters.transmart.cortellisAPILogin
		def apiPassword = grailsApplication.config.com.thomsonreuters.transmart.cortellisAPIPassword

		//System.setProperty("javax.net.debug", "ssl")
		
		if (apiLogin && apiPassword) {
			def site = new HTTPBuilder("https://lsapi.thomsonreuterslifesciences.com/ls-api-ws/ws/rs/GeneVariants-v1/")
			site.auth.basic apiLogin, apiPassword
			
			//if (System.properties.proxyHost && System.properties.proxyPort)
				//site.setProxy(System.properties.proxyHost, System.properties.proxyPort.toInteger(), null)
				site.setProxy("webproxy.int.westgroup.com", 80, null)

			def keyStore = KeyStore.getInstance( KeyStore.defaultType )

			keyStore.load(
				new FileInputStream(grailsApplication.config.com.thomsonreuters.transmart.GVAPICertStore),
				"password".toCharArray() )
			
			site.client.connectionManager.schemeRegistry.register(
				new Scheme("https", new SSLSocketFactory(keyStore), 443) )

			site.get( path: "getResponsePhenotypeRecord", query : [recordId: "${URLEncoder.encode(params.id)}"]) { //&offset=0&hits=500&enableFilters=true"]) {
				targetResp, xml ->

				if (targetResp.status == 200) {
					render(view:'GVshowPhenotype', model:[res:xml])
				}
				else {
					render "Internal Error"
				}
			}			
		}
	}	
}
