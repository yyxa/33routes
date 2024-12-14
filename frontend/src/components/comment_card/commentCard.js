import React, { useState } from 'react';
import './commentCard.css';

function CommentCard({ commentData }) {
  const [isReplying, setIsReplying] = useState(false);

  const handleReplyClick = () => {
    setIsReplying(!isReplying);
  };

  return (
    <div className="comment-card">
      <div className="comment-card-header">
        <img src={commentData.avatar} alt={commentData.name} />
        <div className="author-name">{commentData.name}</div>
        <div className="rating">
          {'★'.repeat(commentData.rating)} {/* Display star rating */}
        </div>
      </div>

      <div className="comment-card-body">
        <div className="text">{commentData.comment}</div>
      </div>

      <div className="comment-card-footer">
        <button className="reply-btn" onClick={handleReplyClick}>
          {isReplying ? 'Cancel' : 'Reply'}
        </button>
        <div className="reply-count">{commentData.replyCount} replies</div>
      </div>

      {isReplying && (
        <div className="reply-section">
          <textarea placeholder="Write your reply..." />
          <button className="submit-reply-btn">Submit</button>
        </div>
      )}
    </div>
  );
}

export default CommentCard;
