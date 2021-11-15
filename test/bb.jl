using .BB, Test

halt = -1

t = Dict(
    0 => [BB.Symbol(1, 1, 1), BB.Symbol(1, 1, halt)],
    1 => [BB.Symbol(1, -1, 1), BB.Symbol(0, 1, 2)],
    2 => [BB.Symbol(1, -1, 2), BB.Symbol(1, -1, 0)]
)

theoretical_res = """
A 1RB 1RH 
C 1LC 1LA 
B 1LB 0RC 
"""

@testset "Machine" begin
    m = Machine(0, 0, t)
    BB.simulate(m)
    @test BB.fancy_machine(m) == theoretical_res
    @test m.S == 21
    @test m.Σ == 5
    @test m.tape.arr == [1, 1, 1, 1, 1, 0]
end