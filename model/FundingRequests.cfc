<cfcomponent persistent="true" table="FundingRequests" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="ILPID" column="ILPID" type="numeric" ormtype="int"/>
	<cfproperty name="SemesterID" column="SemesterID" type="numeric" ormtype="int"/>
	<cfproperty name="Payee" column="Payee" type="string" ormtype="string"/>
	<cfproperty name="Address1" column="Address1" type="string" ormtype="string"/>
	<cfproperty name="Address2" column="Address2" type="string" ormtype="string"/>
	<cfproperty name="Status" column="Status" type="numeric" ormtype="int"/>
	<cfproperty name="CreateDate" column="CreateDate" type="date" ormtype="timestamp"/>
	<cfproperty name="CheckRequest" column="CheckRequest" type="numeric" ormtype="boolean"/>
	<cfproperty name="CrossoverFee" column="CrossoverFee" type="numeric" ormtype="boolean"/>
	<cfproperty name="Pcard" column="Pcard" type="numeric" ormtype="boolean"/>
	<cfproperty name="studentID" column="studentID" type="numeric" ormtype="int"/>
	<cfproperty name="submitDate" column="submitDate" type="date" ormtype="timestamp"/>
	<cfproperty name="schoolYear" column="schoolYear" type="numeric" ormtype="int"/>
	<cfproperty name="parentDate" column="parentDate" type="date" ormtype="timestamp"/>
	<cfproperty name="RCdate" column="RCdate" type="date" ormtype="timestamp"/>
	<cfproperty name="trip" column="trip" type="numeric" ormtype="boolean"/>
</cfcomponent>
