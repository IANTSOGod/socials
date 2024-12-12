defmodule Socials.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:image) do
      add :path, :string
      add :pub_id, references(:publications, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:image, [:pub_id])
  end
end
