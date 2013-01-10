<cfcomponent>
	<cffunction access="remote" name="login">
		<cfset var result = {}>
		<cfset result.roles = "dev,admin,RC,parent,student">
		<cfset result.fullName = "Admini Strator">

		<!--- <cfreturn serializeJSON(result)> --->
		<cfreturn {
			fullName = "Admini Strator",
			roles = "dev,admin,RC,parent,student"
		}>
	</cffunction>
</cfcomponent>