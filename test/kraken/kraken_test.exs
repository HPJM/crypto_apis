defmodule CryptoApis.KrakenTest do
  use ExUnit.Case
  import Mock
  alias CryptoApis.Kraken
  import CryptoApis.Fixtures

  describe "url/1" do
    test "url for server time" do
      assert Kraken.url(:server_time) == "https://api.kraken.com/0/public/Time"
    end

    test "url for system status" do
      assert Kraken.url(:system_status) == "https://api.kraken.com/0/public/SystemStatus"
    end

    test "url for assets" do
      assert Kraken.url(:assets) == "https://api.kraken.com/0/public/Assets"
    end
  end

  describe "server time" do
    test "server_time/1 responds ok" do
      with_mock HTTPoison,
        get: fn url, _headers, _options ->
          {:ok, successful_response(url: url)}
        end do
        assert {:ok, response} = Kraken.server_time()
        assert response.status_code == 200
        assert response.request_url == "https://api.kraken.com/0/public/Time"
      end
    end

    test "server_time!/1 responds ok" do
      with_mock HTTPoison,
        get!: fn url, _headers, _options ->
          successful_response(url: url)
        end do
        assert %HTTPoison.Response{} = response = Kraken.server_time!()
        assert response.status_code == 200
        assert response.request_url == "https://api.kraken.com/0/public/Time"
      end
    end
  end

  describe "system status" do
    test "system_status/1 responds ok" do
      with_mock HTTPoison,
        get: fn url, _headers, _options ->
          {:ok, successful_response(url: url)}
        end do
        assert {:ok, response} = Kraken.system_status()
        assert response.status_code == 200
        assert response.request_url == "https://api.kraken.com/0/public/SystemStatus"
      end
    end

    test "system_status!/1 responds ok" do
      with_mock HTTPoison,
        get!: fn url, _headers, _options ->
          successful_response(url: url)
        end do
        assert %HTTPoison.Response{} = response = Kraken.system_status!()
        assert response.status_code == 200
        assert response.request_url == "https://api.kraken.com/0/public/SystemStatus"
      end
    end
  end

  describe "assets" do
    test "assets/1 responds ok" do
      with_mock HTTPoison,
        get: fn url, _headers, _options ->
          {:ok, successful_response(url: url)}
        end do
        assert {:ok, response} = Kraken.assets()
        assert response.status_code == 200
        assert response.request_url == "https://api.kraken.com/0/public/Assets"
      end
    end

    test "assets!/1 responds ok" do
      with_mock HTTPoison,
        get!: fn url, _headers, _options ->
          successful_response(url: url)
        end do
        assert %HTTPoison.Response{} = response = Kraken.assets!()
        assert response.status_code == 200
        assert response.request_url == "https://api.kraken.com/0/public/Assets"
      end
    end
  end
end