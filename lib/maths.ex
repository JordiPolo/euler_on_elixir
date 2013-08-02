defmodule Euler.Maths do


  @doc """
  Zip two arrays together, it does not matter the respective sizes
  if one array is bigger than the other, nil are used to fill


  ## Examples
  iex> Euler.Maths.fullzip([1,2,3], [])
  [{1, nil}, {2, nil}, {3, nil}]

  iex> Euler.Maths.fullzip([1,2,3], [2,2,2])
  [{1, 2}, {2, 2}, {3, 2}]

  iex> Euler.Maths.fullzip([1,2,3], [2,2,2,2,2])
  [{1, 2}, {2, 2}, {3, 2}, {nil, 2}, {nil, 2}]
  """
  def fullzip(list1, list2) do
    list_size = max(length(list1), length(list2))
  	Enum.map 0..list_size-1, fn(index) ->
  	  {Enum.at(list1, index), Enum.at(list2, index) }
  	end
  end

  @doc """
  Multiplies all the values on this vector

  ## Examples
  iex> Euler.Maths.mult([5,2,2])
  20

  iex> Euler.Maths.mult [3,3,2]
  18
  """
  def mult(list) do
  	Enum.reduce list, 1, fn(val,acc) -> acc * val end
  end

  @doc """
  Sums all the values on this vector

  ## Examples
  iex> Euler.Maths.sum([5,2,2])
  9

  iex> Euler.Maths.sum [3,3,2]
  8
  """
  def sum(list) do
  	Enum.reduce list, 0, fn(val,acc) -> acc + val end
  end


  @doc """
  Finds the factorization of a number.

  ## Examples
  iex> Euler.Maths.factorization(20)
  [5, 2, 2]

  iex> Euler.Maths.factorization 18
  [3, 3, 2]

  iex> Euler.Maths.factorization 3
  [3]
  """
  def factorization(number) do
    do_factorization(number,2,[])
  end

  defp do_factorization(number, divisor, acc) when divisor > number do
    acc
  end

  defp do_factorization(number, divisor, acc) when rem(number,divisor) == 0 do
    do_factorization( div(number, divisor), divisor, [divisor|acc])
  end

  defp do_factorization(number, divisor, acc) when rem(number, divisor) != 0 do
    do_factorization(number, divisor+1, acc)
  end

end