import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { FaStar, FaStarHalfAlt, FaRegStar } from 'react-icons/fa';
import CommentCard from './../comment_card/commentCard';
import './reviewList.css'

const ReviewList = ({ routeId }) => {
  const [reviews, setReviews] = useState([]);
  const [users, setUsers] = useState([])

  const fetchReviews = async () => {
    const response = await fetch(`http://localhost:8100/api/review/route/${routeId}/reviews`);
    const data = await response.json();
    console.log(data);
  
    const reviews = await Promise.all(
      data.reviews.map(async (review) => {
        const brief = await fetch(`http://localhost:8100/api/user/${review.user_id}/brief`)
          .then(rr => rr.json());
        return {      
          review_id: review.review_id,
          user_id: review.user_id,
          rating: review.rating,
          comment: review.comment,
          created_at: review.created_at,
          images: (review.images || []).map(i => `http://localhost:8100/api/media/image/${i}`),
          username: brief.username,
          name: brief.name,
          surname: brief.surname,
          avatar_url: brief.avatar_url,

        };
      })
    );
    setReviews(reviews);
  };
  useEffect(() => {
    fetchReviews();
  }, [routeId]);

  if (reviews.length === 0) return <p>Пока нет отзывов</p>;

  const StarRating = ({ rating }) => {
    const stars = [];

    for (let i = 1; i <= 5; i++) {
      if (rating >= i) {
        stars.push(<FaStar key={i} color="#f5a623" />);
      } else if (rating >= i - 0.5) {
        stars.push(<FaStarHalfAlt key={i} color="#f5a623" />);
      } else {
        stars.push(<FaRegStar key={i} color="#ccc" />);
      }
    }

    return <div className="star-rating">{stars}</div>;
  };

  return (
    <div className="review-list">
      <h3>Отзывы</h3>
      {reviews.map((review) => (
        <div key={review.review_id} className="review-card">
          <div className="review-header">
            <Link to={`/user/${review.username}`} className="author-info">
              <div className="review-author-avatar">
                <img src={`http://localhost:8100/api/media/image/${review.avatar_url}`} alt="avatar" className="author-image" />
              </div>
              <div className="username">{review.name} {review.surname}</div>
              <StarRating rating={review.rating} />
              <div className="rating-number">{review.rating}</div>
            </Link>          
          </div>
 
          <div className="review-body">
            <p>{review.comment}</p>
          </div>
          <h4>Комментарии:</h4>
          <CommentCard reviewId={review.review_id} />
          {review.images?.map((img, idx) => (
            <img
              key={idx}
              src={`http://localhost:8100/api/media/image/${img}`}
              alt={`img-${idx}`}
              style={{ width: '100px', borderRadius: '6px', marginRight: '8px' }}
            />
          ))}

        </div>
      ))}
    </div>
  );
};

export default ReviewList;
