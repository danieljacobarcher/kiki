# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Kiki" do

  before :each do
    @user = User.new(3, "ramona")
  end
  
  it "should add *_key class methods" do
    User.should respond_to(:redis_key)
    User.should respond_to(:cassandra_key)
    User.should respond_to(:mongo_key)
    User.should respond_to(:couch_key)
  end
  
  it "should add *_key instance methods" do
    @user.should respond_to(:redis_key)
    @user.should respond_to(:cassandra_key)
    @user.should respond_to(:mongo_key)
    @user.should respond_to(:couch_key)
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
  
  describe "Cassandra key" do
    it "should be correct for instance" do
      @user.cassandra_key.should eql("cassandra/users/ramona")
    end
    
    it "should be correct with arguments" do
      User.cassandra_key("comments").should eql("cassandra/users/comments")
      @user.cassandra_key("comments").should eql("cassandra/users/ramona/comments")
      @user.cassandra_key("comments", 42).should eql("cassandra/users/ramona/comments/42")
    end
  end
  
  describe "MongoDB key" do
    it "should be correct for instance" do
      @user.mongo_key.should eql("mongo::admins::3")
    end
    
    it "should be correct with arguments" do
      User.mongo_key("nodes").should eql("mongo::admins::nodes")
      @user.mongo_key("nodes").should eql("mongo::admins::3::nodes")
      @user.mongo_key("nodes", "xyz", 567).should eql("mongo::admins::3::nodes::xyz::567")
    end
  end
end
