-- mart_department_vs_target.sql
SELECT
    d.department,
    d.total_revenue,
    t.revenue_target,
    d.total_revenue - t.revenue_target  AS variance,
    ROUND((d.total_revenue / NULLIF(t.revenue_target, 0)) * 100, 1) AS achievement_pct
FROM {{ ref('mart_department_stats') }} d
LEFT JOIN {{ ref('department_targets') }} t  -- ← ref seed like a normal model
    USING (department)