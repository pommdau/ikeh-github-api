//
//  LoginUser+sampleData.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/01/23.
//

import Foundation

extension LoginUser {
    enum Mock {
        static let ikeh: LoginUser = .init(
            rawID: 29433103,
            login: "pommdau",
            avatarURL: "https://avatars.githubusercontent.com/u/29433103?v=4",
            url: "https://api.github.com/users/pommdau",
            htmlURL: "https://github.com/pommdau",
            name: "IKEH",
            location: "Osaka",
            email: nil,
            bio: nil,
            twitterUsername: "ikeh1024",
            publicRepos: 104,
            publicGists: 5,
            followers: 20,
            following: 7,
            createdAt: "2017-06-14T13:32:48Z",
            updatedAt: "2024-12-21T12:20:29Z"
        )
    }
}

/*
 {
   "login": "octocat",
   "id": 1,
   "node_id": "MDQ6VXNlcjE=",
   "avatar_url": "https://github.com/images/error/octocat_happy.gif",
   "gravatar_id": "",
   "url": "https://api.github.com/users/octocat",
   "html_url": "https://github.com/octocat",
   "followers_url": "https://api.github.com/users/octocat/followers",
   "following_url": "https://api.github.com/users/octocat/following{/other_user}",
   "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
   "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
   "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
   "organizations_url": "https://api.github.com/users/octocat/orgs",
   "repos_url": "https://api.github.com/users/octocat/repos",
   "events_url": "https://api.github.com/users/octocat/events{/privacy}",
   "received_events_url": "https://api.github.com/users/octocat/received_events",
   "type": "User",
   "site_admin": false,
   "name": "monalisa octocat",
   "company": "GitHub",
   "blog": "https://github.com/blog",
   "location": "San Francisco",
   "email": "octocat@github.com",
   "hireable": false,
   "bio": "There once was...",
   "twitter_username": "monatheoctocat",
   "public_repos": 2,
   "public_gists": 1,
   "followers": 20,
   "following": 0,
   "created_at": "2008-01-14T04:33:35Z",
   "updated_at": "2008-01-14T04:33:35Z",
   "private_gists": 81,
   "total_private_repos": 100,
   "owned_private_repos": 100,
   "disk_usage": 10000,
   "collaborators": 8,
   "two_factor_authentication": true,
   "plan": {
     "name": "Medium",
     "space": 400,
     "private_repos": 20,
     "collaborators": 0
   }
 }
 */
