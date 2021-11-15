module BB

export Symbol, Machine

"""
Classic BB only have 2 symbols for n states
"""

"""
symbol_write: Next symbol that is going to be write on the tape
tape_shift: Left or right tape (-1 or 1)
next_state: The next machine state
"""
struct Symbol
    symbol_write::Int
    tape_shift::Int
    next_state::Any
end

"""
n: states count
m: symbols count
table: Machine rules, dict keys are a state
M : Turing machine
S(M) is the number of tape shifts that M performs before stopping
Σ(M) is the number of symbols written on the tape for M before stopping
"""
mutable struct Machine
    state::Int
    symbol::Int
    table::Dict{Int, Vector{Symbol}}
    Σ::Int
    S::Int
    
    function Machine(state::Int, symbol::Int, table::Dict{Int, Vector{Symbol}})
        return (new(state, symbol, table, 0, 0))
    end
end


mutable struct Tape
    index::Int
    length::Int
    arr::Vector{Int}
end

"""
It generates every machine with n states and m symbols
"""
function generate(n::Int, m::Int)
    ;
end

"""
It generates only the revelants machine with n states and m symbols
"""
function candidate_generate(n::Int, m::Int)
    ;
end

function shift_tape(tape::Tape, shift::Int)
    tape.index += shift

    if (tape.index < 1)
        pushfirst!(tape.arr, 0)
        tape.length += 1
        tape.index = 1
    end
    if (tape.index >= tape.length)
        push!(tape.arr, 0)
        tape.length += 1
    end
end

function fancy_machine(m::Machine)
    msg = ""

    for (key, value) in m.table
        msg *= "ABCDEFGH"[key + 1] * " "
        for symbol in value
            msg *= string(symbol.symbol_write)
            msg *= symbol.tape_shift == 1 ? "R" : "L"
            n = symbol.next_state
            msg *= "ABCDEFGH"[n == -1 ? 8 : n + 1] * " "
        end
        msg *= "\n"
    end
    msg
end

function simulate(m::Machine)
    tape = Tape(1, 1, [0])

    while (m.state != -1)
        # Read symbol on the tape
        read_symbol = tape.arr[tape.index]
        
        # Find next rule
        next = m.table[m.state][read_symbol + 1]
        m.state = next.next_state
        m.symbol = next.symbol_write
        
        # Write symbol on the tape
        tape.arr[tape.index] = m.symbol
        
        # Shift the tape
        shift = next.tape_shift
        shift_tape(tape, shift)
        m.S += 1
    end
    m.Σ = count(symbol -> (symbol == 1), tape.arr)
end

"""
It finds the machine with the highest number of steps
"""
function bb(n::Int, m::Int)
    ;
end

end # BB