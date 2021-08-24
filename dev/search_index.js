var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = ERA5Reanalysis","category":"page"},{"location":"#ERA5Reanalysis","page":"Home","title":"ERA5Reanalysis","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for ERA5Reanalysis.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [ERA5Reanalysis]","category":"page"},{"location":"#ERA5Reanalysis.ERA5Dataset","page":"Home","title":"ERA5Reanalysis.ERA5Dataset","text":"ERA5Dataset\n\nAbstract supertype for ERA5 datasets.\n\n\n\n\n\n","category":"type"},{"location":"#ERA5Reanalysis.ERA5Variable","page":"Home","title":"ERA5Reanalysis.ERA5Variable","text":"\" ERA5Dataset\n\nAbstract supertype for ERA5 datasets.\n\n\n\n\n\n","category":"type"},{"location":"#ERA5Reanalysis.cdskey-Tuple{}","page":"Home","title":"ERA5Reanalysis.cdskey","text":"cdskey() -> Dict{Any,Any}\n\nRetrieves the CDS API ckeys from the ~/.cdsapirc file in the home directory\n\n\n\n\n\n","category":"method"},{"location":"#ERA5Reanalysis.isPressureVariable-Tuple{AbstractString}","page":"Home","title":"ERA5Reanalysis.isPressureVariable","text":"isPressureVariable(\n    varID :: AbstractString;\n    throw :: Bool = true\n) -> tf :: Bool\n\nExtracts information of the Pressure-Level Variable with the ID varID.  If no Pressure-Level Variable with this ID exists, an error is thrown.\n\nArguments\n\nRegID : The keyword ID that will be used to identify the Pressure-Level Variable.       If the ID is not valid (i.e. not being used), then an error will be thrown.\nthrow : If true, then throws an error if RegID is not a valid Pressure-Level Variable identifier instead of returning the Boolean tf\n\nReturns\n\ntf : True / False\n\n\n\n\n\n","category":"method"},{"location":"#ERA5Reanalysis.isSingle-Tuple{AbstractString}","page":"Home","title":"ERA5Reanalysis.isSingle","text":"isSingle(         varID :: AbstractString;         throw :: Bool = true     ) -> tf :: Bool\n\nExtracts information of the Single-Level Variable with the ID varID.  If no Single-Level Variable with this ID exists, an error is thrown.\n\nArguments\n\nRegID : The keyword ID that will be used to identify the Single-Level Variable.       If the ID is not valid (i.e. not being used), then an error will be thrown.\nthrow : If true, then throws an error if RegID is not a valid Single-Level Variable identifier instead of returning the Boolean tf\n\nReturns\n\ntf : True / False\n\n\n\n\n\n","category":"method"},{"location":"#ERA5Reanalysis.listPressureVariables-Tuple{}","page":"Home","title":"ERA5Reanalysis.listPressureVariables","text":"listPressureVariables()\n\nList all Pressure-Level Variables and the files the data are stored in.\n\nOutput\n\nvarlist : List of all the Pressure-Level Variable IDs\nfidlist : List of the files that the Pressure-Level Variable information is stored in\n\n\n\n\n\n","category":"method"},{"location":"#ERA5Reanalysis.listSingles-Tuple{}","page":"Home","title":"ERA5Reanalysis.listSingles","text":"listSingles()\n\nList all Single-Level Variables and the files the data are stored in.\n\nOutput\n\nvarlist : List of all the Single-Level Variable IDs\nfidlist : List of the files that the Single-Level Variable information is stored in\n\n\n\n\n\n","category":"method"},{"location":"#ERA5Reanalysis.parserequest-Tuple{AbstractDict, AbstractDict, AbstractString}","page":"Home","title":"ERA5Reanalysis.parserequest","text":"parserequest(\n    ckeys :: AbstractDict,\n    resp  :: AbstractDict,\n    api   :: AbstractString\n) -> Dict{Any,Any}\n\nGet info on HTTP request, and parse the information and update the dictionary\n\nArguments\n\nckeys : Dictionary that contains the CDSAPI information held in ~/.cdsapirc\nresp : Dictionary that contains the HTTP response\napi  : String that contains the API used for Climate Data Store authentication\n\n\n\n\n\n","category":"method"},{"location":"#ERA5Reanalysis.retrieve","page":"Home","title":"ERA5Reanalysis.retrieve","text":"retrieve(\n    dset  :: AbstractString,\n    dkeys :: AbstractDict,\n    fnc   :: AbstractString,\n    ckeys :: AbstractDict = cdskey()\n)\n\nRetrieves dsets from the Climate Data Store, with options specified in a Julia Dictionary and saves it into a specified file. Arguments:     * dset::AbstractString : string specifies the name of the dset within the Climate Data Store that the retrieve function is attempting to retrieve data from     * dkeys::AbstractDict : dictionary that contains the keywords that specify the properties (e.g. date, resolution, grid) of the data being retrieved     * fnc::AbstractString : string that contains the path and name of the file that the data is to be saved into     * ckeys::AbstractDict : dictionary that contains API Key information read from the .cdsapirc file in the home directory (optional)\n\n\n\n\n\n","category":"function"}]
}