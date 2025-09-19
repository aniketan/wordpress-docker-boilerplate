-- 02-migrate-endpoints.sql
-- WordPress URL migration script
UPDATE wput_options 
SET option_value = REPLACE(option_value, 'http://wp.demo.com', 'http://localhost:8080') 
WHERE option_name = 'home' OR option_name = 'siteurl';

UPDATE wput_posts 
SET guid = REPLACE(guid, 'http://wp.demo.com', 'http://localhost:8080');

UPDATE wput_posts 
SET post_content = REPLACE(post_content, 'http://wp.demo.com', 'http://localhost:8080');

UPDATE wput_postmeta 
SET meta_value = REPLACE(meta_value, 'http://wp.demo.com', 'http://localhost:8080');

-- Update any other WordPress tables that might contain URLs
UPDATE wput_comments 
SET comment_content = REPLACE(comment_content, 'http://wp.demo.com', 'http://localhost:8080');
