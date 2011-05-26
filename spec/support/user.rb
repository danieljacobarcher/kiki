# encoding: utf-8

class User < Struct.new(:id, :username)
  include Kiki

  cache_key :redis

  cache_key :memcached,
            :delimiter  => '/',
            :domain     => 'people',
            :identifier => :username
end