component persistent="true" table="AreasOfStudy" output="false" {
	property name="ID" column="ID" fieldtype="ID" generated="always" generator="increment";
	property name="Created" column="Created" type="date" ormtype="timestamp";
	property name="Updated" column="Updated" type="date" ormtype="timestamp";

	property name="Name" column="AreaName" type="string" ormtype="string";
	property name="SortOrder" column="SortOrder" default="0" type="numeric" ormtype="int";
	property name="Active" column="Active" type="numeric" ormtype="boolean";

	function preInsert() {
		setCreated(now());
		setUpdated(now());
	}

	function preUpdate() {
		setUpdated(now());
	}

	remote function setSortOrder() {
		var I = 0;
		var ID = 0;
		var IDs = arguments["IDs[]"];

		for (ID in IDs)
			ORMexecuteQuery("update AreaOfStudy set SortOrder = #I++# where ID = #ID#");
	}
}