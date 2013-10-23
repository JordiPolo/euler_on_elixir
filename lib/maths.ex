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

  #TODO Create a module which is a stream of prime numbers when streams can work
  #with infinite number of elements
  defmodule Primes do
	  @moduledoc """
	  We want to find primes as fast as possible.

	  Prime is a number which can only be divided by itself and 1.
	  As the divisors are alwas simetric with respect to Math.sqr(number)
	  We know that if we have not found any divisor till the sqrt then there will be not divisors
	  afterwards.

	  Also, any nonprime number can only be divided by previous found primes.

	  Also, we do not need to test every number, only odd numbers as even number are all non-prime

	  These two properties reduce drastically the number of divisions needed.
	  """

	  @doc """
	  Generates primes till a condition is fulfill

	  ## Examples
	  iex> Euler.Maths.Primes.generate_till(fn l, c -> c == 9 end)
	  [2,3,5,7]

	  iex> Euler.Maths.Primes.generate_till(fn l, c -> length(l) == 6 end)
	  [2,3,5,7,11,13]
	  """
	  def generate_till(condition) do
		  generate_till([2,3,5,7], 9, condition)
	  end

	  defp generate_till(list, current, condition) do
	    if condition.(list, current) do
		    list
	    else
	      {new_list, new_current} = generate(list, current)
		    generate_till(new_list, new_current, condition)
	    end
	  end

      @doc """
	  Generates the next prime in the sequence of natural number not contained in the list
	  Returns the list with the next prime and the next possible natural number after it

	  ## Examples
	  iex> Euler.Maths.Primes.generate([2,3],5)
	  {[2, 3, 5], 7}

	  iex> Euler.Maths.Primes.generate([2,3,5,7], 9)
	  {[2,3,5,7], 11}

	  """
	  def generate(list, current) do
		  #TODO: make my own squares table to avoid this processing
		  #square_root = trunc(:math.sqrt(current))
		  #possible_divisors = Enum.filter(list, fn x -> x<=square_root end)
		  # smaller divisors have higher chances of dividing
		  #divisors = Enum.reverse(list) #possible_divisors)
		 # divisors = list
		  # current + 2 because we do not want to test even numbers
		  new_current = current + 2 #next_possible_prime(current)

		  if prime?(current, list) do
		    {Enum.concat(list,[current]), new_current}
		  else
		    {list, new_current}
		   # generate(list, new_current)
		  end
	  end

	  defp prime?(number, possible_divisors) do
		!Enum.any?(possible_divisors, fn divisor -> rem(number, divisor) == 0 end )
	  end

#	  defp ceiling(number) when is_integer(number) do
#	    number
#	  end

#	  defp ceiling(number) when is_float(number) do
#		trunc(number) + 1
#	  end

  end
end