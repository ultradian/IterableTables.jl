using IterableTables
using SimpleTraits
using NamedTuples
using DataFrames
using DataTables
using DataStreams
using CSV
using SQLite
using FlatBuffers
using Feather
using TimeSeries
using StatsModels
using TypedTables
using VegaLite
using PooledArrays
using IndexedTables
using Base.Test

if VERSION < v"0.6.0-"    
    using Gadfly
end

@testset "IterableTables" begin

@testset "Core" begin

table_array = [@NT(a=1), @NT(a=2)]
other_array = [1,2,3]

@test istrait(IsIterableTable{typeof(table_array)})
@test !istrait(IsIterableTable{typeof(other_array)})

end

include("test_integration_dataframes.jl")
include("test_integration_datastreams.jl")
include("test_integration_datatables.jl")
include("test_integration_statsmodels.jl")
include("test_integration_timeseries.jl")
include("test_integration_typedtables.jl")
include("test_integration_vegalite.jl")
include("test_integration_indexedtables.jl")

if VERSION < v"0.6.0-"
    include("test_integration_gadfly.jl")    
end

end
