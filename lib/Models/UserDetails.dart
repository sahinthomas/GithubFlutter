
import 'dart:convert';

UserDetail userDetailFromJson(String str) => UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({
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
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
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
  String name;
  String company;
  String blog;
  String location;
  String email;
  String hireable;
  String bio;
  String twitterUsername;
  String publicRepos;
  String publicGists;
  String followers;
  String following;
  String createdAt;
  String updatedAt;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    login: json["login"] == null ? "" : json["login"],
    id: json["id"] == null ? "" : json["id"].toString(),
    nodeId: json["node_id"] == null ? "" : json["node_id"],
    avatarUrl: json["avatar_url"] == null ? "" : json["avatar_url"],
    gravatarId: json["gravatar_id"] == null ? "" : json["gravatar_id"],
    url: json["url"] == null ? "" : json["url"],
    htmlUrl: json["html_url"] == null ? "" : json["html_url"],
    followersUrl: json["followers_url"] == null ? "" : json["followers_url"],
    followingUrl: json["following_url"] == null ? "" : json["following_url"],
    gistsUrl: json["gists_url"] == null ? "" : json["gists_url"],
    starredUrl: json["starred_url"] == null ? "" : json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"] == null ? "" : json["subscriptions_url"],
    organizationsUrl: json["organizations_url"] == null ? "" : json["organizations_url"],
    reposUrl: json["repos_url"] == null ? "" : json["repos_url"],
    eventsUrl: json["events_url"] == null ? "" : json["events_url"],
    receivedEventsUrl: json["received_events_url"] == null ? "" : json["received_events_url"],
    type: json["type"] == null ? "" : json["type"],
    siteAdmin: json["site_admin"] == null ? "" : json["site_admin"].toString(),
    name: json["name"] == null ? "" : json["name"],
    company: json["company"] == null ? "" : json["company"],
    blog: json["blog"] == null ? "" : json["blog"],
    location: json["location"] == null ? "" : json["location"],
    email: json["email"]== null ? "" : json["email"],
    hireable: json["hireable"]== null ? "" : json["hireable"].toString(),
    bio: json["bio"]== null ? "" : json["bio"],
    twitterUsername: json["twitter_username"]== null ? "" : json["twitter_username"],
    publicRepos: json["public_repos"] == null ? "" : json["public_repos"].toString(),
    publicGists: json["public_gists"] == null ? "" : json["public_gists"].toString(),
    followers: json["followers"] == null ? "" : json["followers"].toString(),
    following: json["following"] == null ? "" : json["following"].toString(),
    createdAt: json["created_at"] == null ? "" : json["created_at"].toString() ,
    updatedAt: json["updated_at"] == null ? "" : json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "login": login == null ? "" : login,
    "id": id == null ? "" : id,
    "node_id": nodeId == null ? "" : nodeId,
    "avatar_url": avatarUrl == null ? "" : avatarUrl,
    "gravatar_id": gravatarId == null ? "" : gravatarId,
    "url": url == null ? "" : url,
    "html_url": htmlUrl == null ? "" : htmlUrl,
    "followers_url": followersUrl == null ? "" : followersUrl,
    "following_url": followingUrl == null ? "" : followingUrl,
    "gists_url": gistsUrl == null ? "" : gistsUrl,
    "starred_url": starredUrl == null ? "" : starredUrl,
    "subscriptions_url": subscriptionsUrl == null ? "" : subscriptionsUrl,
    "organizations_url": organizationsUrl == null ? "" : organizationsUrl,
    "repos_url": reposUrl == null ? "" : reposUrl,
    "events_url": eventsUrl == null ? "" : eventsUrl,
    "received_events_url": receivedEventsUrl == null ? "" : receivedEventsUrl,
    "type": type == null ? "" : type,
    "site_admin": siteAdmin == null ? "" : siteAdmin,
    "name": name == null ? "" : name,
    "company": company == null ? "" : company,
    "blog": blog == null ? "" : blog,
    "location": location == null ? "" : location,
    "email": email,
    "hireable": hireable,
    "bio": bio,
    "twitter_username": twitterUsername,
    "public_repos": publicRepos == null ? "" : publicRepos,
    "public_gists": publicGists == null ? "" : publicGists,
    "followers": followers == null ? "" : followers,
    "following": following == null ? "" : following,
    "created_at": createdAt == null ? "" : createdAt,
    "updated_at": updatedAt == null ? "" : updatedAt,
  };
}
