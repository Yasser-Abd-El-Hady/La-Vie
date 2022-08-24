class ForumComments {
  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  String? createdAt;

  ForumComments(
      {this.forumCommentId,
      this.forumId,
      this.userId,
      this.comment,
      this.createdAt});

  ForumComments.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forumCommentId'] = this.forumCommentId;
    data['forumId'] = this.forumId;
    data['userId'] = this.userId;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
