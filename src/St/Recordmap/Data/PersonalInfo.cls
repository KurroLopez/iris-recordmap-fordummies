/// 
Class St.Recordmap.Data.PersonalInfo Extends EnsLib.RecordMap.RecordMap
{

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="St.Recordmap.Data.PersonalInfo" type="delimited" char_encoding="UTF-8" targetClassname="St.Recordmap.Data.PersonalInfo.Record" complexBatchManaged="0" padFromLeft="0" recordTerminator="\x0d\x0a" allowEmbeddedRecordTerminator="0" allowEarlyTerminator="0">
  <Separators>
    <Separator>;</Separator>
  </Separators>
  <Field name="Name" required="1" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Surname" required="1" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="DateOfBirth" required="1" ignored="0" datatype="%Date" params="FORMAT=3" repeating="0">
  </Field>
  <Field name="NationalId" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Address" required="0" ignored="0" datatype="%String" params="MAXLEN=100" repeating="0">
  </Field>
  <Field name="City" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Country" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
</Record>
}

}
