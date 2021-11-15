using .BB, Test

halt = -1

t = Dict(
    0 => [
        BB.Symbol(1, 1, 1),
        BB.Symbol(1, 1, halt)
    ],
    1 => [
        BB.Symbol(1, -1, 1),
        BB.Symbol(0, 1, 2)
    ],
    2 => [
        BB.Symbol(1, -1, 2),
        BB.Symbol(1, -1, 0)
    ]
)

m = Machine(0, 0, t)

BB.simulate(m)
fm = BB.fancy_machine(m)
print(fm)