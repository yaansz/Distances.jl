using Distances
using Test

# I copied these tests :x

@testset "Distances tests" begin
    @test GetDistance(Euclidean::DistanceType, [2,2], [2,4]) == 2
    @test GetDistance(Cityblock::DistanceType, [2,2], [2,4]) == 2
    @test GetDistance(TotalVariation::DistanceType, [2,2], [2,4]) == 1
    @test GetDistance(Chebyshev::DistanceType, [2,2], [2,4]) == 2
    @test GetDistance(Jaccard::DistanceType, [2,2], [2,4]) == 1 - 2/3
    @test GetDistance(BrayCurtis::DistanceType, [2,2], [2,4]) == 1/5
    @test GetDistance(SpanNormDist::DistanceType, [2,2], [2,4]) == 2
end

@testset "Errors test" begin
    @test_throws DimensionMismatch GetDistance(Cityblock::DistanceType, [2, 2, 2], [2, 4])
    @test_throws DimensionMismatch GetDistance(Cityblock::DistanceType, [2], [2, 4])
    @test_throws MethodError GetDistance(Cityblock::DistanceType, [2, "hello"], [2, 4])
    @test_throws MethodError GetDistance(Cityblock::DistanceType, [], [2, 4])
    @test_throws MethodError GetDistance(Cityblock::DistanceType, [2], [])
end
