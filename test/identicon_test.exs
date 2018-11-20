defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "hash_str should return hashed string" do
    s = Identicon.hash_str "hola"
    assert s == [77, 24, 99, 33, 193, 167, 240, 243, 84, 178, 151, 232, 145, 74, 178, 64]
  end

  test "pick_color should return a tuple of the first three" do
    list = [77, 24, 99, 33, 193, 167, 240, 243, 84, 178, 151, 232, 145, 74, 178, 64]
    image = %Identicon.Image{hex: list}
    coloredImage = Identicon.pick_color image
    assert coloredImage == %Identicon.Image{color: {77, 24, 99}, hex: list}
  end

  test "list_to_identicon should return a identicon" do
    list = [77, 24, 99, 33, 193, 167, 240, 243, 84, 178, 151, 232, 145, 74, 178, 64]
    identicon = Identicon.list_to_identicon list
    assert identicon == %Identicon.Image{hex: list}
  end

  test "mirror row should work" do 
    list = [22, 33, 205]
    mirror = Identicon.mirror_row list
    assert mirror == list ++ [33, 22]
  end
end
