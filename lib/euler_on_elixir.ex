defmodule EulerOnElixir do

  def main(args) do
    definitions
  end

  def definitions do
    docs = Enum.map modules, module_doc(&1)
    data = Enum.zip modules, docs
    IO.puts("")
    Enum.map data, fn {module, doc} -> 
      IO.puts("Euler #{module}:")
      IO.puts(doc)
      IO.puts("")
    end
  end

  def print do
    IO.puts "Currently we have solutions of the problems:"
    Enum.map problems, IO.puts &1
  end

  def problems do
    Path.wildcard("lib/*.ex")
     |> Enum.map(Path.basename(&1))
     |> Enum.filter(valid_filename?(&1))
     |> Enum.map( String.replace(&1, ".ex", ""))
  end

  defp valid_filename?(filename) do
    current_file = Path.basename __FILE__
    filename != current_file && !String.starts_with?(filename, "_")
  end

  #TODO: why can not connect pipes?
  defp modules do
    problems
     |> Enum.map(String.replace(&1, "0", ""))
     |> Enum.map(fn x -> "Problem#{x}" end)
  end

  defp module_doc(module) do
    {{_, doc}, _} = Code.eval_string("Euler.#{module}.__info__(:moduledoc)")
    doc
  end
end

