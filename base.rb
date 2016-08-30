#!/usr/bin/env ruby

require 'Octokit'
client = Octokit::Client.new(:access_token => "[github_token_here]")

user = client.user
puts "Script is logged in as #{user.login}"

#get all issues for repo
issues = client.list_issues("[github_organization/repository]")


def getIssueWithLabel(label, issues)
	result = Array.new

	for issue in issues
		puts "number: #{issue["number"]} title: #{issue["title"]} author: #{issue["user"]["login"]}"
		puts issue["base"]

		for lbl in issue["labels"]

			if lbl["name"].include? label
				
				# perform action on label
				
			result.push(issue["number"])
			end
		end
	end
	return result
end

while true
selectedIssues = getIssueWithLabel("ui-tests", issues)
puts selectedIssues

sleep 15
end

