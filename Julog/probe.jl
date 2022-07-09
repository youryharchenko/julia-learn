### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 7ee9136e-ff87-11ec-34e8-230861bc1e1a
using Julog

# ╔═╡ 0dc9594b-ec8c-41bb-8ad5-089dd3cb4bd9
@julog teacher(bodhidharma, huike)

# ╔═╡ e869d831-0499-494f-aea4-5117458fa497
@julog grandteacher(A, C) <<= teacher(A, B) & teacher(B, C)

# ╔═╡ 98c48b65-67e2-4cda-9ad0-39b85ae15728
clauses = @julog [
  ancestor(sakyamuni, bodhidharma) <<= true,
  teacher(bodhidharma, huike) <<= true,
  teacher(huike, sengcan) <<= true,
  teacher(sengcan, daoxin) <<= true,
  teacher(daoxin, hongren) <<= true,
  teacher(hongren, huineng) <<= true,
  ancestor(A, B) <<= teacher(A, B),
  ancestor(A, C) <<= teacher(B, C) & ancestor(A, B),
  grandteacher(A, C) <<= teacher(A, B) & teacher(B, C)
]

# ╔═╡ f63c8d88-d702-4b06-8fb8-7ce2d5d93416
goals1 = @julog [ancestor(sakyamuni, huineng)]

# ╔═╡ 4b9313a5-7232-443b-bb1b-8ba3d02588b7
resolve(goals1, clauses)

# ╔═╡ 3226ebd8-ee27-42b7-a030-5b4623b25540
goals2 = @julog [grandteacher(X, Y)]

# ╔═╡ 6707bc38-a148-4a4b-b183-8389dc14aa32
resolve(goals2, clauses)

# ╔═╡ 4186f5b3-1151-4311-b431-8da4a5c596c4
derivations(clauses, 1)

# ╔═╡ a927f41b-ee20-4c8d-acfe-095126a11c33
derivations(clauses, Inf)

# ╔═╡ 6c39210b-e6e9-4152-8f43-826fc43b6d67
@julog irrational($(exp(1)))

# ╔═╡ 089254fa-4b38-4459-a82e-ba5bc8373e9f
e = Const(exp(1))

# ╔═╡ 1908d8b2-59e7-4863-93f8-c1472eadfa80
@julog irrational(:e)

# ╔═╡ 86a25928-8ff8-42ed-99c1-500737b37782
[@julog(height(:p, cm($(rand(140:200))))) for p in @julog([avery, bailey, casey, darcy])]

# ╔═╡ fe540395-3cb4-4ceb-8a5b-df312b59efe9
begin
	funcs = Dict()
	funcs[:pi] = pi
	funcs[:sin] = sin
	funcs[:cos] = cos
	funcs[:square] = x -> x * x
	funcs[:lookup] = Dict((:foo,) => "hello", (:bar,) => "world")
	funcs
end

# ╔═╡ 00074235-bcaf-467e-80c8-20cc39c9c167
resolve(@julog(sin(pi / 2) == 1), Clause[], funcs=funcs)

# ╔═╡ 903af531-bbe7-4daa-8775-b6ad2f26d3b3
resolve(@julog(cos(pi) == -1), Clause[], funcs=funcs)

# ╔═╡ 59bcea80-443d-496d-9b27-8787bcfdef45
resolve(@julog(square(9) == 82), Clause[], funcs=funcs)

# ╔═╡ 175655e8-e278-45d6-9ecc-d5701048facd
resolve(@julog(lookup(foo) == "hello"), Clause[], funcs=funcs)

# ╔═╡ a8ba28fa-13aa-496e-b718-c681dcf1f72f
formula = @julog and(not(and(a, not(b))), c)

# ╔═╡ fa9fa691-cfdf-4555-a99a-20104120b064
to_nnf(formula)

# ╔═╡ edfc7fbe-f69e-43c4-b577-a913b5cd9eac
to_cnf(formula)

# ╔═╡ c3fd7fe8-4da3-4602-94a0-a5f9744e9996
to_dnf(formula)

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
# ╠═7ee9136e-ff87-11ec-34e8-230861bc1e1a
# ╠═0dc9594b-ec8c-41bb-8ad5-089dd3cb4bd9
# ╠═e869d831-0499-494f-aea4-5117458fa497
# ╠═98c48b65-67e2-4cda-9ad0-39b85ae15728
# ╠═f63c8d88-d702-4b06-8fb8-7ce2d5d93416
# ╠═4b9313a5-7232-443b-bb1b-8ba3d02588b7
# ╠═3226ebd8-ee27-42b7-a030-5b4623b25540
# ╠═6707bc38-a148-4a4b-b183-8389dc14aa32
# ╠═4186f5b3-1151-4311-b431-8da4a5c596c4
# ╠═a927f41b-ee20-4c8d-acfe-095126a11c33
# ╠═6c39210b-e6e9-4152-8f43-826fc43b6d67
# ╠═089254fa-4b38-4459-a82e-ba5bc8373e9f
# ╠═1908d8b2-59e7-4863-93f8-c1472eadfa80
# ╠═86a25928-8ff8-42ed-99c1-500737b37782
# ╠═fe540395-3cb4-4ceb-8a5b-df312b59efe9
# ╠═00074235-bcaf-467e-80c8-20cc39c9c167
# ╠═903af531-bbe7-4daa-8775-b6ad2f26d3b3
# ╠═59bcea80-443d-496d-9b27-8787bcfdef45
# ╠═175655e8-e278-45d6-9ecc-d5701048facd
# ╠═a8ba28fa-13aa-496e-b718-c681dcf1f72f
# ╠═fa9fa691-cfdf-4555-a99a-20104120b064
# ╠═edfc7fbe-f69e-43c4-b577-a913b5cd9eac
# ╠═c3fd7fe8-4da3-4602-94a0-a5f9744e9996
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
