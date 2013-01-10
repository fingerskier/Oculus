<cfcomponent persistent="true" table="TranscriptYears" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="TranscriptID" column="TranscriptID" type="numeric" ormtype="int"/>
	<cfproperty name="GradeLevel" column="GradeLevel" type="string" ormtype="string"/>
	<cfproperty name="SchoolYear" column="SchoolYear" type="numeric" ormtype="int"/>
	<cfproperty name="Pursuits" column="Pursuits" type="string" ormtype="string"/>
	<cfproperty name="Hidden" column="Hidden" type="numeric" ormtype="boolean"/>
</cfcomponent>
