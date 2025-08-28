/// 
Class Demo.BP.ProcessDataComplex Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Demo.Data.PersonaIComplex.Batch' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<trace name='Trace name' value='"Processing: "_request.PersonalInfo.User.Surname_", "_request.PersonalInfo.User.Name' xpos='200' ypos='250' />
</sequence>
</process>
}

}
