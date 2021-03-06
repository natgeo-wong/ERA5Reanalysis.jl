"""
    ERA5Region

Structure that imports relevant [GeoRegion](https://github.com/JuliaClimate/GeoRegions.jl) properties used in the handling of the gridded ERA5 datasets.

All `ERA5Region` Types contain the following fields:
- `geo`   : The `GeoRegion` containing the geographical information
- `geoID` : The ID used to specify the `GeoRegion`
- `gres`  : The resolution of the gridded data to be downloaded/analysed
- `gstr`  : String, for specification of folder and file name
- `isglb` : A Bool, true if spans the globe, false if no
"""
struct ERA5Region{ST<:AbstractString, FT<:Real}
    geo   :: GeoRegion
    geoID :: ST
    gres  :: FT
    gstr  :: ST
    isglb :: Bool
end

"""
    ERA5Region(
        geo  :: GeoRegion;
        gres :: Real = 0,
        ST = String,
        FT = Float64
    ) -> egeo :: ERA5Region

Argument
========

- `geo`  : A `GeoRegion` structure type

Keyword Argument
================

- `gres` : The spatial resolution that ERA5 reanalysis data will be downloaded/analyzed, and 360 must be a multiple of `gres`
"""
function ERA5Region(
    geo  :: GeoRegion;
    gres :: Real = 0,
    ST = String,
    FT = Float64
)

    @info "$(modulelog()) - Creating an ERA5Region based on the GeoRegion \"$(geo.regID)\""
    gres = regionstep(geo.regID,gres)
    if geo.regID == "GLB"; isglb = true; else; isglb = false end

    return ERA5Region{ST,FT}(
        geo, geo.regID, gres,
        "$(geo.regID)x$(@sprintf("%.2f",gres))", isglb
    )

end

function regionstep(
    geoID :: AbstractString,
    gres  :: Real = 0
)

    @debug "$(modulelog()) - Determining spacing between grid points in the GeoRegion ..."
    if gres == 0
        @info "$(modulelog()) - No grid resolution specified, defaulting to the module default (1.0º for global GeoRegion, 0.25º for all others)"
        if geoID == "GLB";
              gres = 1.0;
        else; gres = 0.25;
        end
    else
        if !checkegrid(gres)
            error("$(modulelog()) - The grid resolution $(gres)º is not valid as it does not divide 360º without remainder")
        end
    end

    return gres

end

function checkegrid(gres::Real)

    if rem(360,gres) == 0
          return true
    else; return false
    end

end

function show(io::IO, ereg::ERA5Region)
    geo = ereg.geo

    if typeof(geo) <: PolyRegion
        print(
            io,
            "The ERA5Region wrapper for the \"$(ereg.geoID)\" GeoRegion has the following properties:\n",
            "    Region ID      (geoID) : ", ereg.geoID, '\n',
            "    Name        (geo.name) : ", ereg.geo.name,  '\n',
            "    Resolution      (gres) : ", ereg.gres,  '\n',
            "    Folder ID       (gstr) : ", ereg.gstr, '\n',
            "    Bounds (geo.[N,S,E,W]) : ",[geo.N,geo.S,geo.E,geo.W], '\n',
            "    Shape      (geo.shape) : ", geo.shape, '\n',
            "       (geo.[is180,is360]) : ",(geo.is180,geo.is360),"\n",
        )
    else
        print(
            io,
            "The ERA5Region wrapper for the \"$(ereg.geoID)\" GeoRegion has the following properties:\n",
            "    Region ID      (geoID) : ", ereg.geoID, '\n',
            "    Name        (geo.name) : ", ereg.geo.name,  '\n',
            "    Resolution      (gres) : ", ereg.gres,  '\n',
            "    Folder ID       (gstr) : ", ereg.gstr, '\n',
            "    Bounds (geo.[N,S,E,W]) : ",[geo.N,geo.S,geo.E,geo.W], '\n',
            "       (geo.[is180,is360]) : ",(geo.is180,geo.is360),"\n",
        )
    end

end