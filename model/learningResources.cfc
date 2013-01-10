<cfcomponent persistent="true" table="learningResources" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="updated" column="updated" type="date" ormtype="timestamp"/>
	<cfproperty name="description" column="description" type="string" ormtype="string"/>
	<cfproperty name="sortOrder" column="sortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="active" column="active" type="numeric" ormtype="boolean"/>
</cfcomponent>
