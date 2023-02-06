namespace GravitationalSimulation {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation TimeEvolution (time : Double, Hamiltonian : (Qubit[], Double)) : Unit {
        let numQubits = Length(Hamiltonian.Item1);
        let (register, coeff) = Hamiltonian;
        let gates = TimeEvolution(time, Hamiltonian);
        (Controlled gates)(new[] (0 .. numQubits - 1), register);
    }

    operation SimulateGravity (qubits : Qubit[]) : Unit {
        let time = 1.0;
        let g = 9.8;
        let mass = 1.0;
        let Hamiltonian = ((qubits, -0.5 * g * mass), 1.0);

        TimeEvolution(time, Hamiltonian);
    }
}
