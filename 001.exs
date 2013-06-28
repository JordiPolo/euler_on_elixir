multiples = Enum.filter 1..999, fn x -> ((rem(x, 3) == 0) || (rem(x, 5) == 0)) end
result = Enum.reduce multiples, 0, &1 + &2
IO.puts result
