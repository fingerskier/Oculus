<cfcomponent persistent="true" table="ExcludedDays" output="false">
	<cfproperty name="ID" column="ID" fieldtype="id" type="numeric" ormtype="int">

	<cfproperty name="ExcludedDay" column="ExcludedDay" type="date" ormtype="timestamp"/>
	<cfproperty name="SchoolYear" column="SchoolYear" type="numeric" ormtype="int"/>
	<cfproperty name="Note" column="Note" type="string" ormtype="string"/>
</cfcomponent>
