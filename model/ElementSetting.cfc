<cfcomponent persistent="true" table="ElementSetting" output="false">
	<cfproperty name="ID" column="ID" type="numeric" ormtype="int"fieldtype="id">

	<cfproperty name="LearningSettingID" column="LearningSettingID" type="numeric" ormtype="int"/>
	<cfproperty name="ElementILPID" column="ElementILPID" type="numeric" ormtype="int"/>
</cfcomponent>
