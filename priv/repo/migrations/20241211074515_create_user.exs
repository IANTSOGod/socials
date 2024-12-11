defmodule Socials.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :mdp, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
