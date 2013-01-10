<cfcomponent persistent="true" table="RTI" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="Updated" column="Updated" type="date" ormtype="timestamp"/>
	<cfproperty name="Standard" column="Standard" type="string" ormtype="string"/>
	<cfproperty name="SortOrder" column="SortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="Active" column="Active" type="numeric" ormtype="int"/>
</cfcomponent>
