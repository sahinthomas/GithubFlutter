
import 'dart:convert';

List<UserRepos> userReposFromJson(String str) => List<UserRepos>.from(json.decode(str).map((x) => UserRepos.fromJson(x)));

String userReposToJson(List<UserRepos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserRepos {
  UserRepos({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.html_url,
   // required this.updated_at,

  });

  String id;
  String nodeId;
  String name;
  String fullName;
  String private;
  String htmlUrl;
  String description;
  String fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String html_url;
//  String updated_at;


  factory UserRepos.fromJson(Map<String, dynamic> json) => UserRepos(
    id: json["id"] == null ? "" : json["id"].toString(),
    nodeId: json["node_id"] == null ? "" : json["node_id"],
    name: json["name"] == null ? "" : json["name"],
    fullName: json["full_name"] == null ? "" : json["full_name"],
    private: json["private"] == null ? "" : json["private"].toString(),

    htmlUrl: json["html_url"] == null ? "" : json["html_url"],
    description: json["description"] == null ? "" : json["description"],
    fork: json["fork"] == null ? "" : json["fork"].toString(),
    url: json["url"] == null ? "" : json["url"],
    forksUrl: json["forks_url"] == null ? "" : json["forks_url"],
    keysUrl: json["keys_url"] == null ? "" : json["keys_url"],
    collaboratorsUrl: json["collaborators_url"] == null ? "" : json["collaborators_url"],
    teamsUrl: json["teams_url"] == null ? "" : json["teams_url"],
    hooksUrl: json["hooks_url"] == null ? "" : json["hooks_url"],
    issueEventsUrl: json["issue_events_url"] == null ? "" : json["issue_events_url"],
    eventsUrl: json["events_url"] == null ? "" : json["events_url"],
    assigneesUrl: json["assignees_url"] == null ? "" : json["assignees_url"],
    branchesUrl: json["branches_url"] == null ? "" : json["branches_url"],
    tagsUrl: json["tags_url"] == null ? "" : json["tags_url"],
    blobsUrl: json["blobs_url"] == null ? "" : json["blobs_url"],
    gitTagsUrl: json["git_tags_url"] == null ? "" : json["git_tags_url"],
    gitRefsUrl: json["git_refs_url"] == null ? "" : json["git_refs_url"],
    treesUrl: json["trees_url"] == null ? "" : json["trees_url"],
    statusesUrl: json["statuses_url"] == null ? "" : json["statuses_url"],
    html_url: json["html_url"] == null ? "" : json["html_url"],
   // updated_at: json["updated_at"] == null ? "" : json["updated_at"].toString(),

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? "" : id,
    "node_id": nodeId == null ? "" : nodeId,
    "name": name == null ? "" : name,
    "full_name": fullName == null ? "" : fullName,
    "private": private == null ? "" : private,

    "html_url": htmlUrl == null ? "" : htmlUrl,
    "description": description == null ? "" : description,
    "fork": fork == null ? "" : fork,
    "url": url == null ? "" : url,
    "forks_url": forksUrl == null ? "" : forksUrl,
    "keys_url": keysUrl == null ? "" : keysUrl,
    "collaborators_url": collaboratorsUrl == null ? "" : collaboratorsUrl,
    "teams_url": teamsUrl == null ? "" : teamsUrl,
    "hooks_url": hooksUrl == null ? "" : hooksUrl,
    "issue_events_url": issueEventsUrl == null ? "" : issueEventsUrl,
    "events_url": eventsUrl == null ? "" : eventsUrl,
    "assignees_url": assigneesUrl == null ? "" : assigneesUrl,
    "branches_url": branchesUrl == null ? "" : branchesUrl,
    "tags_url": tagsUrl == null ? "" : tagsUrl,
    "blobs_url": blobsUrl == null ? "" : blobsUrl,
    "git_tags_url": gitTagsUrl == null ? "" : gitTagsUrl,
    "git_refs_url": gitRefsUrl == null ? "" : gitRefsUrl,
    "trees_url": treesUrl == null ? "" : treesUrl,
    "statuses_url": statusesUrl == null ? "" : statusesUrl,
    "html_url": html_url == null ? "" : html_url,
   // "updated_at": updated_at == null ? "" : updated_at,

  };
}


