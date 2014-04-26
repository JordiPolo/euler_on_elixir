defmodule EulerOnElixir.Mixfile do
  use Mix.Project

  def project do
    [ app: :euler_on_elixir,
      version: "0.0.1",
      elixir: "~> 0.12",
      name: "Euler on Elixir",
      source_url: "https://github.com/JordiPolo/euler_on_elixir",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    []
  end
end
