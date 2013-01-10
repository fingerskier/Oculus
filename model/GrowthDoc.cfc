<cfcomponent persistent="true" table="GrowthDoc" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="ILPID" column="ILPID" type="numeric" ormtype="int"/>
	<cfproperty name="ILPelementID" column="ILPelementID" type="numeric" ormtype="int"/>
	<cfproperty name="Note" column="Note" type="string" ormtype="string"/>
</cfcomponent>
