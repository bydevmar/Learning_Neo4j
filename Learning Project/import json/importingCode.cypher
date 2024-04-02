// Import Users
CALL apoc.load.json("file:///users.json") YIELD value
UNWIND value AS user
CREATE (:User {user_id: user.user_id, username: user.username});

// Import Posts
CALL apoc.load.json("file:///posts.json") YIELD value
UNWIND value AS post
MATCH (u:User {user_id: post.user_id})
CREATE (p:Post {post_id: post.post_id, content: post.content, date: date(post.date)})
MERGE (u)-[:POSTED]->(p);

// Import Comments
CALL apoc.load.json("file:///comments.json") YIELD value
UNWIND value AS comment
MATCH (u:User {user_id: comment.user_id})
MATCH (p:Post {post_id: comment.post_id})
CREATE (c:Comment {comment_id: comment.comment_id, content: comment.content, date: date(comment.date)})
MERGE (u)-[:COMMENTED]->(c)-[:ON_POST]->(p);

// Import Relationships
CALL apoc.load.json("file:///relationships.json") YIELD value
UNWIND value AS relationship
MATCH (u1:User {user_id: relationship.user_id_1})
MATCH (u2:User {user_id: relationship.user_id_2})
MERGE (u1)-[:FOLLOWS]->(u2);
