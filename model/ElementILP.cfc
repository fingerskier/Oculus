<cfcomponent persistent="true" table="ElementILP" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int"/>

	<cfproperty name="ILPID" column="ILPID" type="numeric" ormtype="int"/>
	<cfproperty name="AOSID" column="AOSID" type="numeric" ormtype="int"/>
	<cfproperty name="ClassID" column="ClassID" type="numeric" ormtype="int"/>
	<cfproperty name="Expectation" column="Expectation" type="string" ormtype="string"/>
	<cfproperty name="Relationship" column="Relationship" type="numeric" ormtype="int"/>
	<cfproperty name="Resources" column="Resources" type="string" ormtype="string"/>
	<cfproperty name="Setting" column="Setting" type="numeric" ormtype="int"/>
	<cfproperty name="Actions" column="Actions" type="string" ormtype="string"/>
	<cfproperty name="Assessment" column="Assessment" type="string" ormtype="string"/>
	<cfproperty name="Crossover" column="Crossover" type="numeric" ormtype="int"/>
	<cfproperty name="Updated" column="Updated" type="numeric" ormtype="boolean"/>
	<cfproperty name="Archived" column="Archived" type="numeric" ormtype="boolean"/>
	<cfproperty name="Grade" column="Grade" type="numeric" ormtype="int"/>
	<cfproperty name="Credits" column="Credits" type="numeric" ormtype="double"/>
	<cfproperty name="Goals" column="Goals" type="string" ormtype="string"/>
	<cfproperty name="APcredit" column="APcredit" type="numeric" ormtype="boolean"/>
</cfcomponent>
