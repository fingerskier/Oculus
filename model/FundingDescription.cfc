<cfcomponent persistent="true" table="FundingDescription" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="SortOrder" column="SortOrder" type="numeric" ormtype="int"/>
	<cfproperty name="Active" column="Active" type="numeric" ormtype="int"/>
	<cfproperty name="Number" column="Number" type="string" ormtype="string"/>
	<cfproperty name="Text" column="Text" type="string" ormtype="string"/>
	<cfproperty name="TruncText" column="TruncText" type="string" ormtype="string"/>
</cfcomponent>
