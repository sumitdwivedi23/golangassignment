DROP TABLE if exists blogDB.users;
CREATE TABLE IF NOT EXISTS blogDB.users (
	username text NOT NULL,
	"password" text NOT NULL,
	firstname text,
	lastname text,
	profile_pic text,
	email text,
	PRIMARY KEY(username)
);

CREATE SEQUENCE IF NOT EXISTS posts_sampleid_seq;
CREATE TABLE IF NOT EXISTS blogDB.posts (
	id bigint DEFAULT nextval('posts_sampleid_seq'::regclass) NOT NULL,
	body text,
	username text NOT NULL,
	PRIMARY KEY(id)
);

ALTER TABLE IF EXISTS blogDB.posts
	ADD CONSTRAINT posts_username_fkey
	FOREIGN KEY (username)
	REFERENCES users (username)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
CREATE SEQUENCE IF NOT EXISTS likes_sampleid_seq;
CREATE TABLE IF NOT EXISTS blogDB.likes (
	id bigint DEFAULT nextval('likes_sampleid_seq'::regclass) NOT NULL,
	post_id bigint NOT NULL,
	user_name text NOT NULL,
	is_liked boolean DEFAULT false NOT NULL,
	PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS public.followers (
	user_id text NOT NULL,
	following_id text NOT NULL,
);

ALTER TABLE IF EXISTS blogDB.followers
	ADD CONSTRAINT followers_user_id_fkey
	FOREIGN KEY (user_id)
	REFERENCES users (username)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

ALTER TABLE IF EXISTS blogDB.followers
	ADD CONSTRAINT followers_following_id_fkey
	FOREIGN KEY (following_id)
	REFERENCES users (username)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
