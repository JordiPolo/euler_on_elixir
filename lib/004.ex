defmodule Euler.Problem4 do
  @moduledoc """
    http://projecteuler.net/problem=4
    A palindromic number reads the same both ways.
    The largest palindrome made from the product of two 2-digit numbers is 9009 = 91x99.
    Find the largest palindrome made from the product of two 3-digit numbers.
  """

  @doc """
  Solves problem 4.

  A couple of tricks:
  - The numbers will start with 9
  - At least one of the numbers will be multiple of 11

  Using these properties
  I hope to make this faster than the usual naive version

  ## Examples
  iex> Euler.Problem4.solve(2)
  9009
  """
  def solve(number_of_digits) do
    number_of_digits
    |> create_limits
    |> create_numbers
    |> multiply_everything
    |> List.flatten
    |> Enum.max
  end

  def print do
    IO.puts solve(3)
  end

  defp create_limits(digits) do
    [round(9*:math.pow(10, digits-1))|round(:math.pow(10,digits) -1)]
  end

  defp create_numbers([min|max]) do
    mult_11 = Enum.filter( min..max, fn x -> rem(x, 11) == 0 end)
    [mult_11| min..max]
  end

  defp multiply_everything([term1|term2]) do
    Enum.reduce(term2, [], fn(value, acc) ->
      multiplied = Enum.map(term1, &(&1 * value))
      palindromes = Enum.filter(multiplied, &(palindrome?(&1)))
      [acc|palindromes]
    end)
  end

  @doc """
  Tests if a number is palindrome.
  Leave this as public because may be useful in the future.

  ## Examples
  iex> Euler.Problem4.palindrome?(2)
  true

  iex> Euler.Problem4.palindrome?(1111211)
  false

  iex> Euler.Problem4.palindrome?(1234321)
  true
  """
  def palindrome?(number) do
    string = integer_to_binary(number)
    string == String.reverse(string)
  end

end
