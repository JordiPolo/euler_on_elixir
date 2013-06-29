Code.require_file "test_helper.exs", __DIR__

defmodule EulerOnElixirTest do
  use ExUnit.Case, async: true
  doctest Euler.Problem1
  doctest Euler.Problem2
end
