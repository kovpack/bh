defmodule Bh.Bh3.Alert do
  @moduledoc """
  Twitter Bootstrap 3 alert helpers for Phoenix.
  """

  use Phoenix.HTML

  defdelegate bh_alert(text, opts \\ []), to: Bh.Bh4.Alert
end
