require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class JiraTicketHelper
      # class methods that you define here become available in your action
      # as `Helper::JiraTicketHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the jira_ticket plugin helper!")
      end
    end
  end
end
