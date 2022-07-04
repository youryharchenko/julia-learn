### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ a2e3515e-b89b-4512-bc03-e1d0b1644904
begin
	using Pkg
	using HTTP
	using JSON
	using GitHub
	import LightGraphs
	using ProgressMeter
end

# ╔═╡ 65a5950d-e04d-4366-8e25-d56a7d1993e9
using PlutoUI

# ╔═╡ 9d0ab864-f944-11ec-39ef-2d743d885f42
begin
	using Graphs
	using GraphPlot
end

# ╔═╡ 944a8372-ff87-4a64-8bd3-13c01d1c718a
md"""
# From [JuliaGraphsTutorials](https://github.com/JuliaGraphs/JuliaGraphsTutorials)
"""

# ╔═╡ 238947c5-8116-452b-9097-1d7de1a8ce42
TableOfContents()

# ╔═╡ ff57979d-7303-4a99-8d72-44cb310f66ed
md"""
## Basic
"""

# ╔═╡ 644d4034-f830-40eb-b11f-7529027041a9
begin
	G₁ = Graph(3) # graph with 3 vertices

	# make a triangle
	add_edge!(G₁, 1, 2)
	add_edge!(G₁, 1, 3)
	add_edge!(G₁, 2, 3)

	gplot(G₁, nodelabel=1:3)
end

# ╔═╡ 6b4ae13a-f017-4d35-8a42-214cbefd7ff5
begin
	A = [
    	0 1 1
    	1 0 1
    	1 1 0
	]

	G₂ = Graph(A)
	gplot(G₂, nodelabel=1:3)
end

# ╔═╡ 28696409-0763-459e-99fd-a8a0d3899f9a
G₁ == G₂

# ╔═╡ 8df1e5af-50ef-4663-83f1-07370c1429b0
let
	G = Graph(3, 3)
	gplot(G, nodelabel=1:3)
end

# ╔═╡ 23eb1a8d-cac1-43f0-b3fc-f8282ec7f98b
let
	G = Graph(3, 4)
	gplot(G, nodelabel=1:3)
end

# ╔═╡ 5d88f63a-7383-4a36-8c7e-94a25f377c90
let
	G = DiGraph(3, 4)
	gplot(G, nodelabel=1:3)
end

# ╔═╡ 7784c4f0-f952-426a-be95-115c339ebd25
let
	G = smallgraph("bull")
	gplot(G)
end

# ╔═╡ 9854ccf3-816d-4287-abd1-db361634cc27
let
	G = smallgraph("house")
	gplot(G)
end

# ╔═╡ e596c860-1606-462f-acd5-9ab3cb6c8d15
let
	G =  CliqueGraph(3,4)
	gplot(G)
end

# ╔═╡ 2fe7315c-fe52-4254-9491-645df99dc8e2
let
	G = smallgraph("house")
	nvertices = nv(G) # number of vertices
	nedges = ne(G)    # number of edges
	gplot(G, nodelabel=1:nvertices, edgelabel=1:nedges)
end

# ╔═╡ 2a0191de-c6f6-4a43-b550-9f5304190766
let
	G = smallgraph("house")
	adjacency_matrix(G)
end

# ╔═╡ f84457cf-9e92-4065-a1a7-9cc152401307
let
	G = smallgraph("house")
	incidence_matrix(G)
end

# ╔═╡ 335d5804-72c7-45cf-894d-8975c9c61bbb
let
	G = smallgraph("house")
	laplacian_matrix(G)
end

# ╔═╡ 8849f57e-951e-4275-877c-18ec29892b57
begin
	G = Graph()
	add_vertices!(G, 5)
	add_edge!(G, 1, 2)
	add_edge!(G, 1, 3)
	add_edge!(G, 2, 4)
	add_edge!(G, 3, 4)
	add_edge!(G, 3, 5)
	add_edge!(G, 4, 5)

	gplot(G, nodelabel=1:nv(G), edgelabel=1:ne(G))
end

# ╔═╡ f9116d40-6845-48e8-8207-57d829155317
begin
	add_vertex!(G)
	add_edge!(G, 5, 6)

	gplot(G, nodelabel=1:nv(G), edgelabel=1:ne(G))
end

# ╔═╡ c57d3482-1969-4c8c-b591-f0e30edda5bc
begin
	rem_vertex!(G, 1)
	gplot(G, nodelabel=1:nv(G), edgelabel=1:ne(G))
end

# ╔═╡ 8717a2a8-0569-4769-838e-2cbc1bf55184
begin
	# metal plate
	□ = Graph(4)
	add_edge!(□, 1, 2)
	add_edge!(□, 1, 3)
	add_edge!(□, 2, 4)
	add_edge!(□, 3, 4)

	# airplane skeleton
	skeleton = Graph(11)
	add_edge!(skeleton, 1, 2)
	add_edge!(skeleton, 2, 3)
	add_edge!(skeleton, 3, 4)
	add_edge!(skeleton, 4, 5)
	add_edge!(skeleton, 3, 6)
	add_edge!(skeleton, 3, 7)
	add_edge!(skeleton, 3, 8)
	add_edge!(skeleton, 3, 9)
	add_edge!(skeleton, 9, 10)
	add_edge!(skeleton, 9, 11)
	
	gplot(cartesian_product(□, skeleton))
end

# ╔═╡ f1573dda-0a5a-4407-bae0-74fde6607811
md"""
## DAG
"""

# ╔═╡ 920a4883-e7bd-476a-bdef-2c6e36bcd639
myauth = GitHub.authenticate(ENV["GITHUB_AUTH"])

# ╔═╡ c6f57f73-21ce-4d9f-855c-f605aa3d6816
pkgdict = let
	pkgs = Pkg.dependencies()
	d = Dict()
	i = 0
	for (uuid, info) in pkgs
		i += 1
  		push!(d, info.name => (id=i, uuid=uuid, info=info))
	end
	d
end

# ╔═╡ 76f1bbb9-a02e-40a1-88a5-877de7e29776
# build DAG
DAG = let
	dag = LightGraphs.DiGraph(length(pkgdict))
	for (name, value) in pkgdict
  		children = value.info.dependencies
  		for (k, v) in children
    		LightGraphs.add_edge!(dag, pkgdict[name].id, pkgdict[k].id)
  		end
	end
	dag
end

# ╔═╡ 204c7987-7307-4006-8d50-b1206ff7f6b7
function get_name(d, i)
	for (k, v) in d
		if v.id == i
			return k
		end 
	end
	"not found"
end

# ╔═╡ 9899a01b-7be3-41cf-937a-ec700e011e05
begin
	# find (indirect) descendents
	descendents = []
	for (name, value) in pkgdict
  		gdists = LightGraphs.gdistances(DAG, pkgdict[name].id)
  		desc = [(from=name, to=get_name(pkgdict, v), level=gdists[v]) 
			for v in findall(gdists .> 0 .&& gdists .< typemax(Int))]
  		push!(descendents, desc)
	end
	descendents
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
GitHub = "bc5e4493-9b4d-5f90-b8aa-2b2bcaad7a26"
GraphPlot = "a2cc645c-3eea-5389-862e-a155d0052231"
Graphs = "86223c79-3864-5bf0-83f7-82e725a168b6"
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"
JSON = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
LightGraphs = "093fc24a-ae57-5d10-9952-331d41423f4d"
Pkg = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ProgressMeter = "92933f4c-e287-5a05-a399-4b506db050ca"

[compat]
GitHub = "~5.7.3"
GraphPlot = "~0.5.2"
Graphs = "~1.7.1"
HTTP = "~1.0.5"
JSON = "~0.21.3"
LightGraphs = "~1.3.5"
PlutoUI = "~0.7.39"
ProgressMeter = "~1.7.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "f87e559f87a45bece9c9ed97458d3afe98b1ebb9"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.1.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "924cdca592bc16f14d2f7006754a621735280b74"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.1.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Compose]]
deps = ["Base64", "Colors", "DataStructures", "Dates", "IterTools", "JSON", "LinearAlgebra", "Measures", "Printf", "Random", "Requires", "Statistics", "UUIDs"]
git-tree-sha1 = "9a2695195199f4f20b94898c8a8ac72609e165a4"
uuid = "a81c6b42-2e10-5240-aca2-a61377ecd94b"
version = "0.9.3"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.GitHub]]
deps = ["Base64", "Dates", "HTTP", "JSON", "MbedTLS", "Sockets", "SodiumSeal", "URIs"]
git-tree-sha1 = "f1d3170f588c7610b568c9a97971915100dd51e8"
uuid = "bc5e4493-9b4d-5f90-b8aa-2b2bcaad7a26"
version = "5.7.3"

[[deps.GraphPlot]]
deps = ["ArnoldiMethod", "ColorTypes", "Colors", "Compose", "DelimitedFiles", "Graphs", "LinearAlgebra", "Random", "SparseArrays"]
git-tree-sha1 = "5cd479730a0cb01f880eff119e9803c13f214cab"
uuid = "a2cc645c-3eea-5389-862e-a155d0052231"
version = "0.5.2"

[[deps.Graphs]]
deps = ["ArnoldiMethod", "Compat", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "db5c7e27c0d46fd824d470a3c32a4fc6c935fa96"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.7.1"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "Dates", "IniFile", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "bd11d3220f89382f3116ed34c92badaa567239c9"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.0.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.Inflate]]
git-tree-sha1 = "f5fc07d4e706b84f72d54eedcc1c13d92fb0871c"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.2"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LightGraphs]]
deps = ["ArnoldiMethod", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "432428df5f360964040ed60418dd5601ecd240b6"
uuid = "093fc24a-ae57-5d10-9952-331d41423f4d"
version = "1.3.5"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "5d4d2d9904227b8bd66386c1138cf4d5ffa826bf"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "0.4.9"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "891d3b4e8f8415f53108b4918d0183e61e18015b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.0"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "d7a7aef8f8f2d537104f170139553b14dfe39fe9"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SodiumSeal]]
deps = ["Base64", "Libdl", "libsodium_jll"]
git-tree-sha1 = "80cef67d2953e33935b41c6ab0a178b9987b1c99"
uuid = "2133526b-2bfb-4018-ac12-889fb3908a75"
version = "0.1.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "9f8a5dc5944dc7fbbe6eb4180660935653b0a9d9"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.0"

[[deps.StaticArraysCore]]
git-tree-sha1 = "66fe9eb253f910fe8cf161953880cfdaef01cdf0"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.0.1"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.libsodium_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "848ab3d00fe39d6fbc2a8641048f8f272af1c51e"
uuid = "a9144af2-ca23-56d9-984f-0d03f7b5ccf8"
version = "1.0.20+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─944a8372-ff87-4a64-8bd3-13c01d1c718a
# ╟─65a5950d-e04d-4366-8e25-d56a7d1993e9
# ╟─238947c5-8116-452b-9097-1d7de1a8ce42
# ╠═9d0ab864-f944-11ec-39ef-2d743d885f42
# ╟─ff57979d-7303-4a99-8d72-44cb310f66ed
# ╠═644d4034-f830-40eb-b11f-7529027041a9
# ╠═6b4ae13a-f017-4d35-8a42-214cbefd7ff5
# ╠═28696409-0763-459e-99fd-a8a0d3899f9a
# ╠═8df1e5af-50ef-4663-83f1-07370c1429b0
# ╠═23eb1a8d-cac1-43f0-b3fc-f8282ec7f98b
# ╠═5d88f63a-7383-4a36-8c7e-94a25f377c90
# ╠═7784c4f0-f952-426a-be95-115c339ebd25
# ╠═9854ccf3-816d-4287-abd1-db361634cc27
# ╠═e596c860-1606-462f-acd5-9ab3cb6c8d15
# ╠═2fe7315c-fe52-4254-9491-645df99dc8e2
# ╠═2a0191de-c6f6-4a43-b550-9f5304190766
# ╠═f84457cf-9e92-4065-a1a7-9cc152401307
# ╠═335d5804-72c7-45cf-894d-8975c9c61bbb
# ╠═8849f57e-951e-4275-877c-18ec29892b57
# ╠═f9116d40-6845-48e8-8207-57d829155317
# ╠═c57d3482-1969-4c8c-b591-f0e30edda5bc
# ╠═8717a2a8-0569-4769-838e-2cbc1bf55184
# ╟─f1573dda-0a5a-4407-bae0-74fde6607811
# ╠═a2e3515e-b89b-4512-bc03-e1d0b1644904
# ╠═920a4883-e7bd-476a-bdef-2c6e36bcd639
# ╠═c6f57f73-21ce-4d9f-855c-f605aa3d6816
# ╠═76f1bbb9-a02e-40a1-88a5-877de7e29776
# ╠═204c7987-7307-4006-8d50-b1206ff7f6b7
# ╠═9899a01b-7be3-41cf-937a-ec700e011e05
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
