defmodule Identicon do
  @moduledoc """
  `Identicon` is a module that that helps to convert a sting
  into a spacial type of image
  """

  @doc """
  Main function that will do the conversion.
  """
  @spec main(String.t()) :: any
  def main(str) do
    str
    |> string_to_md5
    |> pick_color
    |> build_grid
    |> build_pixel_map
    |> draw_image
    |> save_image(str)
  end

  @spec save_image(binary, String.t()) :: :ok | {:error, atom}
  def save_image(image, filename) do
    File.write("#{filename}.png", image)
  end

  @spec draw_image(%Identicon.Image{}) :: binary
  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)
    brown = :egd.color({97, 88, 109})
    yellow = :egd.color({226, 211, 182})

    :egd.filledRectangle(image, {0, 0}, {250, 250}, brown)

    for i <- 0..5 do
      for j <- 0..5 do
        h1 = i * 50
        h2 = j * 50
        :egd.filledRectangle(image, {h1 + 2, h2 + 2}, {h1 + 48, h2 + 48}, yellow)
      end
    end

    Enum.each(
      pixel_map,
      fn {start, stop} ->
        :egd.filledRectangle(image, start, stop, fill)
      end
    )

    :egd.render(image)
  end

  @spec build_pixel_map(%Identicon.Image{}) :: %Identicon.Image{}
  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map =
      Enum.map(grid, fn {_value, index} ->
        horizontal = rem(index, 5) * 50
        vertical = div(index, 5) * 50

        top_left = {horizontal + 2, vertical + 2}
        bottom_right = {horizontal + 48, vertical + 48}

        {top_left, bottom_right}
      end)

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  @spec build_grid(%Identicon.Image{}) :: %Identicon.Image{}
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()
      |> filter_odds_squares

    %Identicon.Image{image | grid: grid}
  end

  @spec filter_odds_squares([{term, integer}]) :: [{term, integer}]
  def filter_odds_squares(grid) do
    Enum.filter(grid, fn {value, _index} ->
      rem(value, 2) == 0
    end)
  end

  @spec mirror_row([byte]) :: [byte]
  def mirror_row(row) do
    [hex_1, hex_2 | _tail] = row
    row ++ [hex_2, hex_1]
  end

  @spec pick_color(%Identicon.Image{}) :: %Identicon.Image{}
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  @spec string_to_md5(Stream.t()) :: %Identicon.Image{hex: [byte]}
  def string_to_md5(str) do
    hex =
      :crypto.hash(:md5, str)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
