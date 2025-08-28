/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'St.Recordmap.Data.CompexUser'
/// on 2025-08-26 at 09:57:15.076 [2025-08-26 09:57:15.076 UTC]
/// by user _SYSTEM
Class St.Recordmap.Data.CompexUser.Record Extends (EnsLib.RecordMap.ComplexChild, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Name As %String [ Required ];

Property Surname As %String [ Required ];

Property DateOfBirth As %Date(FORMAT = 3) [ Required ];

Property NationalId As %String;

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ##class(St.Recordmap.Data.CompexUser.Record).%OnDelete($$$oidForm({ID})) If $$$ISERR(%ok) Quit
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
<DataLocation>^St.Recordmap.Data.C7D31.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^St.Recordmap.Data.C7D31.RecordD</IdLocation>
<IndexLocation>^St.Recordmap.Data.C7D31.RecordI</IndexLocation>
<StreamLocation>^St.Recordmap.Data.C7D31.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
