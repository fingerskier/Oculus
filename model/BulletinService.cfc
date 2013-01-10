<cfcomponent output="false" hint="CFBuilder-Generated:Bulletin">

	
	<!----
	BULLETIN SERVICES
	---->
	
	<!---- Add Bulletin ---->
	<cffunction name="createBulletin" returntype="Bulletin">
		<cfargument name="item" type="Bulletin" required="true" />
		<!---- Auto-generated method
		  Insert a new record in Bulletin ---->
		<cfset entitySave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove Bulletin ---->
	<cffunction name="deleteBulletin" returntype="void">
		<cfargument name="ID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ID = ID }>
		<cfset var item=entityLoad("Bulletin",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entityDelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All Bulletin ---->
	<cffunction name="getAllBulletin" returntype="Bulletin[]">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityLoad("Bulletin") />
	</cffunction>

	<!---- Get All Paged Bulletin ---->
	<cffunction name="getBulletin_paged" returntype="Bulletin[]">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityLoad("Bulletin",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get Bulletin ---->
	<cffunction name="getBulletin" returntype="Bulletin">
		 <cfargument name="ID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ID = ID }>
		<cfreturn entityLoad("Bulletin",primaryKeysMap,true)>
	</cffunction>

	<!---- Save Bulletin ---->
	<cffunction name="updateBulletin" returntype="Bulletin">
		<cfargument name="item" type="Bulletin" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update Bulletin ---->
		<cfset entitySave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count Bulletin ---->
	<cffunction name="count" returntype="numeric">
	
		<cfreturn ormexEcuteQuery("select count(*) from Bulletin",true)>
	</cffunction>

</cfcomponent> 
