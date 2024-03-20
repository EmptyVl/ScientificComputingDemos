using SimpleLinearAlgebra
using UnicodePlots

@info "Running example: fast fourier transformation (FFT)"
@info "The DFT matrix of size 6 x 6 is:"
display(dft_matrix(6))

y = Complex.(exp.(-abs2.(((1:256) .- 128) ./ 3)))
@info """Let y be a gaussian function:"""
display(lineplot(abs.(y), title="y = exp(-|n-128|^2/10)", xlabel="n", ylabel="y[n]", color=:red))

fft!(y)
@info """After applying the FFT to y, we get:"""
display(lineplot(abs.(y), title="Y = FFT(y)", xlabel="k", ylabel="Y[k]", color=:blue))

fft!(y)
@info """After applying the FFT to y, we get:"""
display(lineplot(abs.(y), title="Y = FFT(y)", xlabel="k", ylabel="Y[k]", color=:blue))

y = Complex.(exp.(-abs2.(((1:256) .- 128) ./ 50)))
@info """Let y be a (broader) gaussian function:"""
display(lineplot(abs.(y), title="y = exp(-|n-128|^2/10)", xlabel="n", ylabel="y[n]", color=:red))

fft!(y)
@info """After applying the FFT to y, we get:"""
display(lineplot(abs.(y), title="Y = FFT(y)", xlabel="k", ylabel="Y[k]", color=:blue))


p, q = [1, 2, 3], [4, 5, 6]
@info """Multiplying two polynomials using FFT:
- p(x) = $(join(["$(p[i])x^$i" for i=1:length(p)], " + "))
- q(x) = $(join(["$(q[i])x^$i" for i=1:length(q)], " + "))
"""
result = fast_polymul(p, q)
@info """The result of the multiplication is:
- p(x) * q(x) = $(join(["$(result[i])x^$i" for i=1:length(result)], " + "))"
"""

