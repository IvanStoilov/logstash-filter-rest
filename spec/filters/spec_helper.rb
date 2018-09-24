# encoding: utf-8
require "webmock/rspec"
require "json"

mocks = [
  {
    "url" => "http://jsonplaceholder.typicode.com/users/10",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 200,
      "data" => {
        "id" => 10,
        "name" => "Clementina DuBuque",
        "username" => "Moriah.Stanton",
        "email" => "Rey.Padberg@karina.biz",
        "address" => {
          "street" => "Kattie Turnpike",
          "suite" => "Suite 198",
          "city" => "Lebsackbury",
          "zipcode" => "31428-2261",
          "geo" => {
          "lat" => "-38.2386",
          "lng" => "57.2232"
          }
        },
        "phone" => "024-648-3804",
        "website" => "ambrose.net",
        "company" => {
          "name" => "Hoeger LLC",
          "catchPhrase" => "Centralized empowering task-force",
          "bs" => "target end-to-end models"
          }
        }
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts?userId=10",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 200,
      "data" => [
        {
          "userId" => 10,
          "id" => 91,
          "title" => "aut amet sed",
          "body" => "libero voluptate eveniet aperiam sed\nsunt placeat suscipit molestias\nsimilique fugit nam natus\nexpedita consequatur consequatur dolores quia eos et placeat"
        }
      ]
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts?userId=0",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 200,
      "data" => [
      ]
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts?id=1&userId=1",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 200,
      "data" => [
        {
          "userId" => 1,
          "id" => 1,
          "title" => "aut amet sed",
          "body" => "libero voluptate eveniet aperiam sed\nsunt placeat suscipit molestias\nsimilique fugit nam natus\nexpedita consequatur consequatur dolores quia eos et placeat"
        }
      ]
    }
  },
  {
    "url" => "http://jsonplaceholder.typicode.com/users/9",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 200,
      "data" => {
        "id" => 9,
        "name" => "Glenna Reichert",
        "username" => "Delphine",
        "email" => "Chaim_McDermott@dana.io",
        "address" => {
          "street" => "Dayna Park",
          "suite" => "Suite 449",
          "city" => "Bartholomebury",
          "zipcode" => "76495-3109",
          "geo" => {
          "lat" => "24.6463",
          "lng" => "-168.8889"
          }
        },
        "phone" => "(775)976-6794 x41206",
        "website" => "conrad.com",
        "company" => {
          "name" => "Yost and Sons",
          "catchPhrase" => "Switchable contextually-based project",
          "bs" => "aggregate real-time technologies"
        }
      }
    }
  },
  {
    "url" => "http://httpstat.us/404",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 404
    }
  },
  {
    "url" => "http://jsonplaceholder.typicode.com/users/0",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 404
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts",
    "method" => :post,
    "with" => {
      "body" => "{\"title\":\"42\",\"body\":\"bar\",\"userId\":\"42\"}",
    },
    "response" => {
      "code" => 200,
      "data" => {
        "userId" => 42,
        "id" => 91,
        "title" => 42,
        "body" => "bar"
      }
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts",
    "method" => :post,
    "with" => {
      "body" => "{\"title\":\":5e?#!-_\",\"body\":\"bar\",\"userId\":\":5e?#!-_\"}",
    },
    "response" => {
      "code" => 200,
      "data" => {
        "userId" => ":5e?#!-_",
        "id" => 91,
        "title" => ":5e?#!-_",
        "body" => "bar"
      }
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts",
    "method" => :post,
    "with" => {
      "body" => "{\"title\":\":4c43=>\",\"body\":\"bar\",\"userId\":\":4c43=>\"}",
    },
    "response" => {
      "code" => 200,
      "data" => {
        "userId" => ":4c43=>",
        "id" => 91,
        "title" => ":4c43=>",
        "body" => "bar"
      }
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts",
    "method" => :post,
    "with" => {
      "body" => "{\"title\":\"foo\",\"body\":\"bar\",\"userId\":42}",
    },
    "response" => {
      "code" => 200,
      "data" => {
        "userId" => 42,
        "id" => 91,
        "title" => "foo",
        "body" => "bar"
      }
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts",
    "method" => :post,
    "with" => {
      "body" => "{\"title\":\"foo\",\"body\":\"bar\",\"userId\":\"42\"}",
    },
    "response" => {
      "code" => 200,
      "data" => {
        "userId" => 42,
        "id" => 91,
        "title" => "foo",
        "body" => "bar"
      }
    }
  },
  {
    "url" => "https://jsonplaceholder.typicode.com/posts",
    "method" => :post,
    "with" => {
      "body" => "{\"key1\":[{\"filterType\":\"text\",\"text\":\"salmon\",\"boolean\":\"false\"},{\"filterType\":\"unique\"}],\"key2\":[{\"message\":\"12342\",\"boolean\":\"true\"}],\"key3\":[{\"text\":\"42123\",\"filterType\":\"text\",\"number\":44},{\"filterType\":\"unique\",\"null\":\"nil\"}],\"userId\":\"42\"}",
    },
    "response" => {
      "code" => 200,
      "data" => {
        "key1" => [
          {
            "filterType" => "text",
            "text" => "salmon",
            "boolean" => "false"
          },
          {
            "filterType" => "unique"
          }
        ],
        "key2" => [
          {
            "message" => "12342",
            "boolean" => "true"
          }
        ],
        "key3" => [
          {
            "text" => "42123",
            "filterType" => "text",
            "number" => 44
          },
          {
            "filterType" => "unique",
            "null" => "nil"
          }
        ],
        "userId" => 42
      }
    }
  },
  {
    "url" => "invalid_url",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "exception" => true
    }
  },
  {
    "url" => "http://jsonplaceholder.typicode.com/users/11",
    "method" => :get,
    "with" => { "headers" => { "Connection" => "Keep-Alive" } },
    "response" => {
      "code" => 200,
      "delay" => 2,
      "data" => {
        "userId": 11
      }
    }
  },
]

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do

    mocks.each do |mock|
      if (mock["response"]["code"] === 404)
        stub_request(mock["method"], mock["url"]).
          with(mock["with"]).
          to_return(status: 404, body: '', headers: {});
      elsif (mock["response"]["exception"])
        stub_request(mock["method"], mock["url"]).
        with(mock["with"]).
          to_raise("Error");
      elsif (mock["response"]["delay"])
        stub_request(mock["method"], mock["url"]).
        with(mock["with"]).
          to_return(status: mock["response"]["code"], body: lambda { |request| sleep(mock["response"]["delay"]); JSON.generate(mock["response"]["data"]) }, headers: {});
        
      else
        stub_request(mock["method"], mock["url"]).
        with(mock["with"]).
          to_return(status: mock["response"]["code"], body: JSON.generate(mock["response"]["data"]), headers: {});
      end
    end
  end
end
