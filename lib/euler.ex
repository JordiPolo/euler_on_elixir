defmodule Euler do
  def definitions do
    docs = Enum.map problems_names, problem_doc(&(&1))
    data = Enum.zip problems_names, docs
    IO.puts("")
    Enum.map data, fn {problem_name, doc} ->
      IO.puts("Euler #{problem_name}:")
      IO.puts(doc)
      IO.puts("")
    end
  end

  def print_problems_numbers do
    IO.puts "Currently we have solutions for the problems:"
    Enum.map problems, IO.puts &(&1)
  end

  def problems do
    Path.wildcard("lib/*.ex")
     |> Enum.map(Path.basename(&(&1)))
     |> Enum.filter(valid_filename?(&(&1)))
     |> Enum.map( String.replace(&(&1), ".ex", ""))
  end

  def modules do
    problems_names
     |> Enum.map(fn name -> Code.eval_string("Euler.#{name}") end)
  end


  defp valid_filename?(filename) do
    String.starts_with?(filename, "0")
  end

  defp problems_names do
    problems
     |> Enum.map(String.replace(&(&1), "0", ""))
     |> Enum.map(fn x -> "Problem#{x}" end)
  end

  defp problem_doc(problem_name) do
    {{_, doc}, _} = Code.eval_string("Euler.#{problem_name}.__info__(:moduledoc)")
    doc
  end
end

