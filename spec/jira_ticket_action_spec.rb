describe Fastlane::Actions::JiraTicketAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The jira_ticket plugin is working!")

      Fastlane::Actions::JiraTicketAction.run(nil)
    end
  end
end
