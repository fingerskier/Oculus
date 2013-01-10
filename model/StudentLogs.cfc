<cfcomponent persistent="true" table="StudentLogs" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="ScheduledClassID" column="ScheduledClassID" type="numeric" ormtype="int"/>
	<cfproperty name="ScheduleID" column="ScheduleID" type="numeric" ormtype="int"/>
	<cfproperty name="ClassID" column="ClassID" type="numeric" ormtype="int"/>
	<cfproperty name="StudyDate" column="StudyDate" type="date" ormtype="timestamp"/>
	<cfproperty name="TimeSpent" column="TimeSpent" type="numeric" ormtype="int"/>
	<cfproperty name="DayOfWeek" column="DayOfWeek" type="numeric" ormtype="int"/>
	<cfproperty name="Note" column="Note" type="string" ormtype="string"/>
	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="updated" column="updated" type="date" ormtype="timestamp"/>
</cfcomponent>
