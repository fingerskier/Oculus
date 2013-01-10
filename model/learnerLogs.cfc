<cfcomponent persistent="true" table="learnerLogs" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="updated" column="updated" type="date" ormtype="timestamp"/>
	<cfproperty name="comments" column="comments" type="string" ormtype="string"/>
	<cfproperty name="specialistID" column="specialistID" type="numeric" ormtype="int"/>
	<cfproperty name="studentID" column="studentID" type="numeric" ormtype="int"/>
	<cfproperty name="contactType" column="contactType" type="numeric" ormtype="int"/>
	<cfproperty name="contactDate" column="contactDate" type="date" ormtype="timestamp"/>
	<cfproperty name="elementILPID" column="elementILPID" type="numeric" ormtype="int"/>
</cfcomponent>
