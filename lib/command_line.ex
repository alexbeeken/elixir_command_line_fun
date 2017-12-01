defmodule CommandLine do
  def main(args) do
    args |> parse_args |> process
  end

  def prompt_for(thing, count \\ 0) do
    thing =
      "What is your #{thing}?\n"
      |> IO.gets
      |> String.downcase
      |> String.replace("\n", "")
    cond do
      count > 3 ->
        IO.puts "Too much nonsense"
        System.halt(0)
      length(String.split(thing)) == 1 ->
        thing
      true ->
        IO.puts "Classes must be one word"
        prompt_for(thing, count + 1)
    end
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    debug = "true" == options[:debug]
    IO.puts "debug mode is #{debug}"
    character =
      %{
        name: String.capitalize(prompt_for('name')),
        class: prompt_for('class')
      }
    IO.puts "Hello, #{character.name}. You are not yet a powerful #{character.class}."
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [name: :string]
    )
    options
  end
end
