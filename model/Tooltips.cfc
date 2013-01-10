<cfcomponent persistent="true" table="Tooltips" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="FieldName" column="FieldName" type="string" ormtype="string"/>
	<cfproperty name="TipText" column="TipText" type="string" ormtype="string"/>
</cfcomponent>
