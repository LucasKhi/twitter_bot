defmodule TwitterBotTest do
  use ExUnit.Case
  doctest TwitterBot

  test "greets the world" do
    assert TwitterBot.hello() == :world
  end
end
