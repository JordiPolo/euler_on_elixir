defmodule EulerOnElixir do
#defmodule Euler do

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
    files = Path.wildcard "lib/*.ex"
    filenames = Enum.map files, Path.basename(&1)
    #      |> Path.wildcard
  #  |> Enum.map fn path -> Path.basename(path) end
   #   |> Enum.filter(fn filename -> valid_filename?(filename) end)
    #  |> Enum.map fn valid_name -> String.replace(valid_name, ".ex", "") end
      filenames = Enum.filter(filenames, valid_filename?(&1))
      Enum.map filenames, String.replace(&1, ".ex", "")
  end

  defp valid_filename?(filename) do
    current_file = Path.basename __FILE__
    filename != current_file && !String.starts_with?(filename, "_")
  end

  #TODO: why can not connect pipes?
  defp modules do
    numbers = problems
    |> Enum.map String.replace(&1, "0", "")
    Enum.map numbers, fn x -> "Problem#{x}" end
  end

  defp module_doc(module) do
    {{_, doc}, _} = Code.eval_string("Euler.#{module}.__info__(:moduledoc)")
    doc
  end
end

