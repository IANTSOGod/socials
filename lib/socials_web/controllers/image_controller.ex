defmodule SocialsWeb.ImageController do
  use SocialsWeb, :controller

  alias Socials.Images
  alias Socials.Images.Image

  action_fallback SocialsWeb.FallbackController

  def index(conn, _params) do
    image = Images.list_image()
    render(conn, :index, image: image)
  end

  def create(conn, %{"image" => image_params}) do
    with {:ok, %Image{} = image} <- Images.create_image(image_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/image/#{image}")
      |> render(:show, image: image)
    end
  end

  def show(conn, %{"id" => id}) do
    image = Images.get_image!(id)
    render(conn, :show, image: image)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Images.get_image!(id)

    with {:ok, %Image{} = image} <- Images.update_image(image, image_params) do
      render(conn, :show, image: image)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Images.get_image!(id)

    with {:ok, %Image{}} <- Images.delete_image(image) do
      send_resp(conn, :no_content, "")
    end
  end
end
