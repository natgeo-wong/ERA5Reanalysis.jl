var documenterSearchIndex = {"docs":
[{"location":"#[ERA5Reanalysis.jl](https://github.com/natgeo-wong/ERA5Reanalysis.jl)","page":"Home","title":"ERA5Reanalysis.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Managing ERA5 Reanalysis Datasets","category":"page"},{"location":"","page":"Home","title":"Home","text":"ERA5Reanalysis.jl is a Julia package that aims to streamline the following processes:","category":"page"},{"location":"","page":"Home","title":"Home","text":"downloads of ERA5 Datasets from the Climate Data Store (does not include MARS requests)\nbasic analysis of said datasets\nperform all the above operations innately over a given geographical region using the GeoRegion functionality of GeoRegions.jl (v2 and above)","category":"page"},{"location":"#Installation-Instructions","page":"Home","title":"Installation Instructions","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"ERA5Reanalysis.jl has not been officially registered as a Julia package yet.  To install it, add it directly using the GitHub link as follows:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> ]\n(@v1.6) pkg> add https://github.com/natgeo-wong/ERA5Reanalysis.jl.git","category":"page"},{"location":"#Documentation-Overview","page":"Home","title":"Documentation Overview","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The documentation for ERA5Reanalysis.jl is divided into three components:","category":"page"},{"location":"","page":"Home","title":"Home","text":"Tutorials - meant as an introduction to the package\nHow-to Examples - geared towards those looking for specific examples of what can be done\nAPI Reference - comprehensive summary of all exported functionalities","category":"page"},{"location":"","page":"Home","title":"Home","text":"tip: Obtaining Example Datasets\nAll the output for the coding examples were produced using my computer with key security information (such as login info) omitted.  The examples cannot be run online because the file size requirements are too big.  Copying and pasting the code examples (with relevant directory and login information changes) should produce the same results.","category":"page"},{"location":"#Getting-help","page":"Home","title":"Getting help","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"If you are interested in using ERA5Reanalysis.jl or are trying to figure out how to use it, please feel free to ask me questions and get in touch!  Please feel free to open an issue if you have any questions, comments, suggestions, etc!","category":"page"},{"location":"basics/#The-Basic-Components-of-ERA5Reanalysis.jl","page":"Components","title":"The Basic Components of ERA5Reanalysis.jl","text":"","category":"section"},{"location":"basics/","page":"Components","title":"Components","text":"There are three essential components to specifying an ERA5 reanalysis dataset:","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"The ERA5 module (hourly, monthly, month-by-hour, etc.), held in an ERA5Module supertype\nThe ERA5 variable (single-level, or pressure-level), held in the ERA5Variable supertype\nThe ERA5 region to be downloaded/analyzed, held in an ERA5Region supertype, built over a GeoRegion","category":"page"},{"location":"basics/#The-ERA5Module-superType","page":"Components","title":"The ERA5Module superType","text":"","category":"section"},{"location":"basics/","page":"Components","title":"Components","text":"ERA5 reanalysis data is stored on the Climate Data Store in several different categories, so different people with different needs may access different data types depending on their research.  ERA5Reanalysis.jl distinguishes between the modules that are most often called using the ERA5Module superType:","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"Hourly reanalysis data\nMonthly reanalysis data, which is further broken down in\nMonthly-averaged data\nMonthly-averaged hourly data (i.e. a monthly average of the diurnal cycle)","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"ERA5Module","category":"page"},{"location":"basics/#ERA5Reanalysis.ERA5Module","page":"Components","title":"ERA5Reanalysis.ERA5Module","text":"ERA5Module\n\nAbstract supertype for ERA5 dataset modules.\n\nAll ERA5Module Types contain the following fields:\n\nmodID : The module ID, that also acts as a prefix to filenames\neroot : The specified directory in which to save the data\ndtbeg : The date for which downloads/analysis begins\ndtend : The date for which downloads/analysis finishes\n\n\n\n\n\n","category":"type"},{"location":"basics/","page":"Components","title":"Components","text":"There are other potential modules that could be incorporated into ERA5Reanalysis.jl, such as","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"ERA5-Land data\nEnsemble model averages, individual members, and standard deviations","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"More information on the different Types of ERA5Modules can be found here.","category":"page"},{"location":"basics/#The-ERA5Variable-superType","page":"Components","title":"The ERA5Variable superType","text":"","category":"section"},{"location":"basics/","page":"Components","title":"Components","text":"There are two main variable types in ERA5 reanalysis:","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"Single-Level variables, such as surface temperature, or total cloud cover, that are provided in the (lon,lat) space\nPressure-Level variables, such as atmospheric temperature, or specific humidity, that are provided in the (lon,lat,pressure) space.","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"In ERA5Reanalysis.jl, information regarding a specific ERA5 variable will be loaded into an ERA5Variable Type, with more specifics given here","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"ERA5Variable","category":"page"},{"location":"basics/#ERA5Reanalysis.ERA5Variable","page":"Components","title":"ERA5Reanalysis.ERA5Variable","text":"ERA5Variable\n\nAbstract supertype for ERA5 variables.\n\nAll ERA5Variable Types contain the following fields:\n\nvarID : The variable ID, that is also the identifier in the NetCDF files\nlname : The variable long-name, which is used to specify retrievals from CDS\nvname : The full-name of the variable\nunits : The units of the variable\n\n\n\n\n\n","category":"type"},{"location":"basics/#The-ERA5Region-superType","page":"Components","title":"The ERA5Region superType","text":"","category":"section"},{"location":"basics/","page":"Components","title":"Components","text":"Finally, in order to specify an area for ERA5Reanalysis.jl to conduct downloads, or analyse data over, we need to specify an ERA5Region, which is built on top of the GeoRegion Type in GeoRegions.jl.","category":"page"},{"location":"basics/","page":"Components","title":"Components","text":"ERA5Region","category":"page"},{"location":"basics/#ERA5Reanalysis.ERA5Region","page":"Components","title":"ERA5Reanalysis.ERA5Region","text":"ERA5Region\n\nStructure that imports relevant GeoRegion properties used in the handling of the gridded ERA5 datasets.\n\nAll ERA5Region Types contain the following fields:\n\ngeo   : The GeoRegion containing the geographical information\ngeoID : The ID used to specify the GeoRegion\ngres  : The resolution of the gridded data to be downloaded/analysed\nfstr  : String, for specification of folder and file name\nisglb : A Bool, true if spans the globe, false if no\n\n\n\n\n\n","category":"type"}]
}
