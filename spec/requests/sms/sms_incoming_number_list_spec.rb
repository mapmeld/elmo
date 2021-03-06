require "spec_helper"

describe "incoming_numbers" do
  context "with incoming numbers" do
    let(:user) { create(:user, role_name: :coordinator) }

    before do
      get_mission.setting.update_attribute(:incoming_sms_numbers, %w(+12345678900 +17387187382 +7177637716))
      login(user)
    end

    it "should return an appropriate csv" do
      get("/en/m/#{get_mission.compact_name}/sms/incoming-numbers.csv")
      expect(response.body).to eq(
        %Q{id,phone_number\r\n1,+12345678900\r\n2,+17387187382\r\n3,+7177637716\r\n})
    end
  end
end
