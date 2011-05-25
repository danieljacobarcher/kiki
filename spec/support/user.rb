# encoding: utf-8

class User < Struct.new(:id, :username)
  include Kiki

  cache_key :redis

  cache_key :cassandra,
            :delimiter => '/',
            :identifier => :username

  [:mongo, :couch].each do |namespace|
    cache_key namespace,
              :delimiter => '::',
              :domain => "admins"
  end
end