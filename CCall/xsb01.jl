### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ b9cf2451-22be-44da-ab38-0799c45a0d0a
const XSB_LIB="/home/youry/XSB/config/x86_64-pc-linux-gnu/bin/libxsb.so"

# ╔═╡ 60f3c846-01d9-11ed-0897-21215563ee7b
function xsb_init_string(init_string::AbstractString)::Int32
	ccall(
		(:xsb_init_string, XSB_LIB), 
		Cint, 
		(Cstring,), 
		"$init_string -n"
	)
end

# ╔═╡ 0e178952-1974-4ca6-b2b7-1a772b60d0c0
function xsb_close()::Int32
	ccall(
		(:xsb_close, XSB_LIB), 
		Cint,
		()
	)
end

# ╔═╡ ab98ae0e-aba6-4455-8b09-30c8e4cab7f0
begin
	xsb_init_string("/home/youry/XSB")
	xsb_close()
end

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
# ╠═b9cf2451-22be-44da-ab38-0799c45a0d0a
# ╠═60f3c846-01d9-11ed-0897-21215563ee7b
# ╠═0e178952-1974-4ca6-b2b7-1a772b60d0c0
# ╠═ab98ae0e-aba6-4455-8b09-30c8e4cab7f0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
