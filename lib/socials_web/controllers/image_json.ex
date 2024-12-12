defmodule SocialsWeb.ImageJSON do
  alias Socials.Images.Image

  @doc """
  Renders a list of image.
  """
  def index(%{image: image}) do
    %{data: for(image <- image, do: data(image))}
  end

  @doc """
  Renders a single image.
  """
  def show(%{image: image}) do
    %{data: data(image)}
  end

  defp data(%Image{} = image) do
    %{
      id: image.id,
      path: image.path,
      pub_id: image.pub_id
    }
  end
end
