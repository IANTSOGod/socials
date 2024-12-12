defmodule SocialsWeb.PublicationController do
  use SocialsWeb, :controller

  alias Socials.Publications
  alias Socials.Publications.Publication

  action_fallback SocialsWeb.FallbackController

  def index(conn, _params) do
    publications = Publications.list_publications()
    render(conn, :index, publications: publications)
  end

  def create(conn, %{"publication" => publication_params}) do
    with {:ok, %Publication{} = publication} <-
           Publications.create_publication(publication_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/publications/#{publication}")
      |> render(:show, publication: publication)
    end
  end

  def show(conn, %{"id" => id}) do
    publication = Publications.get_publication!(id)
    render(conn, :show, publication: publication)
  end

  def update(conn, %{"id" => id, "publication" => publication_params}) do
    publication = Publications.get_publication!(id)

    with {:ok, %Publication{} = publication} <-
           Publications.update_publication(publication, publication_params) do
      render(conn, :show, publication: publication)
    end
  end

  def delete(conn, %{"id" => id}) do
    publication = Publications.get_publication!(id)

    with {:ok, %Publication{}} <- Publications.delete_publication(publication) do
      send_resp(conn, :no_content, "")
    end
  end
end
