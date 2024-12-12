defmodule Socials.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "image" do
    field :path, :string
    field :pub_id, :id

    belongs_to :publications, Publications.Publication
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:path])
    |> validate_required([:path])
  end
end
