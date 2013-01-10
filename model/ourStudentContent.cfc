<cfcomponent persistent="true" table="ourStudentContent" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="ourStudentID" column="ourStudentID" type="numeric" ormtype="int"/>
	<cfproperty name="linkText" column="linkText" type="string" ormtype="string"/>
	<cfproperty name="fileName" column="fileName" type="string" ormtype="string"/>
	<cfproperty name="embed" column="embed" type="numeric" ormtype="boolean"/>
	<cfproperty name="embeddedLink" column="embeddedLink" type="string" ormtype="string"/>
	<cfproperty name="sortOrder" column="sortOrder" type="numeric" ormtype="int"/>
</cfcomponent>
