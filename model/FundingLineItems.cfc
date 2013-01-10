<cfcomponent persistent="true" table="FundingLineItems" output="false">
	<cfproperty name="ID" column="ID" fieldtype="ID" type="numeric" ormtype="int">

	<cfproperty name="RequestID" column="RequestID" type="numeric" ormtype="int"/>
	<cfproperty name="ForWho" column="ForWho" type="string" ormtype="string"/>
	<cfproperty name="Description" column="Description" type="string" ormtype="string"/>
	<cfproperty name="DurableGood" column="DurableGood" type="numeric" ormtype="boolean"/>
	<cfproperty name="ElementID" column="ElementID" type="numeric" ormtype="int"/>
	<cfproperty name="Amount" column="Amount" type="numeric" ormtype="double"/>
	<cfproperty name="CreateDate" column="CreateDate" type="date" ormtype="timestamp"/>
	<cfproperty name="trip" column="trip" type="numeric" ormtype="boolean"/>
</cfcomponent>
