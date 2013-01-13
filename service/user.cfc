<cfcomponent>
	<cffunction access="remote" name="login" returnformat="JSON">
		<cfargument name="username">
		<cfargument name="password">

		<cfset var result = {}>
		<cfset result.roles = "dev,admin,RC,parent,student">
		<cfset result.fullName = "Admini Strator">

		<!--- <cfreturn serializeJSON(result)> --->
		<cfreturn result>
	</cffunction>
</cfcomponent>