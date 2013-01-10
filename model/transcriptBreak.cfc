<cfcomponent persistent="true" table="transcriptBreak" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="transcriptID" column="transcriptID" type="numeric" ormtype="int"/>
	<cfproperty name="breakID" column="breakID" type="string" ormtype="string"/>
</cfcomponent>
