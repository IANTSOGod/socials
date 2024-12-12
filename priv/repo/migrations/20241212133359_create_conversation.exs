defmodule Socials.Repo.Migrations.CreateConversation do
  use Ecto.Migration

  def change do
    create table(:conversation) do
      add :user_id_1, references(:user, on_delete: :nothing)
      add :user_id_2, references(:user, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:conversation, [:user_id_1])
    create index(:conversation, [:user_id_2])
  end
end
