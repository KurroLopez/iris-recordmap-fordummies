/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'Demo.Data.ComplexAddress'
/// on 2025-08-26 at 10:06:48.878 [2025-08-26 10:06:48.878 UTC]
/// by user _SYSTEM
Class Demo.Data.ComplexAddress.Record Extends (EnsLib.RecordMap.ComplexChild, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Address As %String(MAXLEN = 100);

Property City As %String(MAXLEN = 100);

Property Zip As %String;

Property State As %String;

Property Country As %String;

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ##class(Demo.Data.ComplexAddress.Record).%OnDelete($$$oidForm({ID})) If $$$ISERR(%ok) Quit
}

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Address</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Zip</Value>
</Value>
<Value name="5">
<Value>State</Value>
</Value>
<Value name="6">
<Value>Country</Value>
</Value>
<Value name="7">
<Value>City</Value>
</Value>
</Data>
<DataLocation>^Demo.Data.ComplexAdF79D.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Demo.Data.ComplexAdF79D.RecordD</IdLocation>
<IndexLocation>^Demo.Data.ComplexAdF79D.RecordI</IndexLocation>
<StreamLocation>^Demo.Data.ComplexAdF79D.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
