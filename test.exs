# hash_test.exs
import Bcrypt
defmodule HashTest do
    def hash_password(mdp) do
      Bcrypt.hash_pwd_salt(mdp)
    end
  end
  
  mdp = "monMotDePasse123"
  hashed_mdp = HashTest.hash_password(mdp)
  IO.puts("Mot de passe chiffré : #{hashed_mdp}")
  