defmodule Socials.Repo.Migrations.CreatePublications do
  use Ecto.Migration

  def change do
    create table(:publications) do
      add :titre, :string
      add :description, :string
      add :user_id, references(:user, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:publications, [:user_id])
  end
end
