/// 
Class St.Recordmap.BP.ProcessData Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='St.Recordmap.Data.PersonalInfoPhone.Record' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<trace name='Trace name' value='"Processing: "_request.Surname_", "_request.Name' xpos='200' ypos='250' />
</sequence>
</process>
}

}
