defmodule GithubstairsWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.
  See `Phoenix.Controller.action_fallback/1` for more details.
  """

  use GithubstairsWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(GithubstairsWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(GithubstairsWeb.ErrorView)
    |> render(:"422")
  end

  def call(conn, {:error, _failed_operation, %Ecto.Changeset{}, _changes_so_far}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(GithubstairsWeb.ErrorView)
    |> render(:"422")
  end
end
