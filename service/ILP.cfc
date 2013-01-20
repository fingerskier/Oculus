<cfcomponent>
	<cffunction access="remote" name="read" roles="admin,parent,RC,specialist">
    	<cfargument name="semesterID" required="true" type="numeric">
		<cfargument name="studentID" required="true" type="numeric">

		<cfset var col = "">
		<cfset var Q = "">
		<cfset var result = {}>

		<cfquery datasource="#application.DS#" name="Q">
			select * from ILP
			where semesterID = #arguments.semesterID#
			and studentID = #arguments.studentID#
		</cfquery>

		<cfloop list="#Q.ColumnList#" index="col">
			<cfset result[col] = Q[col]>
		</cfloop>

		<cfreturn result>
    </cffunction>
	<cffunction name="getILP" returntype="query">
		<cfargument name="ID" required="No" type="numeric">
		<cfargument name="studentID" required="No" type="numeric">
		<cfargument name="semester" required="No" type="numeric">
		<cfargument name="schoolYear" required="No" type="numeric">
		<cfargument name="archived" required="No" type="numeric">

		<cfset var result = "">

		<cfif len(structKeyList(arguments))>
			<cfquery name="result" datasource="#Application.DS#">
				SELECT	*
				FROM	ILP
				WHERE	1 = 1
				<cfif isDefined("arguments.ID")>
					AND	ID = #arguments.ID#
				</cfif>
				<cfif isDefined("arguments.studentID")>
					AND	studentID = #arguments.studentID#
				</cfif>
				<cfif isDefined("arguments.semester")>
					AND	semester = #arguments.semester#
				</cfif>
				<cfif isDefined("arguments.schoolYear")>
					AND	schoolYear = #arguments.schoolYear#
				</cfif>
				<cfif isDefined("arguments.archived") AND isBoolean(arguments.archived)>
					AND	archived = #arguments.archived#
				</cfif>
				<cfif isDefined("session.userLevel")>
					<cfif session.userLevel EQ application.userLevel.RC>
						AND studentID IN (
							SELECT	StudentID
							FROM	RCs
							WHERE	RCID = #session.UserID#
						)
					<cfelseif session.userLevel EQ application.userLevel.Parent>
						AND	studentID IN (
							SELECT	StudentID
							FROM	Parents
							WHERE	ParentID = #session.UserID#
						)
					<cfelseif session.userLevel EQ application.userLevel.student>
						AND 1 = 0
					</cfif>
				<cfelse>
					AND 1 = 0
				</cfif>
			</cfquery>

			<cfreturn result>
		</cfif>
	</cffunction>
<!---  --->
	<cffunction name="getILPclasses" returntype="Query">
		<cfargument name="StudentID" required="true" type="numeric">
		<cfargument name="SemesterID" required="true" type="numeric">
		<cfargument name="Archived" default="0" required="false" type="numeric">

		<cfset var result = "">

		<cfquery datasource="#application.DS#" name="result">
			SELECT	classes.ID AS classID, elementILP.ID AS elementID, classes.className AS className
			FROM	Classes, ElementILP
			WHERE	ElementILP.ILPID IN (
				SELECT	ID
				FROM	ILP
				WHERE	SemesterID = #arguments.SemesterID#
				AND		StudentID = #arguments.StudentID#
				<cfif isValid("integer", arguments.Archived) AND isBoolean(arguments.Archived)>
					AND	archived = #arguments.Archived#
				</cfif>
			)
			AND		classes.ID = elementILP.classID
		</cfquery>

		<cfreturn result>
	</cffunction>
<!---  --->
	<cffunction access="remote" name="getClassList" returntype="String">
		<cfargument name="ILPID" required="false" type="numeric">
		<cfargument name="elementID" required="false" type="any">

		<cfset var Q = "">
		<cfset var result = "">
		<cfset var selectIt = "">
		<cfset var thisClass = "">

		<cfquery datasource="#Application.DS#" name="Q">
			SELECT	ID, classID
			FROM	elementILP
			WHERE	ILPID = #session.ILP.ID#
			ORDER BY AOSID, classID
		</cfquery>

		<cfset result &= '<option value="0">Select a course</option>'>
		<cfset result &= '<option value="-1">Add a new course</option>'>

		<cfloop query="Q">
			<cfquery dbtype="query" name="thisClass">
				SELECT	className
				FROM	application.classesData
				WHERE	ID = #Q.classID#
			</cfquery>

			<cfif isdefined("arguments.elementID") AND isvalid("integer", arguments.elementID) AND (Q.ID EQ arguments.elementID)>
				<cfset selectIt = "selected">
			<cfelse>
				<cfset selectIt = "">
			</cfif>

			<cfset result &= '<option value="#Q.ID#" #selectIt#>#thisClass.className#</option>'>
		</cfloop>

		<cfreturn result>
	</cffunction>
<!---  --->
	<cffunction name="UpdateAOS">
		<cfargument name="Val" required="Yes">

		<cfquery datasource="#Application.DS#">
			UPDATE ElementILP SET
			 	AOSID = <cfif IsValid("integer",Val)>Val<cfelse>0</cfif>
		</cfquery>
	</cffunction>
<!---  --->
	<cffunction name="StudentNameList" access="remote">
		<cfset var results = "">

		<cfquery name="results" datasource="#Application.DS#">
			SELECT	ID, (FirstName + ' ' + LastName) AS Name
			FROM	SiteUsers
			WHERE	LoginLevel = #Application.UserLevelInt.Student#
			ORDER BY LastName
		</cfquery>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="ILPlist" access="remote">
		<cfargument name="StudentID">

		<cfset var results = "">

		<cfquery name="results" datasource="#Application.DS#">
			SELECT ID, (Semester + ' semester ' + SchoolYear) AS TimeFrame
			FROM ILP
			WHERE StudentID = #arguments.StudentID#
			ORDER BY SchoolYear, Semester
		</cfquery>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="ActiveAOS" access="remote">
		<cfargument name="CurrAOS">

		<cfset var allAOS = "">
		<cfset var results = arrayNew(2)>
		<cfset var thisItem = arrayNew(1)>

 		<cfquery name="allAOS" dbtype="query">
			SELECT ID, Areaname FROM Application.AreasOfStudyData
			WHERE Active = 1
			ORDER BY SortOrder
		</cfquery>

		<cfset results[1][1] = 0>
		<cfset results[1][2] = "Select One">
		<cfloop query="allAOS">
			<cfif ID EQ arguments.CurrAOS>
				<cfset results[1][1] = ID>
				<cfset results[1][2] = AreaName>
			<cfelse>
				<cfset thisItem[1] = ID>
				<cfset thisItem[2] = AreaName>
				<cfset arrayAppend(results, thisItem)>
			</cfif>
		</cfloop>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="classesPerAOS" access="remote">
		<cfargument name="AOSID" required="Yes">
		<cfargument name="CurrAOS" required="Yes">
		<cfargument name="CurrClass" required="Yes" default="0" type="numeric">
		<cfargument name="ElemCheck" required="Yes" type="any">
		<cfargument name="MSCheck" required="Yes" type="any">
		<cfargument name="HSCheck" required="Yes" type="any">

		<cfset var currentClass = 0>
		<cfset var Elem = 0>
		<cfset var MS = 0>
		<cfset var HS = 0>
		<cfset var results = ArrayNew(2)>
		<cfset var theseClasses = "">
		<cfset var thisAOSID = 0>
		<cfset var thisItem = arrayNew(1)>

		<cfif IsValid("integer",arguments.AOSID)>
			<cfset thisAOSID = arguments.AOSID>
		<cfelse>
			<cfset thisAOSID = 0>
		</cfif>
		<cfif IsValid("integer",arguments.CurrClass)>
			<cfset currentClass = arguments.currClass>
		<cfelse>
			<cfset currentClass = 0>
		</cfif>

		<cfif thisAOSID>
			<cfif arguments.elemCheck EQ "YES">
				<cfset elem = 1>
			</cfif>
			<cfif arguments.MSCheck EQ "YES">
				<cfset MS = 1>
			</cfif>
			<cfif arguments.HSCheck EQ "YES">
				<cfset HS = 1>
			</cfif>

			<cfquery name="theseClasses" dbtype="query">
				SELECT	ID, ClassName
				FROM	Application.ClassesData
				WHERE	AreaID = #thisAOSID#
				<cfif elem OR MS OR HS>
					AND (
						<cfif Elem>ElemLevel = #Elem#</cfif>
						<cfif Elem AND MS>OR</cfif>
						<cfif MS>MSLevel = #MS#</cfif>
						<cfif Elem AND HS>OR<cfelseif MS AND HS>OR</cfif>
						<cfif HS>HSLevel = #HS#</cfif>
					)
				</cfif>
				and (
					ID = #arguments.currClass#
					OR
					Active = 1
				)
				ORDER BY SortOrder
			</cfquery>

			<cfloop query="theseClasses">
				<cfset thisItem[1] = ID>
				<cfset thisItem[2] = ClassName>
				<cfif ID EQ currentClass>
					<cfset arrayPrepend(results, thisItem)>
				<cfelse>
					<cfset arrayAppend(results, thisItem)>
				</cfif>
			</cfloop>
			<cfif NOT currentClass>
				<cfset thisItem[1] = 0>
				<cfset thisItem[2] = "Select one">
				<cfset arrayPrepend(results, thisItem)>
			</cfif>
		<cfelse>
			<cfset results[1][1] = 0>
			<cfset results[1][2] = "Select a Field of Study">
		</cfif>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="Relationship" access="remote">
		<cfargument name="currRelation" default=0>

		<cfset var currRelationship = 0>
		<cfset var results = ArrayNew(2)>
		<cfset var theseRelationships = "">
		<cfset var thisItem = arrayNew(1)>

		<cfif IsValid("integer", arguments.currRelation)>
			<cfset currRelationship = arguments.currRelation>
		</cfif>

		<cfquery name="theseRelationships" dbtype="query">
			SELECT	ID, Name
			FROM	Application.RelationshipsData
			WHERE	active = 1
			OR		ID = #arguments.currRelation#
			ORDER BY SortOrder
		</cfquery>

		<cfloop query="theseRelationships">
			<cfset thisItem[1] = ID>
			<cfset thisItem[2] = Name>
			<cfif ID EQ currRelationship>
				<cfset arrayPrepend(results, thisItem)>
			<cfelse>
				<cfset arrayAppend(results, thisItem)>
			</cfif>
		</cfloop>
		<cfif NOT currRelationship>
			<cfset thisItem[1] = 0>
			<cfset thisItem[2] = "Select one">
			<cfset arrayPrepend(results, thisItem)>
		</cfif>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="Setting" access="remote">
		<cfargument name="currSetting" default=0>

		<cfset var currentSetting = 0>
		<cfset var results = ArrayNew(2)>
		<cfset var theseSettings = "">
		<cfset var thisItem = arrayNew(1)>

		<cfif IsValid("integer", arguments.currSetting)>
			<cfset currentSetting = arguments.currSetting>
		</cfif>

		<cfquery name="theseSettings" dbtype="query">
			SELECT	ID, Name
			FROM	Application.SettingsData
			WHERE (
				active = 1
				OR
				ID = #arguments.currSetting#
			)
			<cfif session.student.grade LE 5>
				AND	name <> 'Crossover'
			</cfif>
			ORDER BY SortOrder
		</cfquery>

		<cfloop query="theseSettings">
			<cfset thisItem[1] = ID>
			<cfset thisItem[2] = Name>
			<cfif ID EQ currentSetting>
				<cfset arrayPrepend(results, thisItem)>
			<cfelse>
				<cfset arrayAppend(results, thisItem)>
			</cfif>
		</cfloop>
		<cfif NOT currentSetting>
			<cfset thisItem[1] = 0>
			<cfset thisItem[2] = "Select one">
			<cfset arrayPrepend(results, thisItem)>
		</cfif>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="setSetting" access="remote">
		<cfargument name="ID">

	</cffunction>
<!---  --->
	<cffunction name="Crossover" access="remote">
		<cfargument name="currSetting" default=0 required="No" type="any">
		<cfargument name="currCross" default=0 required="No" type="numeric">

		<cfset var crossoverDB = "">
		<cfset var currentSetting = 0>
		<cfset var currentXO = 0>
		<cfset var I = 2>
		<cfset var results = ArrayNew(2)>
		<cfset var theseCrossovers = "">
		<cfset var thisItem = arrayNew(1)>

		<cfif IsValid("integer", arguments.currSetting)>
			<cfset currentSetting = arguments.currSetting>
		</cfif>
		<cfif IsValid("integer", arguments.currCross)>
			<cfset currentXO = arguments.currCross>
		</cfif>

		<cfquery name="crossoverDB" dbtype="query">	<!--- get the ID of the Crossover setting from the DB because it may change --->
			SELECT	ID
			FROM	Application.SettingsData
			WHERE	Name = 'Crossover'
		</cfquery>

		<cfif currentSetting EQ crossoverDB.ID>
			<cfquery name="theseCrossovers" dbtype="query">
				SELECT	ID, Setting
				FROM	Application.CrossoversData
				WHERE	active = 1
				OR		ID = #arguments.currCross#
				ORDER BY SortOrder
			</cfquery>

			<cfloop query="theseCrossovers">
				<cfset thisItem[1] = ID>
				<cfset thisItem[2] = Setting>
				<cfif ID EQ currentXO>
					<cfset arrayPrepend(results, thisItem)>
				<cfelse>
					<cfset arrayAppend(results, thisItem)>
				</cfif>
			</cfloop>
			<cfif NOT currentXO>
				<cfset thisItem[1] = 0>
				<cfset thisItem[2] = "Select one">
				<cfset arrayPrepend(results, thisItem)>
			</cfif>
		</cfif>

		<cfreturn results>
	</cffunction>
<!---  --->
	<cffunction name="Semester" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT Semester FROM ILP WHERE ID = #Session.ILP#	</cfquery>
		<cfreturn getData.Semester>
	</cffunction>
<!---  --->
	<cffunction name="SchoolYear" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	SchoolYear	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.SchoolYear>
	</cffunction>
<!---  --->
	<cffunction name="LearnerHistory" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	LearnerHistory	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.LearnerHistory>
	</cffunction>
<!---  --->
	<cffunction name="Goals" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	Goals	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.Goals>
	</cffunction>
<!---  --->
	<cffunction name="SpecialEd" access="remote" returntype="string" returnformat="plain">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	SpecialEd	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn "#getData.SpecialEd# ">
	</cffunction>
<!---  --->
	<cffunction name="Phonemic" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	Phonemic	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.Phonemic>
	</cffunction>
<!---  --->
	<cffunction name="Phonics" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	Phonics	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.Phonics>
	</cffunction>
<!---  --->
	<cffunction name="Fluency" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	Fluency	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.Fluency>
	</cffunction>
<!---  --->
	<cffunction name="Vocabulary" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	Vocabulary	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.Vocabulary>
	</cffunction>
<!---  --->
	<cffunction name="Elem" access="remote">
		<cfargument name="ClassID" required="Yes">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" dbtype="query">	SELECT Elem FROM Application.ClassesData WHERE ID = #arguments.ClassID#	</cfquery>
		<cfif GetDate.Elem>	<cfreturn true>	<cfelse>	<cfreturn false>	</cfif>
	</cffunction>
<!---  --->
	<cffunction name="MidS" access="remote">
		<cfargument name="ClassID" required="Yes">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" dbtype="query">	SELECT MidS FROM Application.ClassesData WHERE ID = #arguments.ClassID#	</cfquery>
		<cfif GetDate.MidS>	<cfreturn true>	<cfelse>	<cfreturn false>	</cfif>
	</cffunction>
<!---  --->
	<cffunction name="HghS" access="remote">
		<cfargument name="ClassID" required="Yes">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" dbtype="query">	SELECT HghS FROM Application.ClassesData WHERE ID = #arguments.ClassID#	</cfquery>
		<cfif GetDate.HghS>	<cfreturn true>	<cfelse>	<cfreturn false>	</cfif>
	</cffunction>
<!---  --->
	<cffunction name="saveBudget" returntype="void">
		<cfset var I = 0>
		<cfset var thisAmount = 0>
		<cfset var thisID = 0>
		<cfset var thisItem = "">

		<cfloop list="#arguments.itemNumber#" index="I">
			<cfset thisID = arguments["elementID_#I#"]>
			<cfset thisAmount = arguments["budget_#I#"]>
			<cfset thisItem = arguments["budgetItem_#I#"]>

			<cfif isValid("integer", thisID) AND isValid("float", thisAmount)>
				<cf_trackchanges table="ElementILP" what="ID = #thisID#">
					<cfquery datasource="#application.DS#">
	                	UPDATE	elementILP
						SET		budget = #thisAmount#,
								budgetItem = '#left(urlEncodedFormat(thisItem), 77)#'
						WHERE	ID = #thisID#
	                </cfquery>
				</cf_trackchanges>
			</cfif>
		</cfloop>
	</cffunction>
<!---  --->
	<cffunction name="TextComp" access="remote">
		<cfset var getData = "">

		<cfif NOT isDefined("session.ILP")>
			<cfif isDefined("client.ILP")>
				<cf_restoresession>
			<cfelse>
				<cfreturn "">
			</cfif>
		</cfif>

		<cfquery name="getData" datasource="#Application.DS#">	SELECT	TextComp	FROM	ILP	WHERE	ID = #Session.ILP#	</cfquery>
		<cfreturn getData.TextComp>
	</cffunction>
</cfcomponent>