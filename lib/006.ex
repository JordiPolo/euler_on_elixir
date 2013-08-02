defmodule Euler.Problem6 do
  @moduledoc """
    http://projecteuler.net/problem=6

	The sum of the squares of the first ten natural numbers is,
	1^2 + 2^2 + ... + 10^2 = 385

	The square of the sum of the first ten natural numbers is,
	(1 + 2 + ... + 10)^2 = 55^2 = 3025

	Hence the difference between the sum of the squares of the first ten natural numbers
	and the square of the sum is 3025  385 = 2640.

	Find the difference between the sum of the squares of the first one hundred natural numbers
	and the square of the sum.
  """

  @doc """
  Solves problem 6.

  The main insight here is that we do not need to calculate the numbers to know the difference.
  The difference is the double of all the pairwise multiplications.
  For instance
  (1 + 2)^2 = 1^ + 2^2 + 2*1*2
  or
  (1 + 2 + 3)^2 = 1^ + 2^2 + 3^2 + 2*1*2 + + 2*1*3 + 2*2*3

  ## Examples
  iex> Euler.Problem6.solve(10)
  2640
  """
  def solve(max_number) do
	  1..max_number
	  |> Enum.to_list
	  |> all_combinations
	  |> Euler.Maths.sum
	  |> double
  end

  def print do
    IO.puts solve(100)
  end

  defp double(value) do
    value *2
  end

  defp all_combinations(list) do
    do_all_combinations(list, [])
  end

  defp do_all_combinations([],acc) do
    acc
  end

  defp do_all_combinations(list, acc) do
    [first|rest] = list
	first_combinations = Enum.map rest, fn x -> first * x end
	acum = acc ++ first_combinations
	do_all_combinations(rest, acum)
  end
end