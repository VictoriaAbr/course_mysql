USE vk2;

DROP TABLE calls;

CREATE TABLE calls(
	id_call SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	call_status BOOLEAN DEFAULT FALSE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX calls_from_user_id_idx (from_user_id),
	INDEX calls_to_user_id_idx (to_user_id),
	CONSTRAINT fk_calls_from_user_id FOREIGN KEY (from_user_id) REFERENCES users (id),
	CONSTRAINT fk_calls_to_user_id FOREIGN KEY (to_user_id) REFERENCES users (id)
);

CREATE TABLE countries(
	county_id SERIAL PRIMARY KEY,
	country_name VARCHAR(130),
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX county_id_idx (county_id)
);

CREATE TABLE cities(
	city_id SERIAL PRIMARY KEY,
	city_name VARCHAR(130),
	county_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX city_id_idx (city_id),
	FOREIGN KEY (county_id) REFERENCES countries(county_id)
);

ALTER TABLE profiles RENAME COLUMN city TO city_id;
ALTER TABLE profiles RENAME COLUMN country TO country_id;

UPDATE profiles
SET city_id = NULL
WHERE city_id is not null;

UPDATE profiles
SET country_id = NULL
WHERE country_id is not null;

ALTER TABLE profiles MODIFY COLUMN city_id BIGINT UNSIGNED;
ALTER TABLE profiles MODIFY COLUMN country_id BIGINT UNSIGNED;


