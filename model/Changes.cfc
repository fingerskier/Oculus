<cfcomponent persistent="true" table="Changes"  output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int"/>

	<cfproperty name="TableName" column="TableName" type="string" ormtype="string"/>
	<cfproperty name="OldVal" column="OldVal" type="string" ormtype="string"/>
	<cfproperty name="NewVal" column="NewVal" type="string" ormtype="string"/>
	<cfproperty name="Who" column="Who" type="string" ormtype="string"/>
	<cfproperty name="ChangeDate" column="ChangeDate" type="date" ormtype="timestamp"/>
	<cfproperty name="SubmitPage" column="SubmitPage" type="string" ormtype="string"/>
	<cfproperty name="ColName" column="ColName" type="string" ormtype="string"/>
	<cfproperty name="Record" column="Record" type="numeric" ormtype="int"/>
	<cfproperty name="StudentName" column="StudentName" type="string" ormtype="string"/>
</cfcomponent>
