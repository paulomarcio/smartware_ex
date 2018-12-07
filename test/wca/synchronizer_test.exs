defmodule HTTPoison.Response do
  defstruct body: nil, headers: nil, status_code: nil
end

defmodule SmartwareEx.Wca.Synchronizertest do
  use ExUnit.Case
  doctest SmartwareEx

  test "should_parse_httpoison_response_into_list" do
    response = %HTTPoison.Response{
      body: "<?xml version=\"1.0\" encoding=\"utf-8\"?><ArrayOfString xmlns=\"http://tempuri.org/\"><string>string</string><string>string</string></ArrayOfString>",
      headers: [{"Connection", "keep-alive"}, {"Server", "Cowboy"},
        {"Date", "Sat, 06 Jun 2015 03:52:13 GMT"}, {"Content-Length", "495"},
        {"Content-Type", "application/xml"}, {"Via", "1.1 vegur"}],
      status_code: 200
    }
    mailings = Exml.parse(response.body) |> Exml.get("//string")
    assert is_list(mailings)
  end

  test "should_parse_httpoison_response_into_empty_list" do
    response = %HTTPoison.Response{
      body: "<?xml version=\"1.0\" encoding=\"utf-8\"?><ArrayOfString xmlns=\"http://tempuri.org/\"></ArrayOfString>",
      headers: [{"Connection", "keep-alive"}, {"Server", "Cowboy"},
        {"Date", "Sat, 06 Jun 2015 03:52:13 GMT"}, {"Content-Length", "495"},
        {"Content-Type", "application/xml"}, {"Via", "1.1 vegur"}],
      status_code: 200
    }
    mailings = Exml.parse(response.body) |> Exml.get("//string")
    assert is_nil(mailings)
  end

  test "should_split_mailing_string_into_list" do
    mailing_string = "MOBI2BUY|1000001401|2-0556480001||20000"
    mailing_list = String.split(mailing_string, "|")
    assert is_list(mailing_list)
  end
end