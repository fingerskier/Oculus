<cfcomponent persistent="true" table="userLog" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="created" column="created" type="date" ormtype="timestamp"/>
	<cfproperty name="userID" column="userID" type="numeric" ormtype="int"/>
	<cfproperty name="online" column="online" type="numeric" ormtype="boolean"/>
</cfcomponent>
