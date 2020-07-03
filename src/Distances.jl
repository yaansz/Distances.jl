module Distances

include("DistanceTypes.jl")

export
    # Function
    GetDistance,

    # Enum
    DistanceType,
    Euclidean,
    Cityblock,
    TotalVariation,
    Chebyshev,
    Jaccard,
    BrayCurtis,
    SpanNormDist
end
