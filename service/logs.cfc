<cfcomponent>
	<cffunction access="remote" name="getLogData">
		<cfargument name="studentID" type="numeric">
		<cfargument name="date" type="date">

		<cfset session.logDate = arguments.date>

		<cfset var cell = {
			elemID = 0,
			state = "blank",
			class = "",
			height = 1
		}>
		<cfset variables.day = []>
		<cfset variables.logData = "">
		<cfset variables.scheduleData = {}>
		<cfset variables.studentID = arguments.studentID>

		<cfset var classes = []>
		<cfset var classNames = []>
		<cfset var data = arrayNew(2)>
		<cfset var dataCol = 0>
		<cfset var dataRow = 0>
		<cfset var holidays = "">
		<cfset var Q = "">
		<cfset var thisClass = "">
		<cfset var time = 0>
		<cfset var theseScheduledClasses = "">
		<cfset var thisElement = "">
		<cfset var thisHeight = 0>
		<cfset var thisn = {}>
		<cfset var thisSchedule = "">
		<cfset var thisSemester = "">
		<cfset var timeSlots = []>

		<cfset setDays(arguments.date)>

		<cfquery datasource="#application.DS#" name="variables.schedules">
			select * from StudentSchedules
			where StudentID = #arguments.studentID#
		</cfquery>

		<cfset variables.logData = getStudentLogs(listAppend(valueList(variables.schedules.ID), 0))>

		<cfloop from="2" to="7" index="DoW">
			<cfset dataCol = DoW - 1>
			<cfset dataRow = 0>
			<cfset thisSemester = getSemester(DoW)>

			<cfset thisSchedule = getSchedule(thisSemester.ID, DoW)>
			<cfif not thisSchedule.recordCount>
				<cfreturn {"error" = "No schedule for that day"}>
			</cfif>

			<cfif not structHasKey(variables.scheduleData, thisSchedule.ID)>
				<cfset variables.scheduleData[thisSchedule.ID] = getScheduledClasses(thisSchedule.ID)>
			</cfif>

			<cfloop from=#application.earliestClassTime# to=#application.latestClassTime# index="time" step=#CreateTimeSpan(0,0,30,0)#>
				<cfif DoW is 2>
					<cfset arrayAppend(timeSlots, timeFormat(time, "HH:MM"))>
				</cfif>

				<cfset thisElement = getElement(thisSchedule.ID, DoW, timeFormat(time, "HH:MM"))>
				<cfset thisHeight = thisElement.duration / 30>
				<cfif thisHeight lt 1>
					<cfset thisHeight = 1>
				</cfif>

				<cfset data[++dataRow][dataCol] = {
					"elemID" = thisElement.ID,
					"state" = thisElement.state,
					"name" = thisElement.name,
					"note" = thisElement.note,
					"height" = thisHeight
				}>
			</cfloop>
		</cfloop>

		<cfset arrayDeleteAt(variables.day, 1)>

		<cfset Q = variables.scheduleData[thisSchedule.ID]>
		<cfloop query="Q">
			<cfquery dbtype="query" name="thisClass">
				select * from application.classesData
				where ID = #Q.courseID#
			</cfquery>

			<cfif (not arrayContains(classNames, thisClass.className)) and len(thisClass.className)>
				<cfset arrayAppend(classNames, thisClass.className)>
				<cfset arrayAppend(classes, {
					"ID" = Q.ID,
					"name" = thisClass.className
				})>
			</cfif>
		</cfloop>
		<cfset arrayPrepend(classes, {
			"ID" = 0,
			"name" = "n/a"
		})>

		<cfreturn {
			"classes" = classes,
			"data" = data,
			"dates" = variables.day,
			"timeSlots" = timeSlots
		}>
	</cffunction>

	<cffunction name="getElement">
		<!--- valid states: blank, scheduled, logged, meal --->
		<cfargument name="scheduleID" type="numeric">
		<cfargument name="DoW" type="numeric">
		<cfargument name="time" type="date">

		<cfset var class = "">
		<cfset var classQ = variables.scheduleData[arguments.scheduleID]>
		<cfset var course = "">
		<cfset var duration = 0>
		<cfset var ID = 0>
		<cfset var log = "">
		<cfset var name = "n/a">
		<cfset var note = "">
		<cfset var state = "blank">

		<cfquery dbtype="query" name="log">
			select * from variables.logData
			where StudyDate = #createODBCDateTime(createDateTime(year(variables.day[DoW]), month(variables.day[DoW]), day(variables.day[DoW]), hour(arguments.time), minute(arguments.time), second(arguments.time)))#
		</cfquery>

		<cfquery dbtype="query" name="class">
			select * from classQ
			where DayOfWeek = #arguments.DoW#
			and StartTime = '#timeFormat(arguments.time, "HH:MM")#'
		</cfquery>

		<cfif class.recordCount>
			<cfquery dbtype="query" name="course">
				select * from application.classesData
				where ID = #class.CourseID#
			</cfquery>

			<cfset duration = class.Duration>
			<cfset ID = class.ID>

			<cfif class.CourseID is -7>
				<cfset state = "meal">
				<cfset name = "Meal Time">
			<cfelse>
				<cfset state = "scheduled">
				<cfset name = course.ClassName>
			</cfif>
		</cfif>

		<cfif log.recordCount>
			<cfquery dbtype="query" name="course">
				select * from application.classesData
				where ID = #log.ClassID#
			</cfquery>

			<cfset duration = log.TimeSpent>
			<cfset ID = log.ID>
			<cfset name = course.ClassName>
			<cfset note = log.note>
			<cfset state = "logged">
		</cfif>

		<cfreturn {
			duration = duration,
			ID = ID,
			name = name,
			note = note,
			state = state
		}>
	</cffunction>

	<cffunction name="getStudentLogs">
		<cfargument name="scheduleIDs">

		<cfset var result = "">

		<cfquery datasource="#application.DS#" name="result">
			select ID, ClassID, Note, StudyDate, TimeSpent from StudentLogs
			where ScheduleID in (#arguments.scheduleIDs#)
		</cfquery>

		<cfreturn result>
	</cffunction>

	<cffunction name="getSchedule">
		<cfargument name="semesterID" type="numeric">
		<cfargument name="DoW" type="numeric">

		<cfset var result = "">
		<cfset var thisDate = variables.day[arguments.DoW]>

		<cfquery dbtype="query" maxrows="1" name="result">
			select * from variables.schedules
			where semesterID = #arguments.semesterID#
			order by ID desc
		</cfquery>

		<cfreturn result>
	</cffunction>

	<cffunction name="getScheduledClasses">
		<cfargument name="scheduleID" type="numeric">

		<cfset var result = "">

		<cfquery datasource="#application.DS#" name="result">
			select ID, CourseID, DayOfWeek, Duration, StartTime from ScheduledClasses
			where ScheduleID = #arguments.scheduleID#
		</cfquery>

		<cfreturn result>
	</cffunction>

	<cffunction name="getSemester">
		<cfargument name="DoW" type="numeric">

		<cfset var result = "">

		<cfquery dbtype="query" name="result">
			select * from application.semestersData
			where startDate <= #createODBCDateTime(variables.day[arguments.DoW])#
			and endDate >= #createODBCDateTime(variables.day[arguments.DoW])#
		</cfquery>

		<cfreturn result>
	</cffunction>

	<cffunction access="remote" name="logClass">
		<cfargument name="ID" type="numeric">
		<cfargument name="date" type="date">
		<cfargument name="time" type="date">
		<cfargument name="duration" type="numeric">
		<cfargument default="" name="note" type="string">

		<cfset var Q = "">
		<cfset var scheduledClass = "">
		<cfset var thisDateTime = createDateTime(year(arguments.date), month(arguments.date), day(arguments.date), hour(arguments.time), minute(arguments.time), second(arguments.time))>

		<cfquery datasource="#application.DS#" name="scheduledClass">
			select * from ScheduledClasses
			where ID = #arguments.ID#
		</cfquery>

		<cfquery datasource="#application.DS#" result="Q">
			insert into StudentLogs (
				ScheduledClassID,
				ScheduleID,
				ClassID,
				StudyDate,
				TimeSpent,
				DayOfWeek,
				Note
			) values (
				#scheduledClass.ID#,
				#scheduledClass.scheduleID#,
				#scheduledClass.courseID#,
				#createODBCDateTime(thisDateTime)#,
				#arguments.duration#,
				#dayOfWeek(thisDateTime)#,
				'#arguments.note#'
			)
		</cfquery>

		<cfreturn true>
	</cffunction>

	<cffunction name="setDays">
		<cfargument name="date" type="date">

		<cfset var mondayOffset = 0>

		<cfswitch expression=#dayOfWeek(arguments.date)#>
			<cfcase value=1>	<cfset mondayOffset = 1>	</cfcase>
			<cfcase value=2>	<cfset mondayOffset = 0>	</cfcase>
			<cfcase value=3>	<cfset mondayOffset = -1>	</cfcase>
			<cfcase value=4>	<cfset mondayOffset = -2>	</cfcase>
			<cfcase value=5>	<cfset mondayOffset = -3>	</cfcase>
			<cfcase value=6>	<cfset mondayOffset = -4>	</cfcase>
			<cfcase value=7>	<cfset mondayOffset = -5>	</cfcase>
		</cfswitch>

		<!--- ...we can adjust all days of this week accordingly --->
		<cfset newMonday = createDate(Year(Arguments.date), Month(Arguments.date), Day(Arguments.date))>

		<cfset variables.day[2] = dateAdd("D", mondayOffset, newMonday)>
		<cfset variables.day[3] = dateAdd("D", mondayOffset+1, newMonday)>
		<cfset variables.day[4] = dateAdd("D", mondayOffset+2, newMonday)>
		<cfset variables.day[5] = dateAdd("D", mondayOffset+3, newMonday)>
		<cfset variables.day[6] = dateAdd("D", mondayOffset+4, newMonday)>
		<cfset variables.day[7] = dateAdd("D", mondayOffset+5, newMonday)>
	</cffunction>

	<cffunction access="remote" name="loadAltClasses">

		<cfreturn [
			{ID=1, "name"="alt class 1"},
			{ID=22, "name"="alt class 2"},
			{ID=777, "name"="alt class 3"}
		]>
	</cffunction>

	<cffunction name="structHasKey" returntype="boolean">
		<cfargument name="S" type="struct">
		<cfargument name="target" type="string">

		<cftry>
			<cfreturn isQuery(structFind(arguments.S, arguments.target))>

			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction access="remote" name="unlogClass">
		<cfargument name="ID" type="numeric">

		<cfset var Q = "">

		<cfquery datasource="#application.DS#" result="Q">
			delete from StudentLogs
			where ID = #arguments.ID#
		</cfquery>

		<cfreturn true>
	</cffunction>
</cfcomponent>