import 'dart:convert';

UserSearch userSearchFromJson(String str) => UserSearch.fromJson(json.decode(str));

String userSearchToJson(UserSearch data) => json.encode(data.toJson());

class UserSearch {
  UserSearch({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  String totalCount;
  String incompleteResults;
  List<Item> items;

  factory UserSearch.fromJson(Map<String, dynamic> json) => UserSearch(
    totalCount: json["total_count"] == null ? "" : json["total_count"].toString(),
    incompleteResults: json["incomplete_results"] == null ? "" : json["incomplete_results"].toString(),
    items: json["items"] == null ? [] : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount == null ? null : totalCount,
    "incomplete_results": incompleteResults == null ? null : incompleteResults,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
    required this.score,
  });

  String login;
  String id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  String siteAdmin;
  String score;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    login: json["login"] == null ? null : json["login"],
    id: json["id"] == null ? "" : json["id"].toString() ,
    nodeId: json["node_id"] == null ? null : json["node_id"],
    avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
    gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
    url: json["url"] == null ? null : json["url"],
    htmlUrl: json["html_url"] == null ? null : json["html_url"],
    followersUrl: json["followers_url"] == null ? null : json["followers_url"],
    followingUrl: json["following_url"] == null ? null : json["following_url"],
    gistsUrl: json["gists_url"] == null ? null : json["gists_url"],
    starredUrl: json["starred_url"] == null ? null : json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"] == null ? null : json["subscriptions_url"],
    organizationsUrl: json["organizations_url"] == null ? null : json["organizations_url"],
    reposUrl: json["repos_url"] == null ? null : json["repos_url"],
    eventsUrl: json["events_url"] == null ? null : json["events_url"],
    receivedEventsUrl: json["received_events_url"] == null ? null : json["received_events_url"],
    type: json["type"] == null ? null : json["type"],
    siteAdmin: json["site_admin"] == null ? "" : json["site_admin"].toString(),
    score: json["score"] == null ?  "" : json["score"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "login": login == null ? null : login,
    "id": id == null ? null : id,
    "node_id": nodeId == null ? null : nodeId,
    "avatar_url": avatarUrl == null ? null : avatarUrl,
    "gravatar_id": gravatarId == null ? null : gravatarId,
    "url": url == null ? null : url,
    "html_url": htmlUrl == null ? null : htmlUrl,
    "followers_url": followersUrl == null ? null : followersUrl,
    "following_url": followingUrl == null ? null : followingUrl,
    "gists_url": gistsUrl == null ? null : gistsUrl,
    "starred_url": starredUrl == null ? null : starredUrl,
    "subscriptions_url": subscriptionsUrl == null ? null : subscriptionsUrl,
    "organizations_url": organizationsUrl == null ? null : organizationsUrl,
    "repos_url": reposUrl == null ? null : reposUrl,
    "events_url": eventsUrl == null ? null : eventsUrl,
    "received_events_url": receivedEventsUrl == null ? null : receivedEventsUrl,
    "type": type == null ? null : type,
    "site_admin": siteAdmin == null ? null : siteAdmin,
    "score": score == null ? null : score,
  };


  static double checkDouble(String value) {

    return double.tryParse(value)??0;

  }
}



