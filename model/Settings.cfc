<cfcomponent persistent="true" table="Settings" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int"/>

	<cfproperty name="Name" column="Name" type="string" ormtype="string"/>
	<cfproperty name="SortOrder" column="SortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="active" column="active" type="numeric" ormtype="int"/>
	<cfproperty name="Created" column="Created" type="date" ormtype="timestamp"/>
	<cfproperty name="Updated" column="Updated" type="date" ormtype="timestamp"/>
</cfcomponent>
