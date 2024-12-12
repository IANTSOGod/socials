defmodule Socials.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :content, :string
      add :sender_id, references(:user, on_delete: :nothing)
      add :receiver_id, references(:user, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:message, [:sender_id])
    create index(:message, [:receiver_id])
  end
end
