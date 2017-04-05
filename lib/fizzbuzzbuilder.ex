defmodule Fizzbuzzbuilder do
  def new_fizzbuzz do
    %Fizzbuzzbuilder.Fizzbuzz{}
  end

  def from(fizzbuzz, min) do
    %{fizzbuzz | min: min}
  end

  def to(fizzbuzz, max) do
    %{fizzbuzz | max: max}
  end

  def triggered_by(%Fizzbuzzbuilder.Fizzbuzz{triggers: triggers} = fizzbuzz, name, condition) do
    %{fizzbuzz | triggers: triggers ++ [{name, condition}]}
  end

  def result(%Fizzbuzzbuilder.Fizzbuzz{min: min, max: max, triggers: triggers}) do
    Enum.map(min..max, fn x ->
      case build_string(x, triggers) do
        "" -> to_string(x)
        string -> string
      end
    end)
  end

  defp build_string(x, triggers) do
    Enum.reduce(triggers, "", fn {name, condition}, acc ->
      case condition.(x) do
        true -> acc <> name
        false -> acc
      end
    end)
  end

  def fizzbuzztest(min, max) do
    new_fizzbuzz()
    |> from(min)
    |> to(max)
    |> triggered_by("Fizz", fn x -> rem(x, 3) == 0 end)
    |> triggered_by("Buzz", fn x -> rem(x, 5) == 0 end)
    |> result
  end
end
