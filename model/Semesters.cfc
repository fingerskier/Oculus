<cfcomponent persistent="true" table="Semesters" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="StartDate" column="StartDate" type="date" ormtype="timestamp"/>
	<cfproperty name="EndDate" column="EndDate" type="date" ormtype="timestamp"/>
	<cfproperty name="SchoolYear" column="SchoolYear" type="numeric" ormtype="int"/>
	<cfproperty name="SemesterNum" column="SemesterNum" type="numeric" ormtype="int"/>
</cfcomponent>
