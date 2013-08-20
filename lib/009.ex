defmodule Euler.Problem9 do
  @moduledoc """
    http://projecteuler.net/problem=9

	A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

	a^2 + b^2 = c^2
	For example, 3^2 + 4^2 = 5^2   9 + 16 = 25

	There exists exactly one Pythagorean triplet for which a + b + c = 1000.
	Find the product abc.
	"""

    @doc """
    Solves problem 9.

    The main insight here is that we can get rid of much of the calculation by
	doing a smaller equivalent calculation.
	Let's assume:

	a = 2*m*n
	b = m^2 - n^2
	then as a^2 + b^2 = c^2, involves that:
	c = m^2 + n^2

	as
	a + b + c = total_sum

	2mn + m^2 - n^2 + m^2 + n^2 = total_sum
	=>
	2m(m+n) = total_sum


    ## Examples
    iex> Euler.Problem9.solve(12)
    3*4*5
    """
  def solve(total_sum) do
	#we look for the solution 2m(m+n) = total_sum
	#m(m+n) = total_sum/2
	target = total_sum/2

	max_loop = trunc(:math.sqrt(target))
	{sol_m, sol_n} = Enum.find_value 2..max_loop, fn m ->
	  n = Enum.find(1..m, fn n -> m*(m+n) == target end)
	  if n, do: { m, n }
	end

	#solution is multiplying everything which is
	# (m^4 - n^4) * 2*m*n
	trunc((:math.pow(sol_m, 4) - :math.pow(sol_n, 4)) * 2 * sol_m * sol_n)

  end

    def print do
	  IO.puts solve(1000)
    end
end