
import React, { useState, useEffect, useRef } from 'react';
import './AdminReportPage.css';

export default function AdminReportPage() {
  const [reports, setReports] = useState([]);
  const [menuInfo, setMenuInfo] = useState(null);
  const buttonRefs = useRef({});
  const menuRef = useRef(null);

  const fetchReports = async () => {
    try {
      const res = await fetch('http://localhost:8100/api/moderation/entity/reports?pagination-page-number=1&pagination-per-page=10&status=opened', {
        credentials: 'include',
      });
      if (!res.ok) throw new Error('Failed to fetch');
      const data = await res.json();
      setReports(data.reports);
    } catch (err) {
      console.error('Failed to fetch reports:', err);
    }
  };

  useEffect(() => {
    fetchReports();
    const interval = setInterval(fetchReports, 5000);
    return () => clearInterval(interval);
  }, []);

  const handleMenuClose = () => setMenuInfo(null);

  const handleMenuOpen = (reportId) => {
    const btn = buttonRefs.current[reportId];
    if (!btn) return;
    const rect = btn.getBoundingClientRect();
    const menuWidth = 180;
    const screenPadding = 12;

    let left = rect.left;
    if (left + menuWidth > window.innerWidth - screenPadding) {
      left = window.innerWidth - menuWidth - screenPadding;
    }

    setMenuInfo({
      reportId,
      top: rect.bottom + 4,
      left,
    });
  };

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (menuRef.current && !menuRef.current.contains(e.target)) {
        handleMenuClose();
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  return (
    <div className="admin-report-page">
      <h1 className="page-title">Content Moderation Reports</h1>
      <table className="reports-table">
        <thead>
          <tr>
            <th>Report ID</th>
            <th>Reporter ID</th>
            <th>Reported Entity Type</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Created At</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {reports.map((report) => (
            <tr key={report.report_id}>
              <td>#{report.report_id}</td>
              <td>{report.user_id}</td>
              <td>{report.object_type}</td>
              <td>{report.reason}</td>
              <td><span className="status-pill">{report.status}</span></td>
              <td>{new Date(report.created_at * 1000).toISOString().slice(0, 10)}</td>
              <td className="actions">
                <button
                  className="dropdown-button"
                  ref={(el) => (buttonRefs.current[report.report_id] = el)}
                  onClick={() => handleMenuOpen(report.report_id)}
                >
                  <svg width="14" height="14" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M5 7L10 12L15 7H5Z" />
                  </svg>
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {menuInfo && (
        <div
          className="dropdown-menu"
          style={{
            position: 'fixed',
            top: `${menuInfo.top}px`,
            left: `${menuInfo.left}px`,
            zIndex: 9999,
          }}
          ref={menuRef}
        >
          <button onClick={() => { console.log('Mark as In Review', menuInfo.reportId); handleMenuClose(); }}>
            Mark as In Review
          </button>
          <button onClick={() => { console.log('Resolve', menuInfo.reportId); handleMenuClose(); }}>
            Resolve
          </button>
        </div>
      )}
    </div>
  );
}

