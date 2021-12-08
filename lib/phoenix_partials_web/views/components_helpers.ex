defmodule PhoenixPartialsWeb.ComponentsHelpers do
  def comp(name) do
    comp(name, [])
  end
  def comp(name, assigns, do: block) do
    comp(name, Enum.concat([do: block], assigns))
  end
  def comp(name, content, assigns) when is_binary(content) do
    comp(name, Enum.concat([do: content], assigns))
  end
  def comp(name, {:safe, content}, assigns) when is_binary(content) do
    comp(name, Enum.concat([do: {:safe, content}], assigns))
  end
  def comp(name, {:safe, content}) when is_binary(content) do
    comp(name, [do: {:safe, content}])
  end
  def comp(name, content) when is_binary(content) do
    comp(name, [do: content])
  end
  def comp(name, content) when is_number(content) do
    comp(name, [do: content])
  end
  def comp(name, {:safe, _} = content) do
    comp(name, [do: content])
  end
  def comp(name, assigns) do
    PhoenixPartialsWeb.ComponentsView.render("_#{name}.html", Enum.concat([conn: PhoenixPartialsWeb.Endpoint], assigns))
  end

  def call_if_requred(v) when is_function(v) do
    v.()
  end
  def call_if_requred(v) do
    v
  end
end