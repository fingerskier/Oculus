<cfcomponent persistent="true" table="ourStudents" output="false">
	<cfproperty name="ourStudentID" column="ourStudentID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="studentID" column="studentID" type="numeric" ormtype="int"/>
	<cfproperty name="embed" column="embed" type="numeric" ormtype="boolean"/>
	<cfproperty name="title" column="title" type="string" ormtype="string"/>
	<cfproperty name="description" column="description" type="string" ormtype="string"/>
	<cfproperty name="linkText" column="linkText" type="string" ormtype="string"/>
	<cfproperty name="fileName" column="fileName" type="string" ormtype="string"/>
	<cfproperty name="embeddedLink" column="embeddedLink" type="string" ormtype="string"/>
	<cfproperty name="sortOrder" column="sortOrder" type="numeric" ormtype="int"/>
</cfcomponent>
