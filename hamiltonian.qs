open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;

operation HamiltonianSimulation (time : Double, Hamiltonian : (Qubit[], Double)) : Unit is Adj {
    let numQubits = Length(Hamiltonian.Item1);
    let (register, coeff) = Hamiltonian;
    let gates = TimeEvolution(time, Hamiltonian);
    (Controlled gates)(new[] (0 .. numQubits - 1), register);
}
