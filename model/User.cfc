component persistent="true" table="SiteUsers" output="false" {
	property name="ID" column="ID" fieldtype="ID" generated="always" generator="increment";
	property name="Created" column="created" type="date" ormtype="timestamp";
	property name="Updated" column="updated" type="date" ormtype="timestamp";

	property name="FirstName" column="FirstName" type="string" ormtype="string";
	property name="LastName" column="LastName" type="string" ormtype="string";
	property name="Address" column="Address" type="string" ormtype="string";
	property name="City" column="City" type="string" ormtype="string";
	property name="State" column="State" type="string" ormtype="string";
	property name="Zip" column="Zip" type="string" ormtype="string";
	property name="Phone" column="Phone" type="string" ormtype="string";
	property name="Cell" column="Cell" type="string" ormtype="string";
	property name="Username" column="Username" type="string" ormtype="string";
	property name="Password" column="Password" type="string" ormtype="string";
	property name="Email" column="Email" type="string" ormtype="string";
	property name="Role" column="Role" type="string" ormtype="string";
	property name="Online" column="Online" type="numeric" ormtype="boolean";
	property name="StudentNumber" column="StudentNumber" type="numeric" ormtype="int";
	property name="Grade" column="Grade" type="numeric" ormtype="int";
	property name="Birthdate" column="Birthdate" type="date" ormtype="timestamp";
	property name="IEP" column="IEP" type="numeric" ormtype="boolean";
	property name="IEPdate" column="IEPdate" type="date" ormtype="timestamp";
	property name="Active" column="Active" type="numeric" ormtype="boolean";
	property name="Funding" column="Funding" type="numeric" ormtype="double";
	property name="PublicDisplay" column="publicDisplay" type="numeric" ormtype="boolean";
	property name="Accessible" column="accessible" type="numeric" ormtype="boolean";
	property name="Title" column="title" type="string" ormtype="string";
	property name="PublicRecord" column="PublicRecord" type="numeric" ormtype="boolean";
	property name="PublicAddress" column="PublicAddress" type="numeric" ormtype="boolean";
	property name="PublicPhone" column="PublicPhone" type="numeric" ormtype="boolean";
	property name="PublicEmail" column="PublicEmail" type="numeric" ormtype="boolean";
	property name="WeeklyChange" column="WeeklyChange" type="numeric" ormtype="boolean";

	function preInsert() {
		setCreated(now());
		setUpdated(now());
	}

	function preUpdate() {
		setUpdated(now());
	}
}