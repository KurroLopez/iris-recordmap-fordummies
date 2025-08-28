/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'Demo.Data.CompexUser'
/// on 2025-08-26 at 09:57:15.076 [2025-08-26 09:57:15.076 UTC]
/// by user _SYSTEM
Class Demo.Data.CompexUser.Record Extends (EnsLib.RecordMap.ComplexChild, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Name As %String [ Required ];

Property Surname As %String [ Required ];

Property DateOfBirth As %Date(FORMAT = 3) [ Required ];

Property NationalId As %String;

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ##class(Demo.Data.CompexUser.Record).%OnDelete($$$oidForm({ID})) If $$$ISERR(%ok) Quit
}

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>DateOfBirth</Value>
</Value>
<Value name="5">
<Value>NationalId</Value>
</Value>
<Value name="6">
<Value>Surname</Value>
</Value>
</Data>
<DataLocation>^Demo.Data.CompexUser.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Demo.Data.CompexUser.RecordD</IdLocation>
<IndexLocation>^Demo.Data.CompexUser.RecordI</IndexLocation>
<StreamLocation>^Demo.Data.CompexUser.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
