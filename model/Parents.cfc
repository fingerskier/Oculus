<cfcomponent persistent="true" table="Parents" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="ParentID" column="ParentID" type="numeric" ormtype="int"/>
	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
</cfcomponent>
