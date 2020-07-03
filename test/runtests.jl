using Distances
using Test

@testset "Distances tests" begin
    # Write your tests here.
    @test GetDistance(Euclidean::DistanceType, [2,2], [2,4]) == 2
end
