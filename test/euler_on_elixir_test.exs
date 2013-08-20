Code.require_file "test_helper.exs", __DIR__

defmodule EulerOnElixirTest do
  use ExUnit.Case, async: true
  #EulerOnElixir.modules |> Enum.map(doctest &1)
  doctest Euler.Maths
  doctest Euler.Problem1
  doctest Euler.Problem2
  doctest Euler.Problem3
  doctest Euler.Problem4
  doctest Euler.Problem5
  doctest Euler.Problem6
  doctest Euler.Problem7
  doctest Euler.Problem8
  doctest Euler.Problem9
end
