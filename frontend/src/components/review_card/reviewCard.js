import { useState } from 'react';

const ReviewCard = ({ 
  username, 
  avatar, 
  rating, 
  comment, 
  collapsed, 
  repliesCount 
}) => {
  const [expanded, setExpanded] = useState(!collapsed);

  const renderStars = (rating) => {
    return [...Array(5)].map((_, i) => (
      <span key={i} className={i < rating ? "text-yellow-500" : "text-gray-300"}>★</span>
    ));
  };

  return (
    <div className="bg-white dark:bg-[#2e2e2e] rounded-xl shadow-md p-4 mb-4 max-w-2xl mx-auto">
      <div className="flex items-start gap-3">
        <img 
          src={avatar} 
          alt="avatar" 
          className="w-10 h-10 rounded-full object-cover"
        />
        <div className="flex-1">
          <div className="flex items-center justify-between">
            <h4 className="font-semibold text-sm">{username}</h4>
            <div className="text-sm">{renderStars(rating)}</div>
          </div>

          <p className="text-sm mt-1 text-gray-800 dark:text-gray-100">
            {expanded ? comment : comment.slice(0, 140) + (comment.length > 140 ? "..." : "")}
          </p>

          <div className="flex justify-between mt-2 items-center text-xs text-gray-500 dark:text-gray-300">
            <button onClick={() => setExpanded(!expanded)} className="hover:underline">
              {expanded ? "Скрыть" : `${repliesCount} ответов`}
            </button>
            <button className="hover:underline text-blue-600 dark:text-blue-400">Ответить</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ReviewCard;
