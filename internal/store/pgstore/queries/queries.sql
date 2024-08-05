-- name: GetRoom :one
SELECT
    "id", "theme"
FROM rooms
WHERE id = $1;

-- name: GetRooms :many
SELECT
    "id", "theme"
FROM rooms;

-- name: InsertRoom :one
INSERT INTO rooms
    ( "theme" ) VALUES
    ( $1 )
RETURNING "id";

-- name: GetMessage :one
SELECT 
    "id", "room_id", "message", "react_count", "answered"
FROM messages
WHERE
    id = $1;

-- name: GetMessages :many
SELECT 
    "id", "room_id", "message", "react_count", "answered"
FROM messages;

-- name: ReactToMessage :one
UPDATE messages
SET
    react_count = react_count + 1
WHERE
    id = $1
RETURNING react_count;

-- name: RemoveReactionFromMessage :one
UPDATE messages
SET
    react_count = react_count - 1
WHERE
    id = $1
RETURNING react_count;

-- name: MarkMessageAsAnswered :exec
UPDATE messages
SET
    react_count = react_count - 1
WHERE
    id = $1;