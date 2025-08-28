Class St.Recordmap.Deploy Extends (St.Tools.Deploy, %Projection.AbstractProjection) [ DependsOn = St.Recordmap.Production ]
{

Parameter PRODUCTION = "St.Recordmap.Production";

Parameter NAMESPACE = "USER";

Projection Reference As St.Recordmap.Deploy;

/// This method is called by the Class Compiler whenever an associated 
/// class has finished compiling. <var>classname</var> contains the name of 
/// the associated class while <var>parameters</var> contains an array of the 
/// projection parameters subscripted by parameter name. Also the special parameter value
/// parameters("%qstruct") contains a merge of the qstruct array this projection is being
/// compiled with. The <var>modified</var> is always blank.<br>
/// Any errors reported by this method are reported by the Class Compiler but
/// do not effect class compilation in any way.
ClassMethod CreateProjection(classname As %String, ByRef parameters As %String, modified As %String, qstruct) As %Status
{
    Do ..AddItem(,"EnsLib.RecordMap.Service.FileService", "EnsLib.RecordMap.Service.FileService","Demo",,,,"File service for RecordMap")
    Do ..AddItem(,"EnsLib.RecordMap.Service.ComplexBatchFileService", "EnsLib.RecordMap.Service.ComplexBatchFileService","Demo",,,,"File service for RecordMap complex")
    Do ..AddItem(,"St.Recordmap.BP.ProcessData", "St.Recordmap.BP.ProcessData","Demo",,,,"BP for RecordMap")
    Do ..AddItem(,"St.Recordmap.BP.ProcessDataComplex", "St.Recordmap.BP.ProcessDataComplex","Demo",,,,"BP for RecordMap complex")
    
    // Add RecordMap service settings
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.FileService",, "FilePath", "/opt/irisbuild/process/", "Path to the input files")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.FileService",, "ArchivePath", "/opt/irisbuild/process/archive/", "Path to the archive files")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.FileService",, "RecordMap", "St.Recordmap.Data.PersonalInfoPhone", "RecordMap class")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.FileService",, "FileSpec", "*.csv", "File specification")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.FileService",, "TargetConfigNames", "St.Recordmap.BP.ProcessData", "BP class")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.FileService",, "HeaderCount", "1", "Number of header lines in the input file")

    // Add RecordMap complex service settings
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.ComplexBatchFileService",, "FilePath", "/opt/irisbuild/process/", "Path to the input files")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.ComplexBatchFileService",, "ArchivePath", "/opt/irisbuild/process/archive/", "Path to the archive files")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.ComplexBatchFileService",, "ComplexMap", "St.Recordmap.Data.PersonaIComplex", "RecordMap complex class")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.ComplexBatchFileService",, "FileSpec", "*.txt", "File specification")
    Do ..AddDefaultSetting(,"EnsLib.RecordMap.Service.ComplexBatchFileService",, "TargetConfigNames", "St.Recordmap.BP.ProcessDataComplex", "BP class")

    /// Check if the production is running
    if '##class(Ens.Director).IsProductionRunning(..#PRODUCTION)
    {
        write !,"Running production"
        do ##class(Ens.Director).StartProduction(..#PRODUCTION)
        do ##class(Ens.Director).SetAutoStart(..#PRODUCTION, 0)
    }
    else
    {
        write !,"Restart production"
        do ##class(Ens.Director).RestartProduction(0,1)
    }

    Quit $$$OK
}

}
