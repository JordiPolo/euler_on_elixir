defmodule Euler.Problem5 do
  @moduledoc """
    http://projecteuler.net/problem=5
    2520 is the smallest number that can be divided by each of the numbers from 1 to 10
	without any remainder.

    What is the smallest positive number that is evenly divisible
	by all of the numbers from 1 to 20?
  """

  @doc """
  Solves problem 5.

  The main insight here is that this problem is in fact the mcm of these numbers.
  We do need to multiply their factorizations.
  For instance mcm 4, 6 is 12  because 4 =[2,2] and 6=[2,3]  so we only keep the unique
  factors we have [2,2,3] which is 12.

  ## Examples
  iex> Euler.Problem5.solve(10)
  2520
  """
  def solve(max_number) do
	  2..max_number
	  |> Enum.reduce([], fn(val, acc) ->
	  	factors = Euler.Maths.factorization(val)
		merge(factors,acc)
	  end)
	  |> Euler.Maths.mult
  end

  def print do
    IO.puts solve(20)
  end

  # Merges list1 into list2.
  # Whatever we find in list1 which can not be found on list2 will be added in our acum
  # the result is concatenate that to list2. We assume we want to add more stuff to list2
  defp merge(list1, list2) do
	result = Enum.reduce list1, [], fn(value, acum) ->
	  if !Enum.member?(list2, value) do
	    [value|acum]
	  else
		count_already = Enum.count(list2 ++ acum, fn x -> x == value end)
		count_here = Enum.count(list1, fn x -> x == value end)
		if count_here > count_already do
		  [value|acum]
		else
	      acum
		end
	  end
	end
	list2 ++ result
  end

end
