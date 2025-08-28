/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'Demo.Data.ComplexUser'
/// on 2025-08-26 at 08:46:10.632 [2025-08-26 08:46:10.632 UTC]
/// by user _SYSTEM
Class Demo.Data.ComplexUser.Record.USER Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock ]
{

Property Name As %String [ Required ];

Property Surname As %String [ Required ];

Property DateOfBirth As %Date(FORMAT = 3) [ Required ];

Property NationalId As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="USERState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Surname</Value>
</Value>
<Value name="3">
<Value>DateOfBirth</Value>
</Value>
<Value name="4">
<Value>NationalId</Value>
</Value>
</Data>
<State>USERState</State>
<StreamLocation>^Demo.Data.ComplexUser15DD.USERS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
