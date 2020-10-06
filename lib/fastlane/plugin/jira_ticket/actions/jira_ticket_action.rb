require 'fastlane/action'
require_relative '../helper/jira_ticket_helper'

module Fastlane
  module Actions
    class JiraTicketAction < Action
      def self.run(params)
        Actions.verify_gem!('jira-ruby')
        require 'jira-ruby'

        client = JIRA::Client.new(
          username:     params[:username],
          password:     params[:password],
          site:         params[:url],
          context_path: '',
          auth_type:    :basic
        )
            
        issue = client.Issue.find(params[:ticket_id])
            
        return issue
      end

      def self.description
        "get ticket in jira board"
      end

      def self.authors
        ["Dorian Cheignon"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "you can accest to your ticket over this plugin"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :url,
                             env_name: "FL_JIRA_SITE",
                             description: "URL for Jira instance",
                             verify_block: proc do |value|
                             UI.user_error!("No url for Jira given, pass using `url: 'url'`") if value.to_s.length == 0
                             end),
          FastlaneCore::ConfigItem.new(key: :username,
                             env_name: "FL_JIRA_USERNAME",
                             description: "Username for JIRA instance",
                             verify_block: proc do |value|
                             UI.user_error!("No username") if value.to_s.length == 0
                             end),
          FastlaneCore::ConfigItem.new(key: :password,
                             env_name: "FL_JIRA_PASSWORD",
                             description: "Password for Jira",
                             sensitive: true,
                             verify_block: proc do |value|
                             UI.user_error!("No password") if value.to_s.length == 0
                             end),
          FastlaneCore::ConfigItem.new(key: :ticket_id,
                             env_name: "FL_JIRA_TICKET_ID",
                             description: "Ticket ID for Jira, i.e. IOS-123",
                             verify_block: proc do |value|
                             UI.user_error!("No Ticket specified") if value.to_s.length == 0
                             end),
        ]
      end

       def self.example_code
        [
          "jira_ticket(username: *******, password: **********, url: 'https://your-jira-url.com', ticket_id: 'XXXX')"
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
