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
    definitions
  end

  defp run("available") do
    print_problems_numbers
  end

  defp run(_) do
    run(:help)
  end

  def definitions do
    docs = Enum.map problems_names, problem_doc(&1)
    data = Enum.zip problems_names, docs
    IO.puts("")
    Enum.map data, fn {problem_name, doc} -> 
      IO.puts("Euler #{problem_name}:")
      IO.puts(doc)
      IO.puts("")
    end
  end

  def print_problems_numbers do
    IO.puts "Currently we have solutions of the problems:"
    Enum.map problems, IO.puts &1
  end

  def problems do
    Path.wildcard("lib/*.ex")
     |> Enum.map(Path.basename(&1))
     |> Enum.filter(valid_filename?(&1))
     |> Enum.map( String.replace(&1, ".ex", ""))
  end

  def modules do
    problems_names
     |> Enum.map(fn name -> Code.eval_string("Euler.#{name}") end)
  end


  defp valid_filename?(filename) do
    current_file = Path.basename __FILE__
    filename != current_file && !String.starts_with?(filename, "_")
  end

  defp problems_names do
    problems
     |> Enum.map(String.replace(&1, "0", ""))
     |> Enum.map(fn x -> "Problem#{x}" end)
  end

  defp problem_doc(problem_name) do
    {{_, doc}, _} = Code.eval_string("Euler.#{problem_name}.__info__(:moduledoc)")
    doc
  end
end

