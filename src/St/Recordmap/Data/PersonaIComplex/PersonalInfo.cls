/// RECORDMAP: Modified during compilation of Complex RecordMap 'St.Recordmap.Data.PersonaIComplex'
/// on 2025-08-26 at 10:39:09.821 [2025-08-26 10:39:09.821 UTC]
/// by user _SYSTEM
Class St.Recordmap.Data.PersonaIComplex.PersonalInfo Extends (EnsLib.RecordMap.ComplexSequence, %XML.Adaptor) [ Inheritance = right, ProcedureBlock ]
{

Property User As St.Recordmap.Data.CompexUser.Record [ Required ];

Property Phone As array Of St.Recordmap.Data.ComplexPhone.Record(MAXREPEATS = 5);

Property Address As array Of St.Recordmap.Data.ComplexAddress.Record(MAXREPEATS = 2);

Method PutSequence(pIOStream As %IO.DeviceStream) As %Status
{
	Set tStatus = $$$OK
	Try {
		If $IsObject(..User) {
			Set tStatus = ##class(St.Recordmap.Data.CompexUser).PutObject(pIOStream,..User,0)
			If $$$ISERR(tStatus) Quit
		}
		Set seqKey = ""
		For {
			Set tElement = ..Phone.GetNext(.seqKey)
			If (seqKey = "") Quit
			If $IsObject(tElement) {
				Set tStatus = ##class(St.Recordmap.Data.ComplexPhone).PutObject(pIOStream,tElement,0)
				If $$$ISERR(tStatus) Quit
			}
			Set tStatus = ..Phone.%UnSwizzleAt(seqKey)
			If $$$ISERR(tStatus) Quit
		}
		If $$$ISERR(tStatus) Quit
		Set seqKey = ""
		For {
			Set tElement = ..Address.GetNext(.seqKey)
			If (seqKey = "") Quit
			If $IsObject(tElement) {
				Set tStatus = ##class(St.Recordmap.Data.ComplexAddress).PutObject(pIOStream,tElement,0)
				If $$$ISERR(tStatus) Quit
			}
			Set tStatus = ..Address.%UnSwizzleAt(seqKey)
			If $$$ISERR(tStatus) Quit
		}
		If $$$ISERR(tStatus) Quit
	}
	Catch {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

Trigger OnDeleteTrigger [ Event = DELETE ]
{
	Set %ok = ##class(St.Recordmap.Data.PersonaIComplex.PersonalInfo).%OnDelete($$$oidForm({ID}))
}

Parameter RECORDMAPGENERATED = 1;

Method %OnClose() As %Status [ Private, ServerOnly = 1 ]
{
	Set tStatus = $$$OK
	Try {
		Set tId = ..%Id()
		If ""=tId {
			Set seqKey = ""
			For {
				Set tElement = ..Phone.GetNext(.seqKey)
				If (seqKey = "") Quit
				If $IsObject(tElement) && (""'=tElement.%Id()) {
					Set tElementId = tElement.%Id()
					Set tStatus = ##class(St.Recordmap.Data.ComplexPhone.Record).%DeleteId(tElementId)
				}
				If $$$ISERR(tStatus) Quit
			}
			Set seqKey = ""
			For {
				Set tElement = ..Address.GetNext(.seqKey)
				If (seqKey = "") Quit
				If $IsObject(tElement) && (""'=tElement.%Id()) {
					Set tElementId = tElement.%Id()
					Set tStatus = ##class(St.Recordmap.Data.ComplexAddress.Record).%DeleteId(tElementId)
				}
				If $$$ISERR(tStatus) Quit
			}
		}
	} Catch ex {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

Storage Default
{
<Data name="Address">
<Attribute>Address</Attribute>
<Structure>subnode</Structure>
<Subscript>"Address"</Subscript>
</Data>
<Data name="PersonalInfoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>User</Value>
</Value>
</Data>
<Data name="Phone">
<Attribute>Phone</Attribute>
<Structure>subnode</Structure>
<Subscript>"Phone"</Subscript>
</Data>
<DataLocation>^St.RecordmapE52F.PersonalInfoD</DataLocation>
<DefaultData>PersonalInfoDefaultData</DefaultData>
<IdLocation>^St.RecordmapE52F.PersonalInfoD</IdLocation>
<IndexLocation>^St.RecordmapE52F.PersonalInfoI</IndexLocation>
<StreamLocation>^St.RecordmapE52F.PersonalInfoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
