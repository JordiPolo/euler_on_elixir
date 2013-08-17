defmodule Euler.Problem7 do
  @moduledoc """
    http://projecteuler.net/problem=7

	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
	we can see that the 6th prime is 13.

	What is the 10 001st prime number?
  """

  @doc """
  Solves problem 7.

  We want to find primes as fast as possible.

  Prime is a number which can only be divided by itself and 1.
  As the divisors are alwas simetric with respect to Math.sqr(number)
  We know that if we have not found any divisor till the sqrt then there will be not divisors
  afterwards.

  Also, any nonprime number can only be divided by previous found primes.

  Also, we do not need to test every number, only odd numbers as even number are all non-prime

  These two properties reduce drastically the number of divisions needed.

  ## Examples
  iex> Euler.Problem7.solve(6)
  13
  """
  def solve(max_number) do
    do_solve([7,5,3,2],9,max_number)
  end

  def print do
    IO.puts solve(10001)
  end

  defp do_solve(list,_,size_limit) when length(list) == size_limit do
	hd(list)
  end

  defp do_solve(list, current,size_limit) do
	  #TODO: make my own squares table to avoid this processing
	  square_root = ceiling(:math.sqrt(current))
	  possible_divisors = Enum.filter(list, fn x -> x<=square_root end)
	  # smaller divisors have higher chances of dividing
	  divisors = Enum.reverse(possible_divisors)

	  # current + 2 because we do not want to test even numbers
	  if prime?(current, divisors) do
		do_solve([current|list], current+2, size_limit)
	  else
	    do_solve(list, current+2, size_limit)
	  end
  end

  defp prime?(_, possible_divisors) when length(possible_divisors) == 0 do
	  true
  end

  defp prime?(number, possible_divisors) do
	  [head|tail] = possible_divisors
	  !divisible_by?(number,head) && prime?(number, tail)
  end

  defp divisible_by?(number, divisor) do
	  rem(number,divisor) == 0
  end

  defp ceiling(number) when is_integer(number) do
    number
  end

  defp ceiling(number) when is_float(number) do
	trunc(number) + 1
  end



end