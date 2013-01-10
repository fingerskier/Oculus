<cfcomponent persistent="true" table="ElementResource" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int" fieldtype="id">

	<cfproperty name="LearningResourceID" column="LearningResourceID" type="numeric" ormtype="int"/>
	<cfproperty name="ElementILPID" column="ElementILPID" type="numeric" ormtype="int"/>
</cfcomponent>
