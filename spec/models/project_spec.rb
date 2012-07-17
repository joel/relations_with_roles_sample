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
    let(:group_name) { 'name of group' }
    let(:roles) { 'create, remove, treat, close' }
    before { subject.add_group(group_name, roles) }
    it { subject.group(group_name).should be_present }
    
    context 'create user' do
      let(:user_name) { 'name of user' }
      before { FactoryGirl.create(:user, name: user_name) }
      
      describe 'add user' do
        before { subject.add_user(user_name, group_name) }
        it { subject.user(user_name).should be_present }
      end
    end
  end
end
