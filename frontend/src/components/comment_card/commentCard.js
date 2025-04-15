import React, { useEffect, useState } from 'react';
import './commentCard.css';

const CommentCard = ({ reviewId }) => {
  const [comments, setComments] = useState([]);

  useEffect(() => {
    const fetchComments = async () => {
      const res = await fetch(`http://localhost:8100/api/comment/review/${reviewId}/comments`);
      const data = await res.json();

      const comments = await Promise.all(
        (Array.isArray(data.comments) ? data.comments : []).map(async (comment) => {
          const brief = await fetch(`http://localhost:8100/api/user/${comment.user_id}/brief`)
            .then(rr => rr.json());
          return {
            comment_id: comment.comment_id,
            user_id: comment.user_id,
            text: comment.text,
            created_at: comment.created_at,
            images: (comment.images || []).map(i => `http://localhost:8100/api/media/image/${i}`),
            reply_to: comment.reply_to,
            username: brief.username,
            name: brief.name,
            surname: brief.surname,
            avatar_url: brief.avatar_url,
          };
        })
      );

      setComments(comments);
    };
    fetchComments();
  }, [reviewId]);

  return (
    <div className="comment-block">
      {comments.length === 0 && <p>Комментарии отсутствуют</p>}

      {comments.map(comment => (
        <div className="comment-card">
          <div key={comment.comment_id} className="comment-card-header">
            <div className="comment-author-avatar-placeholder">
              <img src={`http://localhost:8100/api/media/image/${comment.avatar_url}`} alt="avatar" className="comment-author-avatar-img"></img>
            </div>
          <div className="comment-card-body">
            <p>{comment.name} {comment.surname}</p>
            <div className="comment-text">
              {comment.text}
            </div>
            {comment.images?.map((img, idx) => (
              <img
                key={idx}
                src={`http://localhost:8100/api/media/image/${img}`}
                alt={`comment-${idx}`}
              />
            ))}
          </div>
          </div>
        </div>
      ))}
    </div>
  );
};

export default CommentCard;
