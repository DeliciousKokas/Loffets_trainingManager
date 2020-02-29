RSpec.shared_context "project setup" do
  
  let(:user) { FactoryBot.create(:user) }
  let(:record) { FactoryBot.create(:record, user_id:user.id) }
  let(:mywork) { FactoryBot.create(:mywork, user_id:user.id) }
  let(:workout) { FactoryBot.create(:workout, record_id:record.id, mywork_id:mywork.id) }
end
