using Distances
using Test

@testset "Distances tests" begin
    @test GetDistance(Euclidean(), [2,2], [2,4]) == 2
    @test GetDistance(CityBlock::DistanceType, [2,2], [2,4]) == 2
    @test GetDistance(TotalVariation::DistanceType, [2,2], [2,4]) == 1
    @test GetDistance(Chebyshev::DistanceType, [2,2], [2,4]) == 2
    @test GetDistance(Jaccard::DistanceType, [2,2], [2,4]) == 1 - 2/3
    @test GetDistance(BrayCurtis::DistanceType, [2,2], [2,4]) == 1/5
end
