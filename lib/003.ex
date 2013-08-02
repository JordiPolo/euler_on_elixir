defmodule Euler.Problem3 do
  @moduledoc """
    http://projecteuler.net/problem=3
    The prime factors of 13195 are 5, 7, 13 and 29.
    What is the largest prime factor of the number 600851475143 ?
  """

  @doc """
  Solves problem 3.
  We want to find prime factors not all the factors.
  Prime factors by definition can not be divided by anything else,
  they have to appear en the list of factors of the number, almost by definition.

  So we are doing a 'lineal search' we divide the number by every number from
  2 to the number itself. This will eventually pass throught all factors
  and thus by all the prime factors.

  To speed this up, each time we find a factor, we divide the number by it.
  Because the result number still needs to be multiplied by the prime, we know
  we will find it in the new number.

  Note that this algorithm will not find all the posible factors. It will find only
  the prime factors.
  For instance, if we have 12, we will do  12,2 -> 6,2 -> 3,2 -> 3,3 and stop there.
  We would not find factors 4 or 6 but these are not prime and we do not care.

  When we divide we do not +1 to the divisor so this algorithm works on doble squares
  of numbers also (16, 81).

  At the end I am using Enum.max of the acc. We could return the number itself and should
  be the same result. After being divided by everything else the largest prime is the
  only thing left.

  ## Examples
  iex> Euler.Problem3.solve(13195)
  29

  iex> Euler.Problem3.solve(16)
  2
  """
  def solve(number) do
    number
    |> Euler.Maths.factorization
    |> Enum.max
  end

  def print do
    IO.puts solve(600_851_475_143)
  end


end

