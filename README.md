euler_on_elixir
===============

Solutions for Project Euler coded in Elixir.

I am learning Elixir while coding these examples so do not expect
beautiful code.

Execute ``` iex lib/* ``` to load all the solutions in your terminal.
Then you can see the problems, their solutions or play with other values

* Read description of the problem:

  ```elixir
  h Euler.Problem1
  ```

* See solution to the problem:

  ```elixir
  Euler.Problem1.print
  ```

* Play with other values for this problem

  ```elixir
  Euler.Problem1.solve(100)
  ```

Make sure problems are correct in your machine:

```mix test```


You can create a command tool by executing:

```mix escriptize```

The command tool is called __euler_on_elixir__ currently it provides the
following commands:

```
 Usage:
  euler_on_elixir definitions  to see the definitions of the problems
  euler_on_elixir available    to see the number of the available problems
```
