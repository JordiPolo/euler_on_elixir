defmodule Euler.Problem2 do
  @moduledoc """
    By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
    find the sum of the even-valued terms.
  """

  @doc """
    Solves problem 2.
    ## Examples
    iex> Euler.Problem2.solve(10)
    10

    iex> Euler.Problem2.solve(80)
    44
  """
  def solve(limit) do
    do_fib(0,1,0, limit)
  end

  def print do
    IO.puts solve(4_000_000)
  end

  defp do_fib(a, b, acc, limit) when b < limit do
    sum = a + b
    if rem(sum,2) == 0 do
      acc = sum + acc
    end
    do_fib(b, sum, acc, limit)
  end

  defp do_fib(_, b, acc, limit) when b >= limit do
    acc
  end


end

