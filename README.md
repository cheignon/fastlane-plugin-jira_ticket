# jira_ticket plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-jira_ticket)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-jira_ticket`, add it to your project by running:

```bash
fastlane add_plugin jira_ticket
```

## About jira_ticket

get ticket in jira board

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

the password is not your real password you need to generate a token api on your setting profile in JIRA

```
ticket = jira_ticket(username: YOUR_EMAIL, password: YOUR_JIRA_TOKEN, url: 'https://your-jira-url.com', ticket_id: 'XXXX')
```

## how to user
```
    ticket = jira_ticket(url: "https://YOUR_JIRA_ADDRESS",username: ENV["JIRA_USERNAME"],password: ENV["JIRA_TOKEN"],ticket_id: "TICKET_1001")
    
    image = ticket.assignee.avatarUrls['48x48'] // is avatar of user in charge of the ticket
    username = ticket.assignee.displayName // is name of user in charge of the ticket
    summary = ticket.summary // title of  the ticket
    text = ticket.description.truncate(200) // content of the ticket
    id = ticket.key // id of the ticket
    ....

```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
