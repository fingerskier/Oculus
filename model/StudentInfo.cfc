<cfcomponent persistent="true" table="StudentInfo" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
	<cfproperty name="SemesterID" column="SemesterID" type="numeric" ormtype="int"/>
	<cfproperty name="Created" column="Created" type="date" ormtype="timestamp"/>
	<cfproperty name="Updated" column="Updated" type="date" ormtype="timestamp"/>
	<cfproperty name="FirstName" column="FirstName" type="string" ormtype="string"/>
	<cfproperty name="LastName" column="LastName" type="string" ormtype="string"/>
	<cfproperty name="Address" column="Address" type="string" ormtype="string"/>
	<cfproperty name="City" column="City" type="string" ormtype="string"/>
	<cfproperty name="State" column="State" type="string" ormtype="string"/>
	<cfproperty name="Zip" column="Zip" type="string" ormtype="string"/>
	<cfproperty name="Phone" column="Phone" type="string" ormtype="string"/>
	<cfproperty name="Cell" column="Cell" type="string" ormtype="string"/>
	<cfproperty name="Email" column="Email" type="string" ormtype="string"/>
	<cfproperty name="StudentNumber" column="StudentNumber" type="numeric" ormtype="int"/>
	<cfproperty name="Grade" column="Grade" type="numeric" ormtype="int"/>
	<cfproperty name="IEP" column="IEP" type="numeric" ormtype="boolean"/>
	<cfproperty name="IEPdate" column="IEPdate" type="date" ormtype="timestamp"/>
</cfcomponent>
