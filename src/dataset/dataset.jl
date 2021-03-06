"""
    ERA5Hourly <: ERA5Dataset

Specifies that the dataset to be analyzed contains hourly data.  All fields are the same as that specified in the `ERA5Dataset` docstring.
"""
struct ERA5Hourly{ST<:AbstractString, DT<:TimeType} <: ERA5Dataset
    e5dID :: ST
    lname :: ST
    ptype :: ST
	sldoi :: ST
	pldoi :: ST
    dtbeg :: Date
    dtend :: Date
    dtext :: Bool
    eroot :: ST
    emask :: ST
end

"""
    ERA5Monthly <: ERA5Dataset

Specifies that the dataset to be analyzed contains monthly-mean data.  All fields are the same as that specified in the `ERA5Dataset` docstring.
"""
struct ERA5Monthly{ST<:AbstractString, DT<:TimeType} <: ERA5Dataset
    e5dID :: ST
    lname :: ST
    ptype :: ST
	sldoi :: ST
	pldoi :: ST
    dtbeg :: Date
    dtend :: Date
    dtext :: Bool
    hours :: Bool
    eroot :: ST
    emask :: ST
end

"""
    ERA5Hourly(;
        dtbeg :: TimeType,
        dtend :: TimeType,
        eroot :: AbstractString = homedir(),
    ) -> ERA5Hourly <: ERA5Dataset

A function that creates an `ERA5Hourly` module.  All possible hours are downloaded, and data is saved month-by-month.

Keyword Arguments
=================
- `eroot` : The specified directory in which to save the data
- `dtbeg` : The date for which downloads/analysis begins, automatically rounded to the nearest month
- `dtend` : The date for which downloads/analysis finishes, automatically rounded to the nearest month
"""
function ERA5Hourly(
    ST = String,
    DT = Date;
    dtbeg :: TimeType = now() - Month(3),
    dtend :: TimeType = now() - Month(3),
    eroot :: AbstractString = homedir(),
)

    @info "$(modulelog()) - Setting up data structure containing information on the ERA5 Hourly data to be downloaded"
    dtbeg = Date(year(dtbeg),month(dtbeg),1)
	dtend = Date(year(dtend),month(dtend),daysinmonth(dtend))
    dtext = checkdates(dtbeg,dtend,)

    if !isdir(joinpath(eroot,"era5hr"))
        mkpath(joinpath(eroot,"era5hr"))
    end

    if !isdir(joinpath(eroot,"emask"))
        mkpath(joinpath(eroot,"emask"))
    end

    return ERA5Hourly{ST,DT}(
        "era5hr","ERA5 Hourly","reanalysis",
        "10.24381/cds.adbb2d47","10.24381/cds.bd0915c6",
        dtbeg,dtend,dtext,
        joinpath(eroot,"era5hr"),joinpath(eroot,"emask")
    )

end

"""
    ERA5Monthly(;
        dtbeg :: TimeType,
        dtend :: TimeType,
        eroot :: AbstractString = homedir(),
        hours :: Bool = false,
    ) -> ERA5Monthly <: ERA5Dataset or ERA5MonthlyHour <: ERA5Dataset

A function that creates an `ERA5Monthly` or `ERA5MonthlyHour` module depending on the input arguments of `hours`.  Data is saved year-by-year.

Keyword Arguments
=================
- `eroot` : The specified directory in which to save the data
- `dtbeg` : The date for which downloads/analysis begins, automatically rounded to the nearest year
- `dtend` : The date for which downloads/analysis finishes, automatically rounded to the nearest year
- `hours` : If false, download monthly-averaged data. If true, download monthly-averaged data for each hour
"""
function ERA5Monthly(
    ST = String,
    DT = Date;
    dtbeg :: TimeType = now() - Month(3),
    dtend :: TimeType = now() - Month(3),
    eroot :: AbstractString = homedir(),
    hours :: Bool = false,
)

    @info "$(modulelog()) - Setting up data structure containing information on the ERA5 Monthly data to be downloaded"
    dtbeg = Date(year(dtbeg),1,1)
    dtend = Date(year(dtend),12,31)
    dtext = checkdates(dtbeg,dtend)

    if !isdir(joinpath(eroot,"emask"))
        mkpath(joinpath(eroot,"emask"))
    end

    if hours

        if !isdir(joinpath(eroot,"era5mh"))
            mkpath(joinpath(eroot,"era5mh"))
        end

        return ERA5Monthly{ST,DT}(
            "era5mh","ERA5 Monthly Averages (by Hour-of-Day)",
            "monthly_averaged_reanalysis_by_hour_of_day",
            "10.24381/cds.f17050d7","10.24381/cds.6860a573",
            dtbeg,dtend,dtext,true,
            joinpath(eroot,"era5mh"),joinpath(eroot,"emask")
        )

    else

        if !isdir(joinpath(eroot,"era5mo"))
            mkpath(joinpath(eroot,"era5mo"))
        end

        return ERA5Monthly{ST,DT}(
            "era5mo","ERA5 Monthly Averages",
            "monthly_averaged_reanalysis",
            "10.24381/cds.f17050d7","10.24381/cds.6860a573",
            dtbeg,dtend,dtext,false,
            joinpath(eroot,"era5mo"),joinpath(eroot,"emask")
        )

    end

end

function checkdates(
    dtbeg :: TimeType,
    dtend :: TimeType
)

    dtext = false

    if dtend > (now() - Day(5))
        error("$(modulelog()) - You have specified an end date that is likely in the future of the latest available date of the ERA5 reanalysis dataset")
    end

    if dtend < dtbeg
        error("$(modulelog()) - You have specified an end date that is before your beginning date")
    end

    if dtbeg < Date(1950,1,1)
        error("$(modulelog()) - You have specified a date that is before the earliest available date of preliminary ERA5 reanalysis dataset from 1950 to 1978")
    end

    if dtbeg < Date(1979,1,1)
        @info "$(modulelog()) - You have specified the preliminary back-extension ERA5 reanalysis dataset from 1950 to 1978"
        if dtend >= Date(1979,1,1)
            error("$(modulelog()) - You have specified an end date that is outside the range of the preliminary back-extension (i.e. it is within the actual reanalysis dataset) and must be specified separately")
        end
        dtext = true
    end

    return dtext

end