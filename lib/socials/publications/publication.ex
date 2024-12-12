defmodule Socials.Publications.Publication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "publications" do
    field :description, :string
    field :titre, :string

    belongs_to :user, Socials.Users.User, foreign_key: :user_id
    has_many :image, Socials.Images.Image
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(publication, attrs) do
    publication
    |> cast(attrs, [:titre, :description, :user_id])
    |> validate_required([:titre, :description, :user_id])
  end
end
