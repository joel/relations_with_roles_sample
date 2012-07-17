require 'spec_helper'

describe Project do
  
  describe 'validation relation' do
    let(:project) { FactoryGirl.create(:project, :with_users) }
    subject { project }
    its(:users) { should eql [project.users.first] }
  end
  
end
