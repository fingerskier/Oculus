<cfcomponent persistent="true" table="StudentSchedules" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
	<cfproperty name="SchoolYear" column="SchoolYear" type="numeric" ormtype="int"/>
	<cfproperty name="Semester" column="Semester" type="numeric" ormtype="int"/>
	<cfproperty name="StartDate" column="StartDate" type="date" ormtype="timestamp"/>
	<cfproperty name="SemesterID" column="SemesterID" type="numeric" ormtype="int"/>
	<cfproperty name="Updated" column="Updated" type="numeric" ormtype="boolean"/>
	<cfproperty name="Archived" column="Archived" type="numeric" ormtype="boolean"/>
	<cfproperty name="LastTouched" column="LastTouched" type="date" ormtype="timestamp"/>
</cfcomponent>
