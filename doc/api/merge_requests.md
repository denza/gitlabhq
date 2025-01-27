# Merge requests

## List merge requests

Get all merge requests for this project. 
The `state` parameter can be used to get only merge requests with a given state (`opened`, `closed`, or `merged`) or all of them (`all`).
The pagination parameters `page` and `per_page` can be used to restrict the list of merge requests.

```
GET /projects/:id/merge_requests
GET /projects/:id/merge_requests?state=opened
GET /projects/:id/merge_requests?state=all
GET /projects/:id/merge_requests?iid=42
```

Parameters:

- `id` (required) - The ID of a project
- `iid` (optional) - Return the request having the given `iid`
- `state` (optional) - Return `all` requests or just those that are `merged`, `opened` or `closed`
- `order_by` (optional) - Return requests ordered by `created_at` or `updated_at` fields. Default is `created_at`
- `sort` (optional) - Return requests sorted in `asc` or `desc` order. Default is `desc`

```json
[
  {
    "id": 1,
    "iid": 1,
    "target_branch": "master",
    "source_branch": "test1",
    "project_id": 3,
    "title": "test1",
    "state": "opened",
    "upvotes": 0,
    "downvotes": 0,
    "author": {
      "id": 1,
      "username": "admin",
      "email": "admin@example.com",
      "name": "Administrator",
      "state": "active",
      "created_at": "2012-04-29T08:46:00Z"
    },
    "assignee": {
      "id": 1,
      "username": "admin",
      "email": "admin@example.com",
      "name": "Administrator",
      "state": "active",
      "created_at": "2012-04-29T08:46:00Z"
    },
    "description":"fixed login page css paddings",
    "work_in_progress": false
  }
]
```

## Get single MR

Shows information about a single merge request.

```
GET /projects/:id/merge_requests/:merge_request_id
```

Parameters:

- `id` (required) - The ID of a project
- `merge_request_id` (required) - The ID of MR

```json
{
  "id": 1,
  "iid": 1,
  "target_branch": "master",
  "source_branch": "test1",
  "project_id": 3,
  "title": "test1",
  "state": "merged",
  "upvotes": 0,
  "downvotes": 0,
  "author": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "assignee": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "description":"fixed login page css paddings",
  "work_in_progress": false
}
```

## Get single MR commits

Get a list of merge request commits.

```
GET /projects/:id/merge_requests/:merge_request_id/commits
```

Parameters:

- `id` (required) - The ID of a project
- `merge_request_id` (required) - The ID of MR


```json
[
  {
    "id": "ed899a2f4b50b4370feeea94676502b42383c746",
    "short_id": "ed899a2f4b5",
    "title": "Replace sanitize with escape once",
    "author_name": "Dmitriy Zaporozhets",
    "author_email": "dzaporozhets@sphereconsultinginc.com",
    "created_at": "2012-09-20T11:50:22+03:00",
    "message": "Replace sanitize with escape once"
  },
  {
    "id": "6104942438c14ec7bd21c6cd5bd995272b3faff6",
    "short_id": "6104942438c",
    "title": "Sanitize for network graph",
    "author_name": "randx",
    "author_email": "dmitriy.zaporozhets@gmail.com",
    "created_at": "2012-09-20T09:06:12+03:00",
    "message": "Sanitize for network graph"
  }
]
```

## Get single MR changes

Shows information about the merge request including its files and changes.

```
GET /projects/:id/merge_requests/:merge_request_id/changes
```

Parameters:

- `id` (required) - The ID of a project
- `merge_request_id` (required) - The ID of MR

```json
{
  "id": 21,
  "iid": 1,
  "project_id": 4,
  "title": "Blanditiis beatae suscipit hic assumenda et molestias nisi asperiores repellat et.",
  "description": "Qui voluptatibus placeat ipsa alias quasi. Deleniti rem ut sint. Optio velit qui distinctio.",
  "work_in_progress": false,
  "state": "reopened",
  "created_at": "2015-02-02T19:49:39.159Z",
  "updated_at": "2015-02-02T20:08:49.959Z",
  "target_branch": "secret_token",
  "source_branch": "version-1-9",
  "upvotes": 0,
  "downvotes": 0,
  "author": {
    "name": "Chad Hamill",
    "username": "jarrett",
    "id": 5,
    "state": "active",
    "avatar_url": "http://www.gravatar.com/avatar/b95567800f828948baf5f4160ebb2473?s=40&d=identicon"
  },
  "assignee": {
    "name": "Administrator",
    "username": "root",
    "id": 1,
    "state": "active",
    "avatar_url": "http://www.gravatar.com/avatar/e64c7d89f26bd1972efa854d13d7dd61?s=40&d=identicon"
  },
  "source_project_id": 4,
  "target_project_id": 4,
  "labels": [ ],
  "milestone": {
    "id": 5,
    "iid": 1,
    "project_id": 4,
    "title": "v2.0",
    "description": "Assumenda aut placeat expedita exercitationem labore sunt enim earum.",
    "state": "closed",
    "created_at": "2015-02-02T19:49:26.013Z",
    "updated_at": "2015-02-02T19:49:26.013Z",
    "due_date": null
  },
  "changes": [
    {
    "old_path": "VERSION",
    "new_path": "VERSION",
    "a_mode": "100644",
    "b_mode": "100644",
    "diff": "--- a/VERSION\ +++ b/VERSION\ @@ -1 +1 @@\ -1.9.7\ +1.9.8",
    "new_file": false,
    "renamed_file": false,
    "deleted_file": false
    }
  ]
}
```

## Create MR

Creates a new merge request.
```
POST /projects/:id/merge_requests
```

Parameters:

- `id` (required)                - The ID of a project
- `source_branch` (required)     - The source branch
- `target_branch` (required)     - The target branch
- `assignee_id` (optional)       - Assignee user ID
- `title` (required)             - Title of MR
- `description` (optional)       - Description of MR
- `target_project_id` (optional) - The target project (numeric id)
- `labels` (optional)            - Labels for MR as a comma-separated list

```json
{
  "id": 1,
  "target_branch": "master",
  "source_branch": "test1",
  "project_id": 3,
  "title": "test1",
  "state": "opened",
  "upvotes": 0,
  "downvotes": 0,
  "author": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "assignee": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "description":"fixed login page css paddings"
}
```

If the operation is successful, 200 and the newly created merge request is returned.
If an error occurs, an error number and a message explaining the reason is returned.

## Update MR

Updates an existing merge request. You can change the target branch, title, or even close the MR.

```
PUT /projects/:id/merge_requests/:merge_request_id
```

Parameters:

- `id` (required)               - The ID of a project
- `merge_request_id` (required) - ID of MR
- `target_branch`               - The target branch
- `assignee_id`                 - Assignee user ID
- `title`                       - Title of MR
- `description`                 - Description of MR
- `state_event`                 - New state (close|reopen|merge)
- `labels` (optional)           - Labels for MR as a comma-separated list

```json
{
  "id": 1,
  "target_branch": "master",
  "project_id": 3,
  "title": "test1",
  "description": "description1",
  "state": "opened",
  "upvotes": 0,
  "downvotes": 0,
  "author": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "assignee": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  }
}
```

If the operation is successful, 200 and the updated merge request is returned.
If an error occurs, an error number and a message explaining the reason is returned.

## Accept MR

Merge changes submitted with MR using this API.

If merge success you get `200 OK`.

If it has some conflicts and can not be merged - you get 405 and error message 'Branch cannot be merged'

If merge request is already merged or closed - you get 405 and error message 'Method Not Allowed'

If you don't have permissions to accept this merge request - you'll get a 401

```
PUT /projects/:id/merge_requests/:merge_request_id/merge
```

Parameters:

- `id` (required)                           - The ID of a project
- `merge_request_id` (required)             - ID of MR
- `merge_commit_message` (optional)         - Custom merge commit message
- `should_remove_source_branch` (optional)  - if `true` removes the source branch
- `merged_when_build_succeeds` (optional)    - if `true` the MR is merge when the build succeeds

```json
{
  "id": 1,
  "target_branch": "master",
  "source_branch": "test1",
  "project_id": 3,
  "title": "test1",
  "state": "merged",
  "upvotes": 0,
  "downvotes": 0,
  "author": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "assignee": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  }
}
```

## Cancel Merge When Build Succeeds

If successful you'll get `200 OK`.

If you don't have permissions to accept this merge request - you'll get a 401

If the merge request is already merged or closed - you get 405 and error message 'Method Not Allowed'

In case the merge request is not set to be merged when the build succeeds, you'll also get a 406 error.
```
PUT /projects/:id/merge_requests/:merge_request_id/cancel_merge_when_build_succeeds
```
Parameters:

- `id` (required)                           - The ID of a project
- `merge_request_id` (required)             - ID of MR

```json
{
  "id": 1,
  "target_branch": "master",
  "source_branch": "test1",
  "project_id": 3,
  "title": "test1",
  "state": "merged",
  "upvotes": 0,
  "downvotes": 0,
  "author": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  },
  "assignee": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "name": "Administrator",
    "state": "active",
    "created_at": "2012-04-29T08:46:00Z"
  }
}
```

## Comments on merge requets

Comments are done via the [notes](notes.md) resource.
