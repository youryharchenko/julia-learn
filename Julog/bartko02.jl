### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ c7a00244-003f-11ed-2981-e914618f03d2
using Julog

# ╔═╡ 268dfdc9-9751-4f83-be44-f2b928804c7a
md"""
### Figure 2.14   A program for the monkey and banana problem.

---
move( State1, Move, State2): making Move in State1 results in State2;

a state is represented by a term:

    state( MonkeyHorizontal, MonkeyVertical, BoxPosition, HasBanana)

canget( State): monkey can get banana in State

---

"""

# ╔═╡ 34e5a2e0-9df1-4feb-9162-1236d131ca80
clauses = @julog [
	move(
		state(middle, onbox, middle, hasnot),   	# Before move
      	grasp,                                   	# Grasp banana
      	state(middle, onbox, middle, has) 			# After move 
	)<<=true,

	move(
		state(P, onfloor, P, H),   	
      	climb,                                   	# Climb box
      	state(P, onbox, P, H) 			
	)<<=true,

	move(
		state(P1, onfloor, P1, H),   	
      	push( P1, P2),                              # Push box from P1 to P2
      	state(P2, onfloor, P2, H) 			
	)<<=true,

	move(
		state(P1, onfloor, B, H),   	
      	walk(P1, P2),                              # Walk from P1 to P2
      	state(P2, onfloor, B, H) 			
	)<<=true,

	canget(state(_, _, _, has))<<=true,     		# can 1: Monkey already has it 
	canget(State1)<<=			                    # can 2: Do some work to get it
	  	move(State1, Move, State2) &        		# Do something
  		canget(State2),                    			# Get it now
]

# ╔═╡ d0900172-c3fa-4ce5-b467-18eaaca2550f
#resolve(@julog(canget(state(atdoor, onfloor, atwindow, hasnot))), clauses; search=:dfs, mode=:any)

# ╔═╡ fc2c4f4d-8df4-4ed0-b90e-4dd0dc6311d4
resolve(@julog(canget(state(middle, onbox, middle, hasnot))), clauses; search=:dfs, mode=:any)

# ╔═╡ 5335bf5d-fd53-49e4-bdee-561e41a29500
# resolve(@julog(canget(state(middle, onfloor, middle, hasnot))), clauses; search=:dfs, mode=:any)

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
# ╠═c7a00244-003f-11ed-2981-e914618f03d2
# ╠═268dfdc9-9751-4f83-be44-f2b928804c7a
# ╠═34e5a2e0-9df1-4feb-9162-1236d131ca80
# ╠═d0900172-c3fa-4ce5-b467-18eaaca2550f
# ╠═fc2c4f4d-8df4-4ed0-b90e-4dd0dc6311d4
# ╠═5335bf5d-fd53-49e4-bdee-561e41a29500
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
