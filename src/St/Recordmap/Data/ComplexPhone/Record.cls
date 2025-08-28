/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'St.Recordmap.Data.ComplexPhone'
/// on 2025-08-26 at 09:59:24.408 [2025-08-26 09:59:24.408 UTC]
/// by user _SYSTEM
Class St.Recordmap.Data.ComplexPhone.Record Extends (EnsLib.RecordMap.ComplexChild, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property CountryCode As %String;

Property Prefix As %String;

Property Number As %String;

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ##class(St.Recordmap.Data.ComplexPhone.Record).%OnDelete($$$oidForm({ID})) If $$$ISERR(%ok) Quit
}

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CountryCode</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Number</Value>
</Value>
<Value name="5">
<Value>Prefix</Value>
</Value>
</Data>
<DataLocation>^St.Recordmap.Data.C8165.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^St.Recordmap.Data.C8165.RecordD</IdLocation>
<IndexLocation>^St.Recordmap.Data.C8165.RecordI</IndexLocation>
<StreamLocation>^St.Recordmap.Data.C8165.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
