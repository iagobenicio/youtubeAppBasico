class Comments{
  String commentId;
  String profileImageAuthorComment;
  String commentText;
  String commentAuthor;
  int commentLikeCount;

  Comments(this.commentId,this.commentText,
  this.commentAuthor,this.profileImageAuthorComment,this.commentLikeCount);

  factory Comments.fromJsoncomments(Map comments){
    return Comments(
      comments["id"],
      comments["snippet"]["textOriginal"], 
      comments["snippet"]["authorDisplayName"],
      comments["snippet"]["authorProfileImageUrl"],  
      comments["snippet"]["likeCount"]
    );
  }

}