defmodule Jibber.Account do
  def login(email, password) do
    {:ok, %{email: email, password: password}}
  end
end
