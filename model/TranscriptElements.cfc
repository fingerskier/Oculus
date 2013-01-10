<cfcomponent persistent="true" table="TranscriptElements" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="TranscriptYearID" column="TranscriptYearID" type="numeric" ormtype="int"/>
	<cfproperty name="Class" column="Class" type="string" ormtype="string"/>
	<cfproperty name="Grade" column="Grade" type="numeric" ormtype="int"/>
	<cfproperty name="Credits" column="Credits" type="numeric" ormtype="double"/>
	<cfproperty name="Hidden" column="Hidden" type="numeric" ormtype="boolean"/>
	<cfproperty name="elementILPID" column="elementILPID" type="numeric" ormtype="int"/>
	<cfproperty name="included" column="included" type="numeric" ormtype="boolean"/>
	<cfproperty name="APcredit" column="APcredit" type="numeric" ormtype="boolean"/>
</cfcomponent>
