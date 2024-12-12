defmodule Socials.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "image" do
    field :path, :string

    belongs_to :publications, Socials.Publications.Publication, foreign_key: :pub_id
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:path, :pub_id])
    |> validate_required([:path, :pub_id])
  end
end
