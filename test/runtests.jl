using Yoda
using Test

@testset "Yoda.jl" begin
    # Write your tests here.
    test_observable = "/ALEPH_1996_S3486095/d01-x01-y01"
    
    mc_hists = Yoda.get_all_histograms("test/output.yoda")
    lep_hists = Yoda.get_all_scatter("test/ALEPH_1996_S3486095.yoda")
    
    #data_hist = Yoda.get_all_scatter_to_names("test/ALEPH_1996_S3486095.yoda",mc_hists[:,1])
    data_hist = Yoda.get_all_scatter_to_names("test/ALEPH_1996_S3486095.yoda",test_observable)
    
    indx = findall(x->x==test_observable,mc_hists[:,1])
    mc_hist = mc_hists[indx,:]

    @test length(indx) == 1
    
    @test length(mc_hist[2].weights) == length(data_hist[2].weights)
    
    @test isapprox(mc_hist[2].weights,data_hist[2].weights,rtol=0.1)
end

