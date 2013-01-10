<cfcomponent persistent="true" table="Relationships" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="Name" column="Name" type="string" ormtype="string"/>
	<cfproperty name="SortOrder" column="SortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="active" column="active" type="numeric" ormtype="int"/>
	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="updated" column="updated" type="date" ormtype="timestamp"/>
</cfcomponent>
