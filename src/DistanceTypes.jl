#=

    This enum is used to select the distance calculation type.
    We converted the name into a string, and the magic happen! :D

=#

@enum DistanceType begin

    Euclidean = 1
    Cityblock = 2
    TotalVariation = 3
    Chebyshev = 4
    Jaccard = 5
    BrayCurtis = 6
    SpanNormDist = 7

end

#=

    This dictionary is used with the enum DistanceType to
    select the distance calculation.
    After convert the enum in a string we applied in this dictionary. :)

=#

# Creating the dictionary

distanceFormulas = Dict()

# Setting Euclidean
temp_euc(x, y) = sqrt(sum((x - y) .^ 2))
distanceFormulas["Euclidean"] = temp_euc

# Setting Cityblock
temp_cb(x, y) = sum(abs.(x - y))
distanceFormulas["Cityblock"] = temp_cb

# Setting TotalVariation
temp_tv(x, y) = sum(abs.(x - y)) / 2
distanceFormulas["TotalVariation"] = temp_tv

# Setting Chebyshev
temp_chby(x, y) = maximum(abs.(x - y))
distanceFormulas["Chebyshev"] = temp_chby

# Setting Jaccard
temp_jcc(x, y) = 1 - sum(min(x, y)) / sum(max(x, y))
distanceFormulas["Jaccard"] = temp_jcc

# Setting BrayCurtis
temp_bc(x, y) = sum(abs.(x - y)) / sum(abs.(x + y))
distanceFormulas["BrayCurtis"] = temp_bc

# Setting SpanNormDist
temp_snd(x, y) = maximum(x - y) - minimum(x - y)
distanceFormulas["SpanNormDist"] = temp_snd

#=

    The "GetDistance" function is used to get every distance formula result
    Parameters:
    distanceType -> a enum "DistanceType" element.
    v1 and v2 -> number arrays

=#

function GetDistance(distanceType::DistanceType, v1::AbstractArray{<: Number}, v2::AbstractArray{<: Number})
    if length(v1) != length(v2)
        throw(DimensionMismatch("The dimensions of the vectors are different. Therefore, impossible to calculate!\n
        Vector1: $(length(v1)) // Vector2: $(length(v2))."))
    end
    

    return distanceFormulas[string(distanceType)](v1, v2)
end
