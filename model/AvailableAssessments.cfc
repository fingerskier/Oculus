<cfcomponent persistent="true" table="AvailableAssessments"  output="false">
	<cfproperty name="GradeLevel" column="GradeLevel" type="numeric" ormtype="int"fieldtype="id"/>
	<cfproperty name="DRA2" column="DRA2" type="numeric" ormtype="boolean"/>
	<cfproperty name="NWEA" column="NWEA" type="numeric" ormtype="boolean"/>
	<cfproperty name="CSAP" column="CSAP" type="numeric" ormtype="boolean"/>
	<cfproperty name="SAT" column="SAT" type="numeric" ormtype="boolean"/>
	<cfproperty name="ACT" column="ACT" type="numeric" ormtype="boolean"/>
	<cfproperty name="KPA" column="KPA" type="numeric" ormtype="boolean"/>
	<cfproperty name="DIBEL" column="DIBEL" type="numeric" ormtype="boolean"/>
	<cfproperty name="Scantron" column="Scantron" type="numeric" ormtype="boolean"/>
	<cfproperty name="EXPLORE" column="EXPLORE" type="numeric" ormtype="boolean"/>
	<cfproperty name="PLANtest" column="PLANtest" type="numeric" ormtype="boolean"/>
</cfcomponent>
