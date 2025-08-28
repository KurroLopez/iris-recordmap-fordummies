/// 
Class St.Recordmap.Data.PersonaIComplex Extends EnsLib.RecordMap.ComplexMap
{

Parameter BATCHCLASS = "St.Recordmap.Data.PersonaIComplex.Batch";

ClassMethod PutBatch(pIOStream As %IO.DeviceStream, pBatch As EnsLib.RecordMap.ComplexBatch) As %Status
{
	Set tStatus = $$$OK
	Try {
		If '$IsObject($get(pBatch)) Set tStatus = $$$ERROR($$$ObjectInstanceRequired) Quit
		If '$IsObject(pIOStream) {
			Set tFilename = pIOStream
			Set pIOStream = ##class(%IO.FileStream).%New()
			Do pIOStream.Open(tFilename,"WAE",,"UTF-8",.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		If $IsObject(pBatch.PersonalInfo) {
			Set tStatus = pBatch.PersonalInfo.PutSequence(pIOStream)
			If $$$ISERR(tStatus) Quit
		}
		Do pIOStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	} Catch ex {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

ClassMethod GetBatch(pIOStream As %IO.DeviceStream, pTimeout As %Numeric = -1, Output pBatch As EnsLib.RecordMap.ComplexBatch, ByRef pLookAhead As %String = "") As %Status
{
	Set tStatus = $$$OK
	Try {
		If '$IsObject(pIOStream) {
			Set tFilename = pIOStream
			Set pIOStream = ##class(%IO.FileStream).%New()
			Do pIOStream.Open(tFilename,,pTimeout,"UTF-8",.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set pIOStream.CharEncoding = "UTF-8"
		Set pBatch = ##class(St.Recordmap.Data.PersonaIComplex.Batch).%New()
		Set pBatch.%Source = pIOStream.Name
		Set pLookAhead = $get(pLookAhead)
		If (5 > $length(pLookAhead)) {
			Set pLookAhead = pLookAhead _ pIOStream.Read(5-$length(pLookAhead),pTimeout,.tStatus)
			If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"PersonalInfo","St.Recordmap.Data.PersonaIComplex.PersonalInfo",$classname()),tStatus) Quit
		}
		If ($extract(pLookAhead,1,5)="USER|") {
			Set tStatus = ..getSeqPersonalInfo(pIOStream,.tSequence,.pLookAhead,pTimeout)
			If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"PersonalInfo","St.Recordmap.Data.PersonaIComplex.PersonalInfo",$classname()),tStatus) Quit
			Set pBatch.PersonalInfo = tSequence
		}
	} Catch {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

ClassMethod getSeqPersonalInfo(pIOStream As %IO.DeviceStream, Output pSequence As EnsLib.RecordMap.ComplexSequence, ByRef pLookAhead As %String = "", pBatch As EnsLib.RecordMap.ComplexBatch, pTimeout As %Numeric = -1) As %Status [ Private ]
{
	Set tStatus = $$$OK
	Try {
		Set pSequence = ##class(St.Recordmap.Data.PersonaIComplex.PersonalInfo).%New()
		Set tStatus = ##class(St.Recordmap.Data.CompexUser).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
		If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexBasic,"User","St.Recordmap.Data.CompexUser",$classname()),tStatus) Quit
		Set pSequence.User = tObject
		If (6 > $length(pLookAhead)) {
			Set pLookAhead = pLookAhead _ pIOStream.Read(6-$length(pLookAhead),pTimeout,.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tCount = 0
		While ($extract(pLookAhead,1,6) = "PHONE|") {
			Set tStatus = ##class(St.Recordmap.Data.ComplexPhone).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
			Set tCount = tCount + 1
			If $$$ISERR(tStatus) Quit
			If (5 < tCount) {
				Set tStatus = $$$ERROR($$$EnsRecordMapErrRepeatMax,5,"Phone")
				Quit
			}
			Set tStatus = tObject.%Save()
			If $$$ISERR(tStatus) Quit
			Set tStatus = pSequence.Phone.SetAt(tObject,tCount)
			If $$$ISERR(tStatus) Quit
			Set tStatus = pSequence.Phone.%UnSwizzleAt(tCount)
			If $$$ISERR(tStatus) Quit
			If (6 > $length(pLookAhead)) {
				Set pLookAhead = pLookAhead _ pIOStream.Read(6-$length(pLookAhead),pTimeout,.tStatus)
				If $$$ISERR(tStatus) Quit
			}
		}
		If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexRepeating,"Phone","St.Recordmap.Data.ComplexPhone",$classname(),tCount),tStatus) Quit
		If (5 > $length(pLookAhead)) {
			Set pLookAhead = pLookAhead _ pIOStream.Read(5-$length(pLookAhead),pTimeout,.tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tCount = 0
		While ($extract(pLookAhead,1,5) = "ADDR|") {
			Set tStatus = ##class(St.Recordmap.Data.ComplexAddress).GetObject(pIOStream,.tObject,pTimeout,.pLookAhead)
			Set tCount = tCount + 1
			If $$$ISERR(tStatus) Quit
			If (2 < tCount) {
				Set tStatus = $$$ERROR($$$EnsRecordMapErrRepeatMax,2,"Address")
				Quit
			}
			Set tStatus = tObject.%Save()
			If $$$ISERR(tStatus) Quit
			Set tStatus = pSequence.Address.SetAt(tObject,tCount)
			If $$$ISERR(tStatus) Quit
			Set tStatus = pSequence.Address.%UnSwizzleAt(tCount)
			If $$$ISERR(tStatus) Quit
			If (5 > $length(pLookAhead)) {
				Set pLookAhead = pLookAhead _ pIOStream.Read(5-$length(pLookAhead),pTimeout,.tStatus)
				If $$$ISERR(tStatus) Quit
			}
		}
		If $$$ISERR(tStatus) Set tStatus = $system.Status.AppendStatus($$$ERROR($$$EnsRecordMapErrComplexRepeating,"Address","St.Recordmap.Data.ComplexAddress",$classname(),tCount),tStatus) Quit
	}
	Catch {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

Parameter RECORDMAPGENERATED = 1;

XData ComplexBatch [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<ComplexBatch xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="St.Recordmap.Data.PersonaIComplex" char_encoding="UTF-8" targetClassname="St.Recordmap.Data.PersonaIComplex.Batch">
  <RecordSequence name="PersonalInfo" required="0" repeating="0">
    <RecordReference name="User" required="1" repeating="0" recordMap="St.Recordmap.Data.CompexUser">
    </RecordReference>
    <RecordReference name="Phone" required="0" repeating="1" minRepeats="0" maxRepeats="5" recordMap="St.Recordmap.Data.ComplexPhone">
    </RecordReference>
    <RecordReference name="Address" required="0" repeating="1" minRepeats="0" maxRepeats="2" recordMap="St.Recordmap.Data.ComplexAddress">
    </RecordReference>
  </RecordSequence>
</ComplexBatch>
}

}
