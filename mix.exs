defmodule Identicon.MixProject do
  use Mix.Project

  def project do
    [
      app: :identicon2,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Identicon2",
      source_url: "https://github.com/RamzziSudip/Identicon/"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:egd, github: "erlang/egd"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    "This package converts any hash value, IP address, name into and unique image. The unique image will be the same for the same string"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "identicon2",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/RamzziSudip/Identicon"}
    ]
  end
end
