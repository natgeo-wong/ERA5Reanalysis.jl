function cdsretrieve(
    e5ds :: ERA5Dataset,
    evar :: ERA5Variable,
    ereg :: ERA5Region,
)

    dtvec = cdsretrieve_dtvec(e5ds)
    ckeys = cdskey()

    for dtii in dtvec

        fnc = e5dfnc(e5ds,evar,ereg,dtii)
        fol = dirname(fnc); if !isdir(fol); mkpath(fol) end

        e5dkey = Dict(
            "product_type" => e5ds.ptype,
            "year"         => year(dtii),
            "month"        => cdsretrieve_month(dtii,e5ds),
            "variable"     => evar.lname,
            "grid"         => [ereg.gres, ereg.gres],
            "time"         => cdsretrieve_time(e5ds),
            "format"       => "netcdf",
        )

        if typeof(e5ds) <: ERA5Hourly
            e5dkey["day"] = collect(1:31)
        end
        
        cdsretrieve_area!(e5dkey,ereg)

        retrieve(cdsretrieve_dataset(evar,e5ds),e5dkey,fnc,ckeys)

    end

end


cdsretrieve_dtvec(e5ds::ERA5Hourly)  = e5ds.dtbeg : Month(1) : e5ds.dtend
cdsretrieve_dtvec(e5ds::ERA5Monthly) = e5ds.dtbeg : Year(1)  : e5ds.dtend

cdsretrieve_dataset(evar::ERA5Variable,::ERA5Hourly)  = evar.dname
cdsretrieve_dataset(evar::ERA5Variable,::ERA5Monthly) = evar.dname * "-monthly-means"

function cdsretrieve_area!(
    dkeys :: AbstractDict,
    ereg  :: ERA5Region
)

    if !(ereg.isglb)
        geo = ereg.geo
        dkeys["area"] = [geo.N,geo.W,geo.S,geo.E]
    end

    return

end

cdsretrieve_month(dtii::Date,::ERA5Hourly)  = month(dtii)
cdsretrieve_month(dtii::Date,::ERA5Monthly) = collect(1:12)

cdsretrieve_time(::ERA5Hourly) = [
    "00:00", "01:00", "02:00", "03:00", "04:00", "05:00",
    "06:00", "07:00", "08:00", "09:00", "10:00", "11:00",
    "12:00", "13:00", "14:00", "15:00", "16:00", "17:00",
    "18:00", "19:00", "20:00", "21:00", "22:00", "23:00",
]

function cdsretrieve_time(e5ds::ERA5Monthly)

    if e5ds.hours
        return [
            "00:00", "01:00", "02:00", "03:00", "04:00", "05:00",
            "06:00", "07:00", "08:00", "09:00", "10:00", "11:00",
            "12:00", "13:00", "14:00", "15:00", "16:00", "17:00",
            "18:00", "19:00", "20:00", "21:00", "22:00", "23:00",
        ]
    else
        return "00:00"
    end
    
end