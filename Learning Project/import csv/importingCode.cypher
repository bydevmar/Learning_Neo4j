// Import Users
LOAD CSV WITH HEADERS FROM 'file:///Users.csv' AS row
CREATE (:User {user_id: toInteger(row.user_id), username: row.username});

// Import Posts
LOAD CSV WITH HEADERS FROM 'file:///Posts.csv' AS row
MATCH (u:User {user_id: toInteger(row.user_id)})
CREATE (p:Post {post_id: toInteger(row.post_id), content: row.content, date: date(row.date)})
MERGE (u)-[:POSTED]->(p);

// Import Comments
LOAD CSV WITH HEADERS FROM 'file:///Comments.csv' AS row
MATCH (u:User {user_id: toInteger(row.user_id)})
MATCH (p:Post {post_id: toInteger(row.post_id)})
CREATE (c:Comment {comment_id: toInteger(row.comment_id), content: row.content, date: date(row.date)})
MERGE (u)-[:COMMENTED]->(c)-[:ON_POST]->(p);

// Import Relationships
LOAD CSV WITH HEADERS FROM 'file:///Relationships.csv' AS row
MATCH (u1:User {user_id: toInteger(row.user_id_1)})
MATCH (u2:User {user_id: toInteger(row.user_id_2)})
MERGE (u1)-[:FOLLOWS]->(u2);
