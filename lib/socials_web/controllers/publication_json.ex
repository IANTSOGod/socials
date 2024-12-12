defmodule SocialsWeb.PublicationJSON do
  alias Socials.Publications.Publication

  @doc """
  Renders a list of publications.
  """
  def index(%{publications: publications}) do
    %{publications: for(publication <- publications, do: data(publication))}
  end

  @doc """
  Renders a single publication.
  """
  def show(%{publication: publication}) do
    %{publication: data(publication)}
  end

  defp data(%Publication{} = publication) do
    %{
      id: publication.id,
      titre: publication.titre,
      description: publication.description,
      user_id: publication.user_id
    }
  end
end
