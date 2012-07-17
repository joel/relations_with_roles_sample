require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }
  subject { project }
    
  describe 'validation relation' do
    let(:project) { FactoryGirl.create(:project, :with_users) }
    subject { project }
    its(:users) { should eql [project.users.first] }
  end
  
  describe 'add group' do
    let(:name) { 'name of group' }
    let(:roles) { 'create, remove, treat, close' }
    before { subject.add_group(name, roles) }
    it { subject.groups.where(name: name).should be_present }
  end
  
end
