<cfcomponent persistent="true" table="ElementRelationship" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="LearningRelationshipID" column="LearningRelationshipID" type="numeric" ormtype="int"/>
	<cfproperty name="ElementILPID" column="ElementILPID" type="numeric" ormtype="int"/>
</cfcomponent>
