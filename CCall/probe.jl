### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 121a4690-01cb-11ed-0e00-954ce4d0274a
t = ccall(:clock, Int32, ())

# ╔═╡ af2abb8e-6095-4000-9501-71a051bd4195
c_home = ccall((:getenv, "libc.so.6"), Cstring, (Cstring,), "HOME")

# ╔═╡ 49d303f8-a877-41d8-afaf-a825c5a3d8c9
if c_home == C_NULL
	"is null"
else
	unsafe_string(c_home)
end

# ╔═╡ 7bdeae94-e09a-4b4a-9589-373d4904f155
function gethostname()
    hostname = Vector{UInt8}(undef, 256) # MAXHOSTNAMELEN
    err = ccall((:gethostname, "libc.so.6"), Int32,
                (Ptr{UInt8}, Csize_t),
                hostname, sizeof(hostname))
    Base.systemerror("gethostname", err != 0)
    hostname[end] = 0 # ensure null-termination
    return GC.@preserve hostname unsafe_string(pointer(hostname))
end

# ╔═╡ f1202921-ccdc-4536-8a84-8b2cae2ede45
gethostname()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═121a4690-01cb-11ed-0e00-954ce4d0274a
# ╠═af2abb8e-6095-4000-9501-71a051bd4195
# ╠═49d303f8-a877-41d8-afaf-a825c5a3d8c9
# ╠═7bdeae94-e09a-4b4a-9589-373d4904f155
# ╠═f1202921-ccdc-4536-8a84-8b2cae2ede45
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
