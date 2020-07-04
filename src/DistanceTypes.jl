"""
This enum is used to select the distance calculation type.
We converted the name into a string, and the magic happens! :D

# DistanceType Possibilities:

    Euclidean, Cityblock, TotalVariation, Chebyshev,
    Jaccard, BrayCurtis, SpanNormDist

# Examples:

    Euclidean::DistanceType
    Cityblock::DistanceType
"""
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

#add
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

"""
    GetDistance(distanceType::DistanceType,
    v1::AbstractArray{<: Number}, v2::AbstractArray{<: Number})

This function compute distance between two numeric vectors. You can use
diferents distance calculations selecting with "DistanceType".

# Examples:

    GetDistance(Euclidean::DistanceType, [2,2], [2,4])
    GetDistance(Cityblock::DistanceType, [2,2], [2,4])
    GetDistance(TotalVariation::DistanceType, [2,2], [2,4])
"""
function GetDistance(distanceType::DistanceType, v1::AbstractArray{<: Number}, v2::AbstractArray{<: Number})
    if length(v1) != length(v2)
        throw(DimensionMismatch("The dimensions of the vectors are different. Therefore, impossible to calculate!\n
        Vector1: $(length(v1)) // Vector2: $(length(v2))."))
    end

    return distanceFormulas[string(distanceType)](v1, v2)
end

# Formulas from: https://github.com/JuliaStats/Distances.jl
