<cfcomponent>
	<cffunction access="remote" name="select" roles="admin,FO,parent,RC,specialist,student">
		<cfargument name="ID" type="numeric">

		<cfset var Q = "">

		<cfquery dbtype="query" name="Q">
			select * from application.semestersData
			where ID = #arguments.ID#
		</cfquery>

		<cfif Q.recordCount>
			<cfset session.semester = Q>
			<cfreturn {
				"success" = true
			}>
		<cfelse>
			<cfset semester.semester = "">
			<cfreturn {
				"error" = "invalid query"
			}>
		</cfif>
	</cffunction>

	<cffunction access="remote" name="read" roles="admin,FO,parent,RC,specialist,student">
		<cfset var Q = "">
		<cfset var result = []>
		<cfset var semesterName = "">
		<cfset var semesterYear = 0>

		<cfquery dbtype="query" name="Q">
			select * from application.semestersData
			order by SchoolYear desc, SemesterNum desc
		</cfquery>

		<cfloop query="Q">
			<cfif semesterNum is 1>
				<cfset semesterName = "Fall " & schoolYear>
			<cfelse>
				<cfset semesterName = "Spring " & schoolYear+1>
			</cfif>

			<cfset arrayAppend(result, {
				"ID" = ID,
				"name" = semesterName,
				"semester" = semesterNum,
				"year" = schoolYear
			})>
		</cfloop>

		<cfreturn result>
	</cffunction>
</cfcomponent>