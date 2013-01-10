<cfcomponent persistent="true" table="ElementCMCS" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="CMCSID" column="CMCSID" type="numeric" ormtype="int"/>
	<cfproperty name="ElementID" column="ElementID" type="numeric" ormtype="int"/>
</cfcomponent>
