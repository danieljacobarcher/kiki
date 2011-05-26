# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Kiki" do

  before :each do
    @user = User.new(3, "ramona")
  end
  
  it "should add *_key class methods" do
    User.should respond_to(:redis_key)
    User.should respond_to(:memcached_key)
  end
  
  it "should add *_key instance methods" do
    @user.should respond_to(:redis_key)
    @user.should respond_to(:memcached_key)
  end
  
  it "should respond to configuration" do
    User.redis_key.identifier = :username
    @user.redis_key("likes").should eql("redis:users:ramona:likes")
    
    User.redis_key.identifier = :id
    @user.redis_key("likes").should eql("redis:users:3:likes")
  end
  
  describe "Redis key" do
    it "should be correct for instance" do
      @user.redis_key.should eql("redis:users:3")
    end
    
    it "should be correct with arguments" do
      User.redis_key("stats").should eql("redis:users:stats")
      @user.redis_key("likes").should eql("redis:users:3:likes")
      @user.redis_key("likes", "recent").should eql("redis:users:3:likes:recent")
    end
  end
  
  describe "Memcached key" do
    it "should be correct for instance" do
      @user.memcached_key.should eql("memcached/people/ramona")
    end
    
    it "should be correct with arguments" do
      User.memcached_key("comments").should eql("memcached/people/comments")
      @user.memcached_key("comments").should eql("memcached/people/ramona/comments")
      @user.memcached_key("comments", 42).should eql("memcached/people/ramona/comments/42")
    end
  end
end
