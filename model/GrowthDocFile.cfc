<cfcomponent persistent="true" table="GrowthDocFile" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="GrowthDocID" column="GrowthDocID" type="numeric" ormtype="int"/>
	<cfproperty name="DocMonth" column="DocMonth" type="numeric" ormtype="int"/>
	<cfproperty name="Path" column="Path" type="string" ormtype="string"/>
	<cfproperty name="Type" column="Type" type="string" ormtype="string"/>
	<cfproperty name="Note" column="Note" type="string" ormtype="string"/>
	<cfproperty name="SScomments" column="SScomments" type="string" ormtype="string"/>
	<cfproperty name="HQcomments" column="HQcomments" type="string" ormtype="string"/>
	<cfproperty name="Viewers" column="Viewers" type="string" ormtype="string"/>
</cfcomponent>
