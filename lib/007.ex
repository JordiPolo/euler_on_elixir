defmodule Euler.Problem7 do
  @moduledoc """
    http://projecteuler.net/problem=7

	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
	we can see that the 6th prime is 13.

	What is the 10 001st prime number?
  """

  @doc """
  Solves problem 7.

  ## Examples
  iex> Euler.Problem7.solve(6)
  13
  """
  def solve(max_number) do
    Euler.Maths.Primes.generate_till(fn list, _ -> length(list) == max_number end)
	|> List.last
  end

  def print do
    IO.puts solve(10001)
  end


end