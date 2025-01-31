# The code in this file has been written using part of the code in the Qiskit tutorial below.
# https://github.com/Qiskit/qiskit-finance/blob/stable/0.3/docs/tutorials/01_portfolio_optimization.ipynb

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

import datetime

import numpy as np
from qiskit.algorithms import QAOA, VQE, NumPyMinimumEigensolver
from qiskit.algorithms.optimizers import COBYLA
from qiskit.circuit.library import TwoLocal
from qiskit.utils import QuantumInstance, algorithm_globals
from qiskit_finance.applications.optimization import PortfolioOptimization
from qiskit_finance.data_providers import RandomDataProvider
from qiskit_optimization.algorithms import MinimumEigenOptimizer

from qdd import QddProvider


class TestPortofolioOptimization:

    def test_portofolio_optimization(self):
        # set number of assets (= number of qubits)
        num_assets = 4
        seed = 123

        # Generate expected return and covariance matrix from (random) time-series
        stocks = [("TICKER%s" % i) for i in range(num_assets)]
        data = RandomDataProvider(
            tickers=stocks,
            start=datetime.datetime(2016, 1, 1),
            end=datetime.datetime(2016, 1, 30),
            seed=seed,
        )
        data.run()
        mu = data.get_period_return_mean_vector()
        sigma = data.get_period_return_covariance_matrix()

        q = 0.5  # set risk factor
        budget = num_assets // 2  # set budget

        portfolio = PortfolioOptimization(
            expected_returns=mu, covariances=sigma, risk_factor=q, budget=budget
        )
        qp = portfolio.to_quadratic_program()

        # Numpy
        exact_mes = NumPyMinimumEigensolver()
        exact_eigensolver = MinimumEigenOptimizer(exact_mes)
        result_numpy = exact_eigensolver.solve(qp)

        # VQE
        algorithm_globals.random_seed = 1234
        backend = QddProvider().get_backend()
        cobyla = COBYLA()
        cobyla.set_options(maxiter=500)
        ry = TwoLocal(num_assets, "ry", "cz", reps=3, entanglement="full")
        quantum_instance = QuantumInstance(backend=backend, seed_transpiler=seed, seed_simulator=seed)
        vqe_mes = VQE(ry, optimizer=cobyla, quantum_instance=quantum_instance)
        vqe = MinimumEigenOptimizer(vqe_mes)
        result_vqe = vqe.solve(qp)
        assert np.all(result_vqe.x == result_numpy.x)

        # QAOA
        cobyla = COBYLA()
        cobyla.set_options(maxiter=250)
        quantum_instance = QuantumInstance(backend=backend, seed_transpiler=seed, seed_simulator=seed)
        qaoa_mes = QAOA(optimizer=cobyla, reps=3, quantum_instance=quantum_instance)
        qaoa = MinimumEigenOptimizer(qaoa_mes)
        result_qaoa = qaoa.solve(qp)
        assert np.all(result_qaoa.x == result_numpy.x)
