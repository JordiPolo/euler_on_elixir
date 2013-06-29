defmodule Euler.Problem1 do

  @moduledoc """
    http://projecteuler.net/problem=1
    If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
    The sum of these multiples is 23.
    Find the sum of all the multiples of 3 or 5 below 1000.
  """

  @doc """
  Solves Euler problem 1

  ## Examples

    iex> Euler.Problem1.solve(10)
    23
  """
  def solve(limit) do
    multiples = Enum.filter 1..(limit-1), fn x -> ((rem(x, 3) == 0) || (rem(x, 5) == 0)) end
    Enum.reduce multiples, 0, &1 + &2
  end

  def print do
    IO.puts solve(1000)
  end
end

