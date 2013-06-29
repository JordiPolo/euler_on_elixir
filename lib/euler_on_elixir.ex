defmodule EulerOnElixir do

  def main(args) do
    args
     |> parse_args
     |> run
  end

  defp parse_args(argv) do
      parse = OptionParser.parse(argv)
      case parse do
        {_, [command]} -> command
        _              -> :hep
      end
  end

  defp run(:help) do
    IO.puts """
      Usage: 
        euler_on_elixir definitions  to see the definitions of the problems
        euler_on_elixir available    to see the number of the available problems
    """
  end

  defp run("definitions") do
    Euler.definitions
  end

  defp run("available") do
    Euler.print_problems_numbers
  end

  defp run(_) do
    run(:help)
  end
end

