/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Modified during compilation of Complex RecordMap 'Demo.Data.PersonaIComplex'
/// on 2025-08-26 at 10:39:09.796 [2025-08-26 10:39:09.796 UTC]
/// by user _SYSTEM
Class Demo.Data.PersonaIComplex.Batch Extends (EnsLib.RecordMap.ComplexBatch, Ens.Request) [ Inheritance = right, ProcedureBlock ]
{

Parameter RECORDMAPGENERATED = 1;

Property PersonalInfo As Demo.Data.PersonaIComplex.PersonalInfo;

Method %OnClose() As %Status [ Private, ServerOnly = 1 ]
{
	Set tStatus = $$$OK
	Try {
		Set tId = ..%Id()
		If ""=tId {
		}
	} Catch ex {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

Storage Default
{
<Data name="BatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PersonalInfo</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
</Data>
<DataLocation>^Demo.Data.PersonaICo9161.BatchD</DataLocation>
<DefaultData>BatchDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Demo.Data.PersonaICo9161.BatchD</IdLocation>
<IndexLocation>^Demo.Data.PersonaICo9161.BatchI</IndexLocation>
<StreamLocation>^Demo.Data.PersonaICo9161.BatchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
