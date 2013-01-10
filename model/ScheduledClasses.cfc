<cfcomponent persistent="true" table="ScheduledClasses" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="CourseID" column="CourseID" type="numeric" ormtype="int"/>
	<cfproperty name="DayOfWeek" column="DayOfWeek" type="numeric" ormtype="int"/>
	<cfproperty name="StartTime" column="StartTime" type="string" ormtype="string"/>
	<cfproperty name="Duration" column="Duration" type="numeric" ormtype="int"/>
	<cfproperty name="ScheduleID" column="ScheduleID" type="numeric" ormtype="int"/>
	<cfproperty name="Updated" column="Updated" type="numeric" ormtype="boolean"/>
	<cfproperty name="Archived" column="Archived" type="numeric" ormtype="boolean"/>
</cfcomponent>
