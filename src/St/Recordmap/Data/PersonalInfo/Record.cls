/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'St.Recordmap.Data.PersonalInfo'
/// on 2025-08-04 at 08:37:00.646 [2025-08-04 08:37:00.646 UTC]
/// by user SuperUser
Class St.Recordmap.Data.PersonalInfo.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Name As %String [ Required ];

Property Surname As %String [ Required ];

Property DateOfBirth As %Date(FORMAT = 3) [ Required ];

Property NationalId As %String;

Property Address As %String(MAXLEN = 100);

Property City As %String;

Property Country As %String;

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
<Value>Surname</Value>
</Value>
</Data>
<DataLocation>^St.Recordmap.Data.P15D0.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^St.Recordmap.Data.P15D0.RecordD</IdLocation>
<IndexLocation>^St.Recordmap.Data.P15D0.RecordI</IndexLocation>
<StreamLocation>^St.Recordmap.Data.P15D0.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
