<cfcomponent persistent="true" table="Transcripts" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
	<cfproperty name="FirstYear" column="FirstYear" type="numeric" ormtype="int"/>
	<cfproperty name="LastYear" column="LastYear" type="numeric" ormtype="int"/>
	<cfproperty name="OtherSchools" column="OtherSchools" type="string" ormtype="string"/>
	<cfproperty name="HideOtherSchools" column="HideOtherSchools" type="numeric" ormtype="boolean"/>
	<cfproperty name="Validations" column="Validations" type="string" ormtype="string"/>
	<cfproperty name="HideValidations" column="HideValidations" type="numeric" ormtype="boolean"/>
	<cfproperty name="HideTestScores" column="HideTestScores" type="numeric" ormtype="boolean"/>
	<cfproperty name="CSAPHead" column="CSAPHead" type="string" ormtype="string"/>
	<cfproperty name="CSAPDate" column="CSAPDate" type="date" ormtype="timestamp"/>
	<cfproperty name="CSAPread" column="CSAPread" type="numeric" ormtype="int"/>
	<cfproperty name="CSAPwrit" column="CSAPwrit" type="numeric" ormtype="int"/>
	<cfproperty name="CSAPmath" column="CSAPmath" type="numeric" ormtype="int"/>
	<cfproperty name="CSAPscnc" column="CSAPscnc" type="numeric" ormtype="int"/>
	<cfproperty name="HideCSAP" column="HideCSAP" type="numeric" ormtype="boolean"/>
	<cfproperty name="SATHead" column="SATHead" type="string" ormtype="string"/>
	<cfproperty name="SATdate" column="SATdate" type="date" ormtype="timestamp"/>
	<cfproperty name="SATread" column="SATread" type="numeric" ormtype="int"/>
	<cfproperty name="SATwrit" column="SATwrit" type="numeric" ormtype="int"/>
	<cfproperty name="SATmath" column="SATmath" type="numeric" ormtype="int"/>
	<cfproperty name="HideSAT" column="HideSAT" type="numeric" ormtype="boolean"/>
	<cfproperty name="ACTHead" column="ACTHead" type="string" ormtype="string"/>
	<cfproperty name="ACTdate" column="ACTdate" type="date" ormtype="timestamp"/>
	<cfproperty name="ACTread" column="ACTread" type="numeric" ormtype="int"/>
	<cfproperty name="ACTwrit" column="ACTwrit" type="numeric" ormtype="int"/>
	<cfproperty name="ACTmath" column="ACTmath" type="numeric" ormtype="int"/>
	<cfproperty name="ACTscnc" column="ACTscnc" type="numeric" ormtype="int"/>
	<cfproperty name="HideACT" column="HideACT" type="numeric" ormtype="boolean"/>
	<cfproperty name="CreditDistribution" column="CreditDistribution" type="string" ormtype="string"/>
	<cfproperty name="HideCreditDistribution" column="HideCreditDistribution" type="numeric" ormtype="boolean"/>
	<cfproperty name="HidePursuits" column="HidePursuits" type="numeric" ormtype="boolean"/>
	<cfproperty name="ACTcomp" column="ACTcomp" type="numeric" ormtype="int"/>
	<cfproperty name="showGradeLevel" column="showGradeLevel" type="numeric" ormtype="boolean"/>
	<cfproperty name="graduationDate" column="graduationDate" type="date" ormtype="timestamp"/>
</cfcomponent>
