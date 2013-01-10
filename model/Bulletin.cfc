<cfcomponent persistent="true" table="Bulletin"  schema="dbo" output="false">
	<!---- properties ---->
	
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int"fieldtype="id"/> 
	<cfproperty name="Created" column="Created" type="date" ormtype="timestamp"/> 
	<cfproperty name="Updated" column="Updated" type="date" ormtype="timestamp"/> 
	<cfproperty name="Title" column="Title" type="string" ormtype="string"/> 
	<cfproperty name="Body" column="Body" type="string" ormtype="string"/> 
	<cfproperty name="UserLevel" column="UserLevel" type="string" ormtype="string"/> 	
</cfcomponent> 
