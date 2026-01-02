WITH
	step_0 AS (
		SELECT :'input' AS input),
	step_1 AS (
		SELECT
			t.input,
			length(t.input) AS input_length,
			t.input ~ '^[0-9]+$' AS input_numeric,
			lpad(t.input, 4, '0') AS input_fixed
		FROM step_0 AS t),
	step_2 AS (
		SELECT
			t.*,
			CASE
				WHEN t.input = 'EMPTY' THEN 1
				WHEN t.input = 'MULTI' THEN 1
				WHEN t.input_length = 0 THEN 2
				WHEN t.input_length > 4 THEN 2
				WHEN t.input_numeric IS FALSE THEN 2
				ELSE 0
			END AS status
		FROM step_1 AS t),
	step_3 AS (
		SELECT
			t.*,
			substr(t.input_fixed, 1, 2) AS minutes_text,
			substr(t.input_fixed, 3, 2) AS seconds_text
		FROM step_2 AS t),
	step_4 AS (
		SELECT
			t.*,
			CASE WHEN t.status = 0 THEN t.minutes_text::int ELSE 0 END AS minutes,
			CASE WHEN t.status = 0 THEN t.seconds_text::int ELSE 0 END AS seconds
		FROM step_3 AS t),
	step_5 AS (
		SELECT
			t.*,
			CASE WHEN t.status = 0 AND t.seconds >= 60 AND t.minutes < 99 THEN t.minutes + 1 ELSE t.minutes END AS minutes_adjusted,
			CASE WHEN t.status = 0 AND t.seconds >= 60 AND t.minutes < 99 THEN t.seconds % 60 ELSE t.seconds END AS seconds_adjusted
		FROM step_4 AS t),
	step_6 AS (
		SELECT
			t.*,
			CASE WHEN t.status = 0 THEN lpad(t.minutes_adjusted::text, 2, '0') ELSE '00' END AS minutes_output,
			CASE WHEN t.status = 0 THEN lpad(t.seconds_adjusted::text, 2, '0') ELSE '00' END AS seconds_output
		FROM step_5 AS t),
	step_7 AS (
		SELECT
			t.status,
			CASE WHEN t.status = 0 THEN concat(t.minutes_output, ':', t.seconds_output) END AS output
		FROM step_6 AS t)
SELECT
	t.status,
	t.output
FROM step_7 AS t;
