<cfcomponent persistent="true" table="RCs" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
	<cfproperty name="RCID" column="RCID" type="numeric" ormtype="int"/>
	<cfproperty name="StudentInfoID" column="StudentInfoID" type="numeric" ormtype="int"/>
</cfcomponent>
