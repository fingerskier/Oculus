<cfcomponent persistent="true" table="ElementAssessment" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id"/>

	<cfproperty name="CourseAssessmentID" column="CourseAssessmentID" type="numeric" ormtype="int"/>
	<cfproperty name="ElementILPID" column="ElementILPID" type="numeric" ormtype="int"/>
</cfcomponent>
