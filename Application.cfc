<cfcomponent>
	<cfset this.customTagPaths = expandPath("./tags")>
	<cfset this.datasource = "Vision">
	<cfset this.name = "Auto-Drill 0">
	<cfset this.sessionManagement = true>
	<cfset this.applicationTimeout = createtimespan(0, 0, 20, 0)>
	<cfset this.sessionTimeout = createtimespan(0, 0, 15, 0)>

	<cfswitch expression="#getEnvironment()#">
		<cfcase value="development">
			<cfset application.development = true>
		</cfcase>

		<cfcase value="production">
			<cfset application.development = false>
		</cfcase>
	</cfswitch>

	<cfset application.initTime = now()>

	<cffunction name="getEnvironment">
		<cfif findNoCase( ".net", CGI.SERVER_NAME )>
			<cfreturn "production">
		</cfif>
		
		<cfif findNoCase( "local", CGI.SERVER_NAME )>
			<cfreturn "development">
		</cfif>

		<cfreturn "unknown">
	</cffunction>

<!--- 
	// function loadServices() {
	// 	var comPath = "";
	// 	var service = "";
	// 	var services = directoryList(application.path & "service", true, "path", "*.cfc");

	// 	for (service in services) {
	// 		comPath = replaceNoCase(replaceNoCase(service, application.path, ""), ".cfc", "");
	// 		application.service[replaceNoCase(comPath, "service\", "")] = createObject("component", comPath);
	// 	}
	// }
 --->

	<cffunction name="onApplicationStart">
		<cfparam name="application.development" default="false">

		<cfset application.path = getDirectoryFromPath(getBaseTemplatePath())>

		<cfif CGI.HTTPS is "on">
			<cfset application.URL = "https://">
		<cfelse>
			<cfset application.URL = "http://">
		</cfif>

		<cfset application.URL &= CGI.HTTP_HOST>
		<cfset application.URL &= "/Auto-Drill">

		<!--- <cfset application.service = {}>
		<cfset loadServices()> --->

		<cfif (application.development)>
			<cfset session.com = structNew()>
		</cfif>
	</cffunction>

	<cffunction name="onError">
		<cfparam name="application.errorLog" default="#arrayNew(1)#">

		<cfset arrayAppend(application.errorLog, arguments)>
		<cfdump var="#arguments#">
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetPage">

		<cfif isDefined("URL.restart")>
			<cfif URL.restart is "stop">
				applicationStop();
			</cfif>

			<cfif URL.restart is "orm">
				<cfset ORMreload()>
 			</cfif>
			
			<cfif URL.restart is "rest">
				<cfset refreshRESTservice("AD")>
			</cfif>
		</cfif>
	</cffunction>

	<cffunction name="onRequest">
		<cfargument name="targetPage">

		<cfinclude template="#targetPage#">
	</cffunction>

	<cffunction name="onSessionStart">
		<cfparam name="session.userID" default="0">
		<cfparam name="session.com" default="#structNew()#">
	</cffunction>

	<cffunction name="securedArea">
		<cfargument name="action">

		<cfif application.unsecuredActions contains arguments.action>
			<cfreturn false>
		</cfif>

		<cfreturn true>
	</cffunction>

	<cffunction name="userInAnyRole">
		<cfif isDefined("session.user") and len(session.user.getRole())>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<cffunction name="userInRole">
		<!--- valid roles: dev, admin, manager, service --->
		<cfargument name="role" default="">

		<cfif isDefined("session.user")>
			<cfif arguments.role contains session.user.getRole()>
				<cfreturn true>
			</cfif>
		</cfif>

		<cfreturn false>
	</cffunction>

	<cffunction name="userLoggedIn">
		<cfif isDefined("session.user") and isNumeric(session.user.getID())>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>
</cfcomponent>