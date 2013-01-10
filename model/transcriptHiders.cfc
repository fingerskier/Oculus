<cfcomponent persistent="true" table="transcriptHiders" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="transcriptID" column="transcriptID" type="numeric" ormtype="int"/>
	<cfproperty name="elementID" column="elementID" type="string" ormtype="string"/>
</cfcomponent>
