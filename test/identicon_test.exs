defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "rgb colors tuple size is 3" do
    demo_hex = Identicon.string_to_md5("random word")
    %Identicon.Image{color: color} = Identicon.pick_color(demo_hex)
    assert tuple_size(color) == 3
  end
end
