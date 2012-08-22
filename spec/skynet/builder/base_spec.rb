require 'spec_helper'
require 'active_model'
require 'shoulda-matchers'

describe Skynet::Builder::Base do

  let(:base)    { File.join Dir.pwd, 'app' }
  let(:source)  { File.join base, 'master' }
  let(:repo)    { 'git@github.com:app.git' }
  let(:options) { {url: repo, branch: 'master', destination: '/var/www', type: 'static'} }
  subject       { described_class.new 'app', options }

  describe ".validations" do
    it { should validate_presence_of :app }
    it { should validate_presence_of :url }
    it { should validate_presence_of :branch }
    it { should validate_presence_of :destination }
    it { should ensure_inclusion_of(:type).in_array(%w[static jekyll]).allow_nil(false).allow_blank(false) }
    it { should_not allow_value('base').for :type }
  end

  describe "#build" do
    context "when valid" do
      it { expect { subject.build }.to_not raise_error }
    end
    context "when invalid" do
      let(:options) { {} }
      it { expect { subject.build }.to raise_error ArgumentError }
    end
  end

  describe "#build_repository" do
    context "repo already exists" do
      before(:each) { subject.stub(:repo_exists?).and_return true }

      it "updates the repository" do
        subject.should_receive(:update_repo).with no_args
        subject.send :build_repository
      end
    end

    context "repo does not exist" do
      before(:each) { subject.stub(:repo_exists?).and_return false }

      it "creates a new repository" do
        subject.should_receive(:create_repo).with no_args
        subject.send :build_repository
      end
    end
  end

  describe "#create_repo" do
    before(:each) do
      subject.should_receive(:`).with "rm -rf #{source}; mkdir -p #{base}"
      subject.should_receive(:`).with "cd #{base}; git clone #{repo} master"
    end

    it { subject.send :create_repo }
  end

  describe "#update_repo" do
    before(:each) { subject.should_receive(:`).with "cd #{source}; git pull" }

    it { subject.send :update_repo }
  end

  describe "#repo_exists?" do
    before(:each) do
      File.should_receive(:exist?).with File.join(source, '.git')
    end

    it { subject.send :repo_exists? }
  end
end
