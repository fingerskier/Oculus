<cfcomponent>
	<cfinclude template="/tags/visionLib.cfm">

	<cffunction access="remote" name="read" roles="admin,FO,parent,RC,specialist,student">
		<cfargument default="false" name="showInactive" type="boolean">

		<cfif not isDefined("session.user.ID")>
			<cfreturn {"error"="not logged in"}>
		</cfif>

		<cfset var Q = "">
		<cfset var result = []>
		<cfset var thisSemester = getCurrentSemester()>

		<cfquery datasource="#application.DS#" name="Q">
			select ID, FirstName, LastName from SiteUsers
			where LoginLevel = #application.userLevel.student#
			<cfif not arguments.showInactive>
				and Active = 1
			</cfif>

			<cfif userIsAdmin()>

			<cfelseif userIsFO()>

			<cfelseif userIsParent()>
				and ID in (
					select StudentID from Parents
					where ParentID = #session.user.ID#
				)
			<cfelseif userIsRC()>
				and ID in (
					select StudentID from RCs
					where RCID = #session.user.ID#
					and studentInfoID in (
						select ID from studentInfo
						where semesterID = #thisSemester.ID#
					)
				)
			<cfelseif userIsSpecialist()>
			<cfelseif userIsStudent()>
				and ID = #session.user.ID#
			<cfelse>
				<!--- paranoia filter --->
				and 1 = 0
			</cfif>
			order by LastName asc, FirstName asc, ID desc
		</cfquery>

		<cfloop query="Q">
			<cfset arrayAppend(result, {
				"name" = FirstName & ' ' & LastName,
				"ID" = ID
			})>
		</cfloop>

		<cfreturn result>
	</cffunction>

	<cffunction access="remote" name="select" roles="admin,FO,parent,RC,specialist,student">
		<cfargument name="ID" type="numeric">

		<cfset var Q = "">

		<cfquery datasource="#application.DS#" name="Q">
			select * from siteUsers
			where ID = #arguments.ID#
		</cfquery>

		<cfif Q.recordCount>
			<cfset session.student = Q>
			<cfreturn {
				"success" = true
			}>
		<cfelse>
			<cfset semester.student = "">
			<cfreturn {
				"error" = "invalid query"
			}>
		</cfif>
	</cffunction>
</cfcomponent>