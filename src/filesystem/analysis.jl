"""
    e5danc(
        e5ds :: ERA5Hourly,
        evar :: ERA5Variable,
        egeo :: ERA5Region,
        dt   :: TimeType
    ) -> String

Returns of the path of the file for the NASA Precipitation dataset specified by `npd` for a GeoRegion specified by `geo` at a date specified by `dt`.

Arguments
=========
- `npd` : a `NASAPrecipitationDataset` specifying the dataset details and date download range
- `geo` : a `GeoRegion` (see [GeoRegions.jl](https://github.com/JuliaClimate/GeoRegions.jl)) that sets the geographic bounds of the data array in lon-lat
- `dt`  : A specified date. The NCDataset retrieved may will contain data for the date, although it may also contain data for other dates depending on the `NASAPrecipitationDataset` specified by `npd`
"""
function e5danc(
    e5ds :: ERA5Hourly,
	evar :: SingleLevel,
	egeo :: ERA5Region,
    dt   :: TimeType
)

    fol = joinpath(e5ds.eroot,egeo.gstr,evar.varID)
    fnc = e5ds.e5dID * "-" * egeo.gstr * "-" * evar.varID * "-" * yr2str(dt) * ".nc"
    return joinpath(fol,fnc)

end

function e5danc(
    e5ds :: ERA5Hourly,
	evar :: PressureLevel,
	egeo :: ERA5Region,
    dt   :: TimeType
)

    evp = evar.varID * "-$(evar.hPa)hPa"
    fol = joinpath(e5ds.eroot,egeo.gstr,evar.varID,evp)
    fnc = e5ds.e5dID * "-" * egeo.gstr * "-" * evp * "-" * yr2str(dt) * ".nc"
    return joinpath(fol,fnc)

end

function e5danc(
    e5ds :: ERA5Hourly,
	evar :: SingleLevel,
	egeo :: ERA5Region
)

    fol = joinpath(e5ds.eroot,egeo.gstr,evar.varID)
    fnc = e5ds.e5dID * "-" * egeo.gstr * "-" * evar.varID
    return fol, fnc

end

function e5danc(
    e5ds :: ERA5Hourly,
	evar :: PressureLevel,
	egeo :: ERA5Region
)

    evp = evar.varID * "-$(evar.hPa)hPa"
    fol = joinpath(e5ds.eroot,egeo.gstr,evar.varID,evp)
    fnc = e5ds.e5dID * "-" * egeo.gstr * "-" * evp
    return fol, fnc

end