// components/filter_popup/filterPopup.js
import React, { useRef, useEffect } from 'react';
import './filterPopup.css';
import { COLLECTION_TAGS } from '../../constants/collectionTags';

const clamp = (val, min, max) => Math.max(min, Math.min(max, val));

const ThumbRange = ({ min, max, values, onChange }) => {
    const ref = useRef();
    const getPercent = (val) => ((val - min) / (max - min)) * 100;
  
    const handleMove = (thumbIndex, clientX) => {
      const rect = ref.current.getBoundingClientRect();
      const percent = ((clientX - rect.left) / rect.width) * 100;
      const raw = min + ((max - min) * percent) / 100;
      // Если значение близко к минимальному/максимальному, закрепляем его точно
      let newValue;
      if (raw - min < 0.5) {
        newValue = min;
      } else if (max - raw < 0.5) {
        newValue = max;
      } else {
        newValue = Math.round(raw);
      }
      const clampedValue = clamp(newValue, min, max);
  
      if (thumbIndex === 0 && clampedValue >= values[1]) return;
      if (thumbIndex === 1 && clampedValue <= values[0]) return;
  
      const newValues = [...values];
      newValues[thumbIndex] = clampedValue;
      onChange(newValues);
    };
  
    const onMouseDown = (index) => (e) => {
      e.preventDefault();
      const move = (ev) => handleMove(index, ev.clientX);
      const up = () => {
        window.removeEventListener('mousemove', move);
        window.removeEventListener('mouseup', up);
      };
      window.addEventListener('mousemove', move);
      window.addEventListener('mouseup', up);
    };
  
    const onClickTrack = (e) => {
      const rect = ref.current.getBoundingClientRect();
      const clickX = e.clientX - rect.left;
      const percent = clickX / rect.width;
      const raw = min + percent * (max - min);
      let value;
      if (raw - min < 0.5) {
        value = min;
      } else if (max - raw < 0.5) {
        value = max;
      } else {
        value = Math.round(raw);
      }
      const distMin = Math.abs(value - values[0]);
      const distMax = Math.abs(value - values[1]);
  
      if (distMin < distMax) {
        onChange([clamp(value, min, values[1] - 1), values[1]]);
      } else {
        onChange([values[0], clamp(value, values[0] + 1, max)]);
      }
    };
  
    const fillLeft = getPercent(values[0]);
    const fillRight = getPercent(values[1]);
  
    return (
      <div className="range-container" ref={ref} onClick={onClickTrack}>
        <div className="range-track" />
        <div className="range-fill" style={{ left: `${fillLeft}%`, width: `${fillRight - fillLeft}%` }} />
        <div className="range-thumb" style={{ left: `${fillLeft}%` }} onMouseDown={onMouseDown(0)} />
        <div className="range-thumb" style={{ left: `${fillRight}%` }} onMouseDown={onMouseDown(1)} />
      </div>
    );
  };

const FilterPopup = React.forwardRef(({
    style,
    searchType,
    routeFilters,
    setRouteFilters,
    filterBorders,
    collectionFilters,
    setCollectionFilters,
    selectedTags,
    toggleTag,
  }, ref) => {
    const setRouteOrderKey = (key, value) => {
      const parts = Object.fromEntries(
        routeFilters.order.split(',').map(kv => [kv.split('_')[0], kv])
      );
      parts[key] = value;
      const newOrder = ['rating', 'created', 'length'].map(k => parts[k]).join(',');
      setRouteFilters(f => ({ ...f, order: newOrder }));
    };
  
    return (
      <div className="popup filter-popup" ref={ref} style={style}>
        {searchType === 'routes' ? (
          <>
            <div className="popup-group">
              <div className="popup-label">Длина маршрута (км)</div>
              <ThumbRange
                min={filterBorders?.min_length ?? 0}
                max={filterBorders?.max_length ?? 100}
                values={[routeFilters.min_length, routeFilters.max_length]}
                onChange={([min, max]) =>
                  setRouteFilters(f => ({ ...f, min_length: min, max_length: max }))
                }
              />
              <div className="dual-range">
                <input
                  type="number"
                  value={routeFilters.min_length}
                  onChange={e =>
                    setRouteFilters(f => ({
                      ...f,
                      min_length: clamp(+e.target.value, filterBorders?.min_length ?? 0, f.max_length - 1),
                    }))
                  }
                />
                <input
                  type="number"
                  value={routeFilters.max_length}
                  onChange={e =>
                    setRouteFilters(f => ({
                      ...f,
                      max_length: clamp(+e.target.value, f.min_length + 1, filterBorders?.max_length ?? 100),
                    }))
                  }
                />
              </div>
            </div>
  
            <div className="popup-group">
              <div className="popup-label">Длительность (часы)</div>
              <ThumbRange
                min={filterBorders?.min_duration ?? 0}
                max={filterBorders?.max_duration ?? 24}
                values={[routeFilters.min_duration, routeFilters.max_duration]}
                onChange={([min, max]) =>
                  setRouteFilters(f => ({ ...f, min_duration: min, max_duration: max }))
                }
              />
              <div className="dual-range">
                <input
                  type="number"
                  value={routeFilters.min_duration}
                  onChange={e =>
                    setRouteFilters(f => ({
                      ...f,
                      min_duration: clamp(+e.target.value, filterBorders?.min_duration ?? 0, f.max_duration - 1),
                    }))
                  }
                />
                <input
                  type="number"
                  value={routeFilters.max_duration}
                  onChange={e =>
                    setRouteFilters(f => ({
                      ...f,
                      max_duration: clamp(+e.target.value, f.min_duration + 1, filterBorders?.max_duration ?? 24),
                    }))
                  }
                />
              </div>
            </div>
  
            <div className="popup-group">
              <div className="popup-label">Сортировка</div>
              {['rating', 'created', 'length'].map(key => (
                <div className="sort-toggle-row" key={key}>
                  <div
                    className={`sort-toggle-button ${routeFilters.order.includes(`${key}_desc`) ? 'active' : ''}`}
                    onClick={() => setRouteOrderKey(key, `${key}_desc`)}
                  >
                    {key} (убыв.)
                  </div>
                  <div
                    className={`sort-toggle-button ${routeFilters.order.includes(`${key}_asc`) ? 'active' : ''}`}
                    onClick={() => setRouteOrderKey(key, `${key}_asc`)}
                  >
                    {key} (возр.)
                  </div>
                </div>
              ))}
            </div>
          </>
        ) : (
          <>
            <div className="popup-group">
              <div className="popup-label">Сортировка по рейтингу</div>
              <div className="sort-toggle-row">
                <div className={`sort-toggle-button ${collectionFilters.rating === 'rating_desc' ? 'active' : ''}`} onClick={() => setCollectionFilters(f => ({ ...f, rating: 'rating_desc' }))}>рейтинг (убыв.)</div>
                <div className={`sort-toggle-button ${collectionFilters.rating === 'rating_asc' ? 'active' : ''}`} onClick={() => setCollectionFilters(f => ({ ...f, rating: 'rating_asc' }))}>рейтинг (возр.)</div>
              </div>
            </div>
            <div className="popup-group">
              <div className="popup-label">Сортировка по дате</div>
              <div className="sort-toggle-row">
                <div className={`sort-toggle-button ${collectionFilters.created === 'created_desc' ? 'active' : ''}`} onClick={() => setCollectionFilters(f => ({ ...f, created: 'created_desc' }))}>новые</div>
                <div className={`sort-toggle-button ${collectionFilters.created === 'created_asc' ? 'active' : ''}`} onClick={() => setCollectionFilters(f => ({ ...f, created: 'created_asc' }))}>старые</div>
              </div>
            </div>
            <div className="popup-group">
              <div className="popup-label">Теги</div>
              <select onChange={(e) => toggleTag(e.target.value)} value="">
                <option value="" disabled>Выбрать тег...</option>
                {COLLECTION_TAGS.filter(tag => !selectedTags.includes(tag)).map(tag => (
                  <option key={tag} value={tag}>{tag}</option>
                ))}
              </select>
              <div className="tags-selected">
                {selectedTags.map(tag => (
                  <button key={tag} className="tag" onClick={() => toggleTag(tag)}>
                    {tag} ×
                  </button>
                ))}
              </div>
            </div>
          </>
        )}
      </div>
    );
  });
  
  export default FilterPopup;