### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 27f026e6-ff99-11ec-38cf-c934285066a5
using Julog

# ╔═╡ 86a4ce11-f39e-402d-b38d-d8168e7fe53e
clauses = @julog [
	parent(pam, bob)<<=true,
	parent(tom, bob)<<=true,
	parent(tom, liz)<<=true,
	parent(bob, ann)<<=true,
	parent(bob, pat)<<=true,
	parent(pat, jim)<<=true,

	female(pam)<<=true,
	female(liz)<<=true,
	female(ann)<<=true,
	female(pat)<<=true,

	male(jim)<<=true,
	male(tom)<<=true,             
	male(bob)<<=true,

	offspring(Y, X)<<=parent(X, Y),

	mother(X, Y)<<=parent(X, Y)&female(X),

	grandparent(X, Z)<<=parent(X, Y)&parent(Y, Z),

	sister(X, Y)<<=parent(Z, X)&parent(Z, Y)&female(X)&different(X, Y),

	different(X, Y) <<= X!=Y,

	predecessor(X, Z)<<=parent(X, Z),
	predecessor(X, Z)<<=parent(X, Y)&predecessor(Y, Z),
	
]

# ╔═╡ b1b28247-a4f2-4cb6-82f0-4089edf3fb66
resolve(@julog(different(bob, pat)), clauses)

# ╔═╡ 0f457d11-7aa2-4c7c-ae65-796e45555dbf
resolve(@julog(parent(bob, pat)), clauses)

# ╔═╡ 2ba5675f-d230-405d-909c-24f03a6e082c
resolve(@julog(parent(liz, pat)), clauses)

# ╔═╡ 0ba5392d-dd4b-4907-bb67-989a4e3ed662
resolve(@julog(parent(X, liz)), clauses)

# ╔═╡ d2c6d321-c2fb-453a-958d-546354b126f5
resolve(@julog(parent(bob, X)), clauses)

# ╔═╡ 95fac2b2-d142-44a0-80e7-7763c8712510
resolve(@julog([parent(Y, jim), parent(X, Y)]), clauses)

# ╔═╡ 2d7894a7-95e8-4acd-9bf5-6a71379c3645
resolve(@julog([parent(tom, X), parent(X, Y)]), clauses)

# ╔═╡ 86c0e4e1-0665-4437-b709-3ffc53f79ce9
resolve(@julog([parent(X, ann), parent(X, pat)]), clauses)

# ╔═╡ 30908685-51f6-448d-a776-a59053512341
resolve(@julog(offspring(liz, tom)), clauses)

# ╔═╡ 2c51ae5f-3cba-450e-b518-532b0c8c69e3
resolve(@julog(mother(X, jim)), clauses)

# ╔═╡ 7731c71c-84cc-4c38-913d-2cad7b0e4faa
resolve(@julog(grandparent(X, ann)), clauses)

# ╔═╡ 8478946a-00ca-4ff5-8423-8eb839ab2106
resolve(@julog(sister(ann, pat)), clauses)

# ╔═╡ 275a8ccf-db59-4298-93f4-0a01e85571e3
resolve(@julog(sister(X, Y)), clauses)

# ╔═╡ 76eaa584-d7b3-4828-800a-186da5ef5b67
resolve(@julog(predecessor(bob, Y)), clauses)

# ╔═╡ fc1e9e41-5f45-4955-b38d-bd6ba16f8f26
resolve(@julog(predecessor(pam, Y)), clauses)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Julog = "5d8bcb5e-2b2c-4a96-a2b1-d40b3d3c344f"

[compat]
Julog = "~0.1.14"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.Julog]]
git-tree-sha1 = "48603109b9e48f9a8d4f6b4d56367f077ebd4a05"
uuid = "5d8bcb5e-2b2c-4a96-a2b1-d40b3d3c344f"
version = "0.1.14"
"""

# ╔═╡ Cell order:
# ╠═27f026e6-ff99-11ec-38cf-c934285066a5
# ╠═86a4ce11-f39e-402d-b38d-d8168e7fe53e
# ╠═b1b28247-a4f2-4cb6-82f0-4089edf3fb66
# ╠═0f457d11-7aa2-4c7c-ae65-796e45555dbf
# ╠═2ba5675f-d230-405d-909c-24f03a6e082c
# ╠═0ba5392d-dd4b-4907-bb67-989a4e3ed662
# ╠═d2c6d321-c2fb-453a-958d-546354b126f5
# ╠═95fac2b2-d142-44a0-80e7-7763c8712510
# ╠═2d7894a7-95e8-4acd-9bf5-6a71379c3645
# ╠═86c0e4e1-0665-4437-b709-3ffc53f79ce9
# ╠═30908685-51f6-448d-a776-a59053512341
# ╠═2c51ae5f-3cba-450e-b518-532b0c8c69e3
# ╠═7731c71c-84cc-4c38-913d-2cad7b0e4faa
# ╠═8478946a-00ca-4ff5-8423-8eb839ab2106
# ╠═275a8ccf-db59-4298-93f4-0a01e85571e3
# ╠═76eaa584-d7b3-4828-800a-186da5ef5b67
# ╠═fc1e9e41-5f45-4955-b38d-bd6ba16f8f26
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
