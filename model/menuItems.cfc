<cfcomponent persistent="true" table="menuItems" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="updated" column="updated" type="date" ormtype="timestamp"/>
	<cfproperty name="sortOrder" column="sortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="active" column="active" type="numeric" ormtype="boolean"/>
	<cfproperty name="categoryID" column="categoryID" type="numeric" ormtype="int"/>
	<cfproperty name="display" column="display" type="string" ormtype="string"/>
	<cfproperty name="href" column="href" type="string" ormtype="string"/>
	<cfproperty name="quickHref" column="quickHref" type="string" ormtype="string"/>
	<cfproperty name="UserLevel" column="UserLevel" type="string" ormtype="string"/>
</cfcomponent>
