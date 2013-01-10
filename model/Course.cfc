component persistent="true" table="Classes" output="false" {
	property name="ID" column="ID" fieldtype="ID" generated="always" generator="increment";
	property name="Created" column="created" type="date" ormtype="timestamp";
	property name="Updated" column="updated" type="date" ormtype="timestamp";
	property name="Active" column="Active" type="numeric" ormtype="boolean";

	property name="AOSID" column="AreaID" type="numeric" ormtype="int";

	property name="Name" column="ClassName" type="string" ormtype="string";
	property name="CourseLevel" column="ClassLevel" type="string" ormtype="string";
	property name="SortOrder" column="SortOrder" default="0" type="numeric" ormtype="int";
	property name="ElemLevel" column="ElemLevel" type="numeric" ormtype="boolean";
	property name="MSLevel" column="MSLevel" type="numeric" ormtype="boolean";
	property name="HSLevel" column="HSLevel" type="numeric" ormtype="boolean";
	property name="Description" column="Description" type="string" ormtype="string";

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
		for (ID in IDs) {
writeLog(text="#ID#|#I#", file="Vision_Debug");
			ORMexecuteQuery("update Course set SortOrder = #I++# where ID = #ID#");
		}
	}
}