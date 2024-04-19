SELECT *
  FROM (SELECT * FROM clm_claim_tracking ORDER BY tracking_id DESC)
 WHERE ROWNUM < 10;
