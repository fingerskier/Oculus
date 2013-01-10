<cfcomponent persistent="true" table="menuCategories" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="updated" column="updated" type="date" ormtype="timestamp"/>
	<cfproperty name="sortOrder" column="sortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="active" column="active" type="numeric" ormtype="boolean"/>
	<cfproperty name="description" column="description" type="string" ormtype="string"/>
</cfcomponent>
