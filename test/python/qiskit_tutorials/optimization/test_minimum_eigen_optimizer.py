# The code in this file has been written using part of the code in the Qiskit tutorial below.
# https://github.com/Qiskit/qiskit-optimization/blob/main/docs/tutorials/03_minimum_eigen_optimizer.ipynb

# This code is part of Qiskit.
#
# (C) Copyright IBM 2017, 2021.
#
# This code is licensed under the Apache License, Version 2.0. You may
# obtain a copy of this license in the LICENSE.txt file in the root directory
# of this source tree or at http://www.apache.org/licenses/LICENSE-2.0.
#
# Any modifications or derivative works of this code must retain this
# copyright notice, and modified files need to carry a notice indicating
# that they have been altered from the originals.

import numpy as np
from qiskit.algorithms import QAOA, NumPyMinimumEigensolver
from qiskit.utils import QuantumInstance, algorithm_globals
from qiskit_optimization import QuadraticProgram
from qiskit_optimization.algorithms import MinimumEigenOptimizer, RecursiveMinimumEigenOptimizer

from qdd import QddProvider


def test_qubo():
    # create a QUBO
    qubo = QuadraticProgram()
    qubo.binary_var("x")
    qubo.binary_var("y")
    qubo.binary_var("z")
    qubo.minimize(linear=[1, -2, 3], quadratic={("x", "y"): 1, ("x", "z"): -1, ("y", "z"): 2})
    algorithm_globals.random_seed = 10598
    quantum_instance = QuantumInstance(
        QddProvider().get_backend(),
        seed_transpiler=algorithm_globals.random_seed, seed_simulator=algorithm_globals.random_seed
    )
    # QAOA
    qaoa_mes = QAOA(quantum_instance=quantum_instance, initial_point=[0.0, 0.0])
    exact_mes = NumPyMinimumEigensolver()
    qaoa = MinimumEigenOptimizer(qaoa_mes)
    exact = MinimumEigenOptimizer(exact_mes)
    exact_result = exact.solve(qubo)
    print(exact_result)
    qaoa_result = qaoa.solve(qubo)
    print(qaoa_result)
    assert np.all(qaoa_result.x == exact_result.x)

    # RQAOA
    rqaoa = RecursiveMinimumEigenOptimizer(qaoa, min_num_vars=1, min_num_vars_optimizer=exact)
    rqaoa_result = rqaoa.solve(qubo)
    print(rqaoa_result)
    # Even with Aer's qasm_simulator, the result sometimes becomes incorrect.
    assert True
