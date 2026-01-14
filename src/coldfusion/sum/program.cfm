<cfsetting enablecfoutputonly="true">
<cfset sum = 0>
<cfloop from="0" to="100" index="i">
	<cfset sum = sum + i>
</cfloop>
<cfoutput>#sum#</cfoutput>
<cfoutput>#chr(10)#</cfoutput>
