<cfcomponent>
	<cffunction access="remote" name="login">
		<cfargument name="username" type="string">
		<cfargument name="password" type="string">

		<cfset var Q = "">
		<cfset session.user = "">

		<cfquery datasource="#application.DS#" name="Q">
			select * from SiteUsers
			where Username = '#arguments.username#'
		</cfquery>

		<cfif (Q.recordCount is 1) and (compareNoCase(hash(Q.password), arguments.password) is 0)>
			<cflogin>
				<cfloginuser name="#Q.username#" password="#Q.password#" roles="#application.userRole[Q.loginLevel]#">
			</cflogin>
			<cfset session.user = Q>

			<cfreturn {
				"fullName" = Q.firstName & " " & Q.lastName,
				"role" = '#getUserRoles()#',
				"username" = '#Q.username#'
			}>
		</cfif>

		<cfreturn {
			"error" = 'invalid credentials'
		}>
	</cffunction>

	<cffunction access="remote" name="getRoles">
		<cfreturn getUserRoles()>
	</cffunction>
</cfcomponent>