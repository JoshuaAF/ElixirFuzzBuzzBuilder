defmodule FizzbuzzbuilderTest do
  use ExUnit.Case
  doctest Fizzbuzzbuilder

  test "classic fizzbuzz" do
    assert Fizzbuzzbuilder.fizzbuzztest(1, 15) == ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz",
 "13", "14", "FizzBuzz"]
  end
end
