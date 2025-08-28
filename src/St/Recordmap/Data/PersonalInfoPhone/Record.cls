/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'St.Recordmap.Data.PersonalInfoPhone'
/// on 2025-08-07 at 18:00:19.815 [2025-08-07 18:00:19.815 UTC]
/// by user SuperUser
Class St.Recordmap.Data.PersonalInfoPhone.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Name As %String [ Required ];

Property Surname As %String [ Required ];

Property DateOfBirth As %Date(FORMAT = 3) [ Required ];

Property NationalId As %String;

Property Address As %String(MAXLEN = 100);

Property City As %String;

Property Country As %String;

Property Phone As list Of %String(MAXLEN = 20);

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
<Value>Address</Value>
</Value>
<Value name="7">
<Value>City</Value>
</Value>
<Value name="8">
<Value>Country</Value>
</Value>
<Value name="9">
<Value>Phone</Value>
</Value>
<Value name="10">
<Value>Surname</Value>
</Value>
</Data>
<DataLocation>^St.Recordmap.Data.PE4C5.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^St.Recordmap.Data.PE4C5.RecordD</IdLocation>
<IndexLocation>^St.Recordmap.Data.PE4C5.RecordI</IndexLocation>
<StreamLocation>^St.Recordmap.Data.PE4C5.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
