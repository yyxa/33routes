import React, { useEffect, useState } from 'react';

const CommentBlock = ({ reviewId }) => {
  const [comments, setComments] = useState([]);

  useEffect(() => {
    const fetchComments = async () => {
      try {
        const res = await fetch(`http://localhost:8100/api/comment/review/${reviewId}/comments`);
        const data = await res.json();
        setComments(data.comments || []);
      } catch (err) {
        console.error('Ошибка загрузки комментариев:', err);
      }
    };
    fetchComments();
  }, [reviewId]);

  return (
    <div className="comment-block" style={{ marginTop: '10px', paddingLeft: '20px' }}>
      <h4>Комментарии</h4>
      {comments.length === 0 && <p>Комментариев нет</p>}
      {comments.map(comment => (
        <div key={comment.comment_id} style={{ marginBottom: '8px' }}>
          <p style={{ margin: 0 }}>{comment.text}</p>
          {comment.images?.map((img, idx) => (
            <img
              key={idx}
              src={`http://localhost:8100/api/media/image/${img}`}
              alt={`comment-${idx}`}
              style={{ width: '60px', borderRadius: '4px', marginRight: '5px' }}
            />
          ))}
        </div>
      ))}
    </div>
  );
};

export default CommentBlock;
