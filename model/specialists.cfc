<cfcomponent persistent="true" table="specialists" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
	<cfproperty name="specialistID" column="specialistID" type="numeric" ormtype="int"/>
</cfcomponent>
