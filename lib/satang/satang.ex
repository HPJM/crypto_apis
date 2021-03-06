defmodule CryptoApis.Satang do
  @moduledoc """
  https://docs.satangcorp.com
  """
  @root_url "https://satangcorp.com/api/v3"
  alias CryptoApis.Pair

  defp url(:exchange_info) do
    @root_url <> "/exchangeInfo"
  end

  defp url(:order_book) do
    @root_url <> "/depth"
  end

  defp url(:aggregate_trades) do
    @root_url <> "/aggTrades"
  end

  defp url(:ticker) do
    @root_url <> "/ticker/24hr"
  end

  defp process_pair(pair) do
    pair |> Pair.new() |> Pair.join(downcase?: true, delimiter: "_")
  end

  @doc """
  https://docs.satangcorp.com/apis-v3/public/exchange-information
  """
  def exchange_info(opts \\ []) do
    :exchange_info |> url() |> CryptoApis.get(opts)
  end

  @doc """
  https://docs.satangcorp.com/apis-v3/public/depth
  """
  def order_book(pair, params \\ [], opts \\ []) do
    pair = process_pair(pair)
    opts = Keyword.merge(opts, params: params ++ [symbol: pair])
    :order_book |> url() |> CryptoApis.get(opts)
  end

  @doc """
  https://docs.satangcorp.com/apis-v3/public/aggregate-trade
  """
  def aggregate_trades(pair, params \\ [], opts \\ []) do
    pair = process_pair(pair)
    opts = Keyword.merge(opts, params: params ++ [symbol: pair])
    :aggregate_trades |> url() |> CryptoApis.get(opts)
  end

  @doc """
  https://docs.satangcorp.com/apis-v3/public/ticker
  """
  def ticker(pair \\ nil, params \\ [], opts \\ [])

  def ticker(nil, params, opts) do
    opts = Keyword.merge(opts, params: params)
    :ticker |> url() |> CryptoApis.get(opts)
  end

  def ticker(pair, params, opts) do
    pair = process_pair(pair)
    opts = Keyword.merge(opts, params: params ++ [symbol: pair])
    :ticker |> url() |> CryptoApis.get(opts)
  end
end
