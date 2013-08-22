defmodule Euler.Problem10 do
  @moduledoc """
    http://projecteuler.net/problem=10

	The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

	Find the sum of all the primes below two million.

	"""

    @doc """
    Solves problem 10.

	Bruteforce finding all the primes.
	Using the same module than problem 7 and its optimization tecniques

    ## Examples
    iex> Euler.Problem10.solve(10)
    17
    """
  def solve(limit) do
    Euler.Maths.Primes.generate_till(fn _, current -> current >= limit end)
    |> Euler.Maths.sum
  end

  def print do
    IO.puts solve(2_000_000)
  end

  def timed_solve(limit) do
    IO.puts inspect(:erlang.localtime())
    IO.puts solve(limit)
    IO.puts inspect(:erlang.localtime())
  end
end