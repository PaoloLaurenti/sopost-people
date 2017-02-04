defmodule SopostPeople.PersonController do
  use SopostPeople.Web, :controller

  alias SopostPeople.Person

  def index(conn, %{"location" => location}) do
    sanitized_location = String.downcase(location)
    query = from p in Person, where: p.location == ^sanitized_location
    people = Repo.all(query)
    render conn, "index.html", people: people
  end

  def index(conn, %{}) do
    people = Repo.all(Person)
    render conn, "index.html", people: people
  end

end
