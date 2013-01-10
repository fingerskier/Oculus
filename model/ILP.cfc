<cfcomponent persistent="true" table="ILP" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="StudentID" column="StudentID" type="numeric" ormtype="int"/>
	<cfproperty name="Semester" column="Semester" type="numeric" ormtype="int"/>
	<cfproperty name="SchoolYear" column="SchoolYear" type="numeric" ormtype="int"/>
	<cfproperty name="LearnerHistory" column="LearnerHistory" type="string" ormtype="string"/>
	<cfproperty name="Goals" column="Goals" type="string" ormtype="string"/>
	<cfproperty name="SpecialEd" column="SpecialEd" type="string" ormtype="string"/>
	<cfproperty name="Phonemic" column="Phonemic" type="string" ormtype="string"/>
	<cfproperty name="Phonics" column="Phonics" type="string" ormtype="string"/>
	<cfproperty name="Fluency" column="Fluency" type="string" ormtype="string"/>
	<cfproperty name="Vocabulary" column="Vocabulary" type="string" ormtype="string"/>
	<cfproperty name="TextComp" column="TextComp" type="string" ormtype="string"/>
	<cfproperty name="ET_R" column="ET_R" type="numeric" ormtype="boolean"/>
	<cfproperty name="ET_W" column="ET_W" type="numeric" ormtype="boolean"/>
	<cfproperty name="ET_M" column="ET_M" type="numeric" ormtype="boolean"/>
	<cfproperty name="ET_S" column="ET_S" type="numeric" ormtype="boolean"/>
	<cfproperty name="OS_M" column="OS_M" type="numeric" ormtype="boolean"/>
	<cfproperty name="OS_S" column="OS_S" type="numeric" ormtype="boolean"/>
	<cfproperty name="TD_R" column="TD_R" type="numeric" ormtype="boolean"/>
	<cfproperty name="TD_W" column="TD_W" type="numeric" ormtype="boolean"/>
	<cfproperty name="TD_M" column="TD_M" type="numeric" ormtype="boolean"/>
	<cfproperty name="TD_S" column="TD_S" type="numeric" ormtype="boolean"/>
	<cfproperty name="UM_M" column="UM_M" type="numeric" ormtype="boolean"/>
	<cfproperty name="Updated" column="Updated" type="numeric" ormtype="boolean"/>
	<cfproperty name="Archived" column="Archived" type="numeric" ormtype="boolean"/>
	<cfproperty name="LastTouched" column="LastTouched" type="date" ormtype="timestamp"/>
	<cfproperty name="OS_W" column="OS_W" type="numeric" ormtype="boolean"/>
	<cfproperty name="semesterID" column="semesterID" type="numeric" ormtype="int"/>
	<cfproperty name="Created" column="Created" type="date" ormtype="timestamp"/>
	<cfproperty name="ILP" column="ILP" type="numeric" ormtype="boolean"/>
	<cfproperty name="IEP" column="IEP" type="numeric" ormtype="boolean"/>
	<cfproperty name="GradesLocked" column="GradesLocked" type="numeric" ormtype="boolean"/>
</cfcomponent>
