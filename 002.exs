
defmodule Euler002 do
  def fib(0,1) do
    do_fib(0,1,0)
  end

  def do_fib(a, b, acc) do
    sum = a + b
    if sum < 4000000 do
      if rem(sum,2) == 0 do
        acc = sum + acc
      end
      do_fib(b, sum, acc)
    else
      acc
    end
  end
end

IO.puts Euler002.fib(0,1)
