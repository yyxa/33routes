import React, { useEffect, useState } from 'react';
import CommentBlock from './../comment_card/commentBlock';

const ReviewList = ({ routeId }) => {
  const [reviews, setReviews] = useState([]);

  useEffect(() => {
    const fetchReviews = async () => {
      try {
        const response = await fetch(`http://localhost:8100/api/review/route/${routeId}/reviews`);
        const data = await response.json();
        setReviews(data.reviews || []);
      } catch (error) {
        console.error('Ошибка загрузки отзывов:', error);
      }
    };
    fetchReviews();
  }, [routeId]);

  if (reviews.length === 0) return <p>Пока нет отзывов</p>;

  return (
    <div className="review-list">
      <h3>Отзывы</h3>
      {reviews.map((review) => (
        <div key={review.review_id} className="review-item">
          <p><strong>Оценка:</strong> {review.rating}★</p>
          <p>{review.comment}</p>
          {review.images?.map((img, idx) => (
            <img
              key={idx}
              src={`http://localhost:8100/api/media/image/${img}`}
              alt={`img-${idx}`}
              style={{ width: '100px', borderRadius: '6px', marginRight: '8px' }}
            />
          ))}
          <CommentBlock reviewId={review.review_id} />
        </div>
      ))}
    </div>
  );
};

export default ReviewList;
