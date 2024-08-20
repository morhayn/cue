package json

import "strings"

#Workflow: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	@jsonschema(id="https://json.schemastore.org/github-workflow.json")

	// The name of your workflow. GitHub displays the names of your
	// workflows on your repository's actions page. If you omit this
	// field, GitHub sets the name to the workflow's filename.
	name?: string

	// The name of the GitHub event that triggers the workflow. You
	// can provide a single event string, array of events, array of
	// event types, or an event configuration map that schedules a
	// workflow or restricts the execution of a workflow to specific
	// files, tags, or branch changes. For a list of available
	// events, see
	// https://help.github.com/en/github/automating-your-workflow-with-github-actions/events-that-trigger-workflows.
	on!: matchN(1, [#event, [...#event] & [_, ...], {
		// Runs your workflow anytime the branch_protection_rule event
		// occurs. More than one activity type triggers this event.
		branch_protection_rule?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "edited" | "deleted"] | {
				...
			}) | *["created", "edited", "deleted"]
			...
		})

		// Runs your workflow anytime the check_run event occurs. More
		// than one activity type triggers this event. For information
		// about the REST API, see
		// https://developer.github.com/v3/checks/runs.
		check_run?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "rerequested" | "completed" | "requested_action"] | {
				...
			}) | *["created", "rerequested", "completed", "requested_action"]
			...
		})

		// Runs your workflow anytime the check_suite event occurs. More
		// than one activity type triggers this event. For information
		// about the REST API, see
		// https://developer.github.com/v3/checks/suites/.
		check_suite?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."completed" | "requested" | "rerequested"] | {
				...
			}) | *["completed", "requested", "rerequested"]
			...
		})

		// Runs your workflow anytime someone creates a branch or tag,
		// which triggers the create event. For information about the
		// REST API, see
		// https://developer.github.com/v3/git/refs/#create-a-reference.
		create?: #eventObject

		// Runs your workflow anytime someone deletes a branch or tag,
		// which triggers the delete event. For information about the
		// REST API, see
		// https://developer.github.com/v3/git/refs/#delete-a-reference.
		delete?: #eventObject

		// Runs your workflow anytime someone creates a deployment, which
		// triggers the deployment event. Deployments created with a
		// commit SHA may not have a Git ref. For information about the
		// REST API, see
		// https://developer.github.com/v3/repos/deployments/.
		deployment?: #eventObject

		// Runs your workflow anytime a third party provides a deployment
		// status, which triggers the deployment_status event.
		// Deployments created with a commit SHA may not have a Git ref.
		// For information about the REST API, see
		// https://developer.github.com/v3/repos/deployments/#create-a-deployment-status.
		deployment_status?: #eventObject

		// Runs your workflow anytime the discussion event occurs. More
		// than one activity type triggers this event. For information
		// about the GraphQL API, see
		// https://docs.github.com/en/graphql/guides/using-the-graphql-api-for-discussions
		discussion?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "edited" | "deleted" | "transferred" | "pinned" | "unpinned" | "labeled" | "unlabeled" | "locked" | "unlocked" | "category_changed" | "answered" | "unanswered"] | {
				...
			}) | *["created", "edited", "deleted", "transferred", "pinned", "unpinned", "labeled", "unlabeled", "locked", "unlocked", "category_changed", "answered", "unanswered"]
			...
		})

		// Runs your workflow anytime the discussion_comment event occurs.
		// More than one activity type triggers this event. For
		// information about the GraphQL API, see
		// https://docs.github.com/en/graphql/guides/using-the-graphql-api-for-discussions
		discussion_comment?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "edited" | "deleted"] | {
				...
			}) | *["created", "edited", "deleted"]
			...
		})

		// Runs your workflow anytime when someone forks a repository,
		// which triggers the fork event. For information about the REST
		// API, see
		// https://developer.github.com/v3/repos/forks/#create-a-fork.
		fork?: #eventObject

		// Runs your workflow when someone creates or updates a Wiki page,
		// which triggers the gollum event.
		gollum?: #eventObject

		// Runs your workflow anytime the issue_comment event occurs. More
		// than one activity type triggers this event. For information
		// about the REST API, see
		// https://developer.github.com/v3/issues/comments/.
		issue_comment?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "edited" | "deleted"] | {
				...
			}) | *["created", "edited", "deleted"]
			...
		})

		// Runs your workflow anytime the issues event occurs. More than
		// one activity type triggers this event. For information about
		// the REST API, see https://developer.github.com/v3/issues.
		issues?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."opened" | "edited" | "deleted" | "transferred" | "pinned" | "unpinned" | "closed" | "reopened" | "assigned" | "unassigned" | "labeled" | "unlabeled" | "locked" | "unlocked" | "milestoned" | "demilestoned"] | {
				...
			}) | *["opened", "edited", "deleted", "transferred", "pinned", "unpinned", "closed", "reopened", "assigned", "unassigned", "labeled", "unlabeled", "locked", "unlocked", "milestoned", "demilestoned"]
			...
		})

		// Runs your workflow anytime the label event occurs. More than
		// one activity type triggers this event. For information about
		// the REST API, see
		// https://developer.github.com/v3/issues/labels/.
		label?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "edited" | "deleted"] | {
				...
			}) | *["created", "edited", "deleted"]
			...
		})

		// Runs your workflow when a pull request is added to a merge
		// queue, which adds the pull request to a merge group. For
		// information about the merge queue, see
		// https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request-with-a-merge-queue
		// .
		merge_group?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."checks_requested"] | {
				...
			}) | *["checks_requested"]
			...
		})

		// Runs your workflow anytime the milestone event occurs. More
		// than one activity type triggers this event. For information
		// about the REST API, see
		// https://developer.github.com/v3/issues/milestones/.
		milestone?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "closed" | "opened" | "edited" | "deleted"] | {
				...
			}) | *["created", "closed", "opened", "edited", "deleted"]
			...
		})

		// Runs your workflow anytime someone pushes to a GitHub
		// Pages-enabled branch, which triggers the page_build event. For
		// information about the REST API, see
		// https://developer.github.com/v3/repos/pages/.
		page_build?: #eventObject

		// Runs your workflow anytime the project event occurs. More than
		// one activity type triggers this event. For information about
		// the REST API, see https://developer.github.com/v3/projects/.
		project?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "updated" | "closed" | "reopened" | "edited" | "deleted"] | {
				...
			}) | *["created", "updated", "closed", "reopened", "edited", "deleted"]
			...
		})

		// Runs your workflow anytime the project_card event occurs. More
		// than one activity type triggers this event. For information
		// about the REST API, see
		// https://developer.github.com/v3/projects/cards.
		project_card?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "moved" | "converted" | "edited" | "deleted"] | {
				...
			}) | *["created", "moved", "converted", "edited", "deleted"]
			...
		})

		// Runs your workflow anytime the project_column event occurs.
		// More than one activity type triggers this event. For
		// information about the REST API, see
		// https://developer.github.com/v3/projects/columns.
		project_column?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "updated" | "moved" | "deleted"] | {
				...
			}) | *["created", "updated", "moved", "deleted"]
			...
		})

		// Runs your workflow anytime someone makes a private repository
		// public, which triggers the public event. For information about
		// the REST API, see https://developer.github.com/v3/repos/#edit.
		public?: #eventObject

		// Runs your workflow anytime the pull_request event occurs. More
		// than one activity type triggers this event. For information
		// about the REST API, see https://developer.github.com/v3/pulls.
		// Note: Workflows do not run on private base repositories when
		// you open a pull request from a forked repository.
		// When you create a pull request from a forked repository to the
		// base repository, GitHub sends the pull_request event to the
		// base repository and no pull request events occur on the forked
		// repository.
		// Workflows don't run on forked repositories by default. You must
		// enable GitHub Actions in the Actions tab of the forked
		// repository.
		// The permissions for the GITHUB_TOKEN in forked repositories is
		// read-only. For more information about the GITHUB_TOKEN, see
		// https://help.github.com/en/articles/virtual-environments-for-github-actions.
		pull_request?: #ref & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."assigned" | "unassigned" | "labeled" | "unlabeled" | "opened" | "edited" | "closed" | "reopened" | "synchronize" | "converted_to_draft" | "ready_for_review" | "locked" | "unlocked" | "milestoned" | "demilestoned" | "review_requested" | "review_request_removed" | "auto_merge_enabled" | "auto_merge_disabled"] | {
				...
			}) | *["opened", "synchronize", "reopened"]

			{[=~"^(branche|tag|path)s(-ignore)?$" & !~"^(types)$"]: [...]}
		})

		// Runs your workflow anytime the pull_request_review event
		// occurs. More than one activity type triggers this event. For
		// information about the REST API, see
		// https://developer.github.com/v3/pulls/reviews.
		// Note: Workflows do not run on private base repositories when
		// you open a pull request from a forked repository.
		// When you create a pull request from a forked repository to the
		// base repository, GitHub sends the pull_request event to the
		// base repository and no pull request events occur on the forked
		// repository.
		// Workflows don't run on forked repositories by default. You must
		// enable GitHub Actions in the Actions tab of the forked
		// repository.
		// The permissions for the GITHUB_TOKEN in forked repositories is
		// read-only. For more information about the GITHUB_TOKEN, see
		// https://help.github.com/en/articles/virtual-environments-for-github-actions.
		pull_request_review?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."submitted" | "edited" | "dismissed"] | {
				...
			}) | *["submitted", "edited", "dismissed"]
			...
		})

		// Runs your workflow anytime a comment on a pull request's
		// unified diff is modified, which triggers the
		// pull_request_review_comment event. More than one activity type
		// triggers this event. For information about the REST API, see
		// https://developer.github.com/v3/pulls/comments.
		// Note: Workflows do not run on private base repositories when
		// you open a pull request from a forked repository.
		// When you create a pull request from a forked repository to the
		// base repository, GitHub sends the pull_request event to the
		// base repository and no pull request events occur on the forked
		// repository.
		// Workflows don't run on forked repositories by default. You must
		// enable GitHub Actions in the Actions tab of the forked
		// repository.
		// The permissions for the GITHUB_TOKEN in forked repositories is
		// read-only. For more information about the GITHUB_TOKEN, see
		// https://help.github.com/en/articles/virtual-environments-for-github-actions.
		pull_request_review_comment?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."created" | "edited" | "deleted"] | {
				...
			}) | *["created", "edited", "deleted"]
			...
		})

		// This event is similar to pull_request, except that it runs in
		// the context of the base repository of the pull request, rather
		// than in the merge commit. This means that you can more safely
		// make your secrets available to the workflows triggered by the
		// pull request, because only workflows defined in the commit on
		// the base repository are run. For example, this event allows
		// you to create workflows that label and comment on pull
		// requests, based on the contents of the event payload.
		pull_request_target?: #ref & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."assigned" | "unassigned" | "labeled" | "unlabeled" | "opened" | "edited" | "closed" | "reopened" | "synchronize" | "converted_to_draft" | "ready_for_review" | "locked" | "unlocked" | "review_requested" | "review_request_removed" | "auto_merge_enabled" | "auto_merge_disabled"] | {
				...
			}) | *["opened", "synchronize", "reopened"]

			{[=~"^(branche|tag|path)s(-ignore)?$" & !~"^(types)$"]: _}
		})

		// Runs your workflow when someone pushes to a repository branch,
		// which triggers the push event.
		// Note: The webhook payload available to GitHub Actions does not
		// include the added, removed, and modified attributes in the
		// commit object. You can retrieve the full commit object using
		// the REST API. For more information, see
		// https://developer.github.com/v3/repos/commits/#get-a-single-commit.
		push?: #ref & (null | bool | number | string | [...] | {
			{[=~"^(branche|tag|path)s(-ignore)?$" & !~"^()$"]: [...string]}
		})

		// Runs your workflow anytime a package is published or updated.
		// For more information, see
		// https://help.github.com/en/github/managing-packages-with-github-packages.
		registry_package?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."published" | "updated"] | {
				...
			}) | *["published", "updated"]
			...
		})

		// Runs your workflow anytime the release event occurs. More than
		// one activity type triggers this event. For information about
		// the REST API, see
		// https://developer.github.com/v3/repos/releases/ in the GitHub
		// Developer documentation.
		release?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."published" | "unpublished" | "created" | "edited" | "deleted" | "prereleased" | "released"] | {
				...
			}) | *["published", "unpublished", "created", "edited", "deleted", "prereleased", "released"]
			...
		})

		// Runs your workflow anytime the status of a Git commit changes,
		// which triggers the status event. For information about the
		// REST API, see https://developer.github.com/v3/repos/statuses/.
		status?: #eventObject

		// Runs your workflow anytime the watch event occurs. More than
		// one activity type triggers this event. For information about
		// the REST API, see
		// https://developer.github.com/v3/activity/starring/.
		watch?: #eventObject

		// Allows workflows to be reused by other workflows.
		workflow_call?: null | bool | number | string | [...] | {
			// When using the workflow_call keyword, you can optionally
			// specify inputs that are passed to the called workflow from the
			// caller workflow.
			inputs?: {
				{[=~"^[_a-zA-Z][a-zA-Z0-9_-]*$" & !~"^()$"]: {
					// A string description of the input parameter.
					description?: string

					// A string shown to users using the deprecated input.
					deprecationMessage?: string

					// A boolean to indicate whether the action requires the input
					// parameter. Set to true when the parameter is required.
					required?: bool

					// Required if input is defined for the on.workflow_call keyword.
					// The value of this parameter is a string specifying the data
					// type of the input. This must be one of: boolean, number, or
					// string.
					type!: "boolean" | "number" | "string"

					// The default value is used when an input parameter isn't
					// specified in a workflow file.
					default?: bool | number | string
				}}
			}

			// A map of the secrets that can be used in the called workflow.
			// Within the called workflow, you can use the secrets context to
			// refer to a secret.
			secrets?: null | bool | number | string | [...] | {
				{[=~"^[_a-zA-Z][a-zA-Z0-9_-]*$" & !~"^()$"]: null | bool | number | string | [...] | {
					// A string description of the secret parameter.
					description?: string

					// A boolean specifying whether the secret must be supplied.
					required!: bool
				}}
			}
			...
		}

		// You can now create workflows that are manually triggered with
		// the new workflow_dispatch event. You will then see a 'Run
		// workflow' button on the Actions tab, enabling you to easily
		// trigger a run.
		workflow_dispatch?: null | bool | number | string | [...] | {
			// Input parameters allow you to specify data that the action
			// expects to use during runtime. GitHub stores input parameters
			// as environment variables. Input ids with uppercase letters are
			// converted to lowercase during runtime. We recommended using
			// lowercase input ids.
			inputs?: {
				{[=~"^[_a-zA-Z][a-zA-Z0-9_-]*$" & !~"^()$"]: {
					// A string description of the input parameter.
					description!: string

					// A string shown to users using the deprecated input.
					deprecationMessage?: string

					// A boolean to indicate whether the action requires the input
					// parameter. Set to true when the parameter is required.
					required?: bool

					// A string representing the default value. The default value is
					// used when an input parameter isn't specified in a workflow
					// file.
					default?: _

					// A string representing the type of the input.
					type?: "string" | "choice" | "boolean" | "number" | "environment"

					// The options of the dropdown list, if the type is a choice.
					options?: [...string] & [_, ...]
				}}
			}
			...
		}

		// This event occurs when a workflow run is requested or
		// completed, and allows you to execute a workflow based on the
		// finished result of another workflow. For example, if your
		// pull_request workflow generates build artifacts, you can
		// create a new workflow that uses workflow_run to analyze the
		// results and add a comment to the original pull request.
		workflow_run?: #eventObject & (null | bool | number | string | [...] | {
			types?: #types & (null | bool | number | string | [..."requested" | "completed" | "in_progress"] | {
				...
			}) | *["requested", "completed"]
			workflows?: [...string] & [_, ...]

			{[=~"^branches(-ignore)?$" & !~"^(types|workflows)$"]: _}
			...
		})

		// You can use the GitHub API to trigger a webhook event called
		// repository_dispatch when you want to trigger a workflow for
		// activity that happens outside of GitHub. For more information,
		// see
		// https://developer.github.com/v3/repos/#create-a-repository-dispatch-event.
		// To trigger the custom repository_dispatch webhook event, you
		// must send a POST request to a GitHub API endpoint and provide
		// an event_type name to describe the activity type. To trigger a
		// workflow run, you must also configure your workflow to use the
		// repository_dispatch event.
		repository_dispatch?: #eventObject

		// You can schedule a workflow to run at specific UTC times using
		// POSIX cron syntax
		// (https://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html#tag_20_25_07).
		// Scheduled workflows run on the latest commit on the default or
		// base branch. The shortest interval you can run scheduled
		// workflows is once every 5 minutes.
		// Note: GitHub Actions does not support the non-standard syntax
		// @yearly, @monthly, @weekly, @daily, @hourly, and @reboot.
		// You can use crontab guru (https://crontab.guru/). to help
		// generate your cron syntax and confirm what time it will run.
		// To help you get started, there is also a list of crontab guru
		// examples (https://crontab.guru/examples.html).
		schedule?: [...null | bool | number | string | [...] | {
			cron?: string
		}] & [_, ...]
	}])

	// A map of environment variables that are available to all jobs
	// and steps in the workflow.
	env?: #env

	// A map of default settings that will apply to all jobs in the
	// workflow.
	defaults?: #defaults

	// Concurrency ensures that only a single job or workflow using
	// the same concurrency group will run at a time. A concurrency
	// group can be any string or expression. The expression can use
	// any context except for the secrets context.
	// You can also specify concurrency at the workflow level.
	// When a concurrent job or workflow is queued, if another job or
	// workflow using the same concurrency group in the repository is
	// in progress, the queued job or workflow will be pending. Any
	// previously pending job or workflow in the concurrency group
	// will be canceled. To also cancel any currently running job or
	// workflow in the same concurrency group, specify
	// cancel-in-progress: true.
	concurrency?: matchN(1, [string, #concurrency])

	// A workflow run is made up of one or more jobs. Jobs run in
	// parallel by default. To run jobs sequentially, you can define
	// dependencies on other jobs using the jobs.<job_id>.needs
	// keyword.
	// Each job runs in a fresh instance of the virtual environment
	// specified by runs-on.
	// You can run an unlimited number of jobs as long as you are
	// within the workflow usage limits. For more information, see
	// https://help.github.com/en/github/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions#usage-limits.
	jobs!: {
		{[=~"^[_a-zA-Z][a-zA-Z0-9_-]*$" & !~"^()$"]: matchN(1, [#normalJob, #reusableWorkflowCallJob])}
	}

	// The name for workflow runs generated from the workflow. GitHub
	// displays the workflow run name in the list of workflow runs on
	// your repository's 'Actions' tab.
	"run-name"?:  string
	permissions?: #permissions

	#architecture: "ARM32" | "x64" | "x86"

	#branch: #globs

	#concurrency: {
		// When a concurrent job or workflow is queued, if another job or
		// workflow using the same concurrency group in the repository is
		// in progress, the queued job or workflow will be pending. Any
		// previously pending job or workflow in the concurrency group
		// will be canceled.
		group!: string

		// To cancel any currently running job or workflow in the same
		// concurrency group, specify cancel-in-progress: true.
		"cancel-in-progress"?: matchN(1, [bool, #expressionSyntax])
	}

	#configuration: matchN(1, [string, number, bool, {
		[string]: #configuration
	}, [...#configuration]])

	#container: {
		// The Docker image to use as the container to run the action. The
		// value can be the Docker Hub image name or a registry name.
		image!: string

		// If the image's container registry requires authentication to
		// pull the image, you can use credentials to set a map of the
		// username and password. The credentials are the same values
		// that you would provide to the `docker login` command.
		credentials?: {
			username?: string
			password?: string
			...
		}

		// Sets an array of environment variables in the container.
		env?: #env

		// Sets an array of ports to expose on the container.
		ports?: [...number | string] & [_, ...]

		// Sets an array of volumes for the container to use. You can use
		// volumes to share data between services or other steps in a
		// job. You can specify named Docker volumes, anonymous Docker
		// volumes, or bind mounts on the host.
		// To specify a volume, you specify the source and destination
		// path: <source>:<destinationPath>
		// The <source> is a volume name or an absolute path on the host
		// machine, and <destinationPath> is an absolute path in the
		// container.
		volumes?: [...=~"^[^:]+:[^:]+$"] & [_, ...]

		// Additional Docker container resource options. For a list of
		// options, see
		// https://docs.docker.com/engine/reference/commandline/create/#options.
		options?: string
	}

	#defaults: run?: {
		shell?:               #shell
		"working-directory"?: #["working-directory"]
	}

	#permissions: matchN(1, ["read-all" | "write-all", #["permissions-event"]])

	#: "permissions-event": {
		actions?:               #["permissions-level"]
		attestations?:          #["permissions-level"]
		checks?:                #["permissions-level"]
		contents?:              #["permissions-level"]
		deployments?:           #["permissions-level"]
		discussions?:           #["permissions-level"]
		"id-token"?:            #["permissions-level"]
		issues?:                #["permissions-level"]
		packages?:              #["permissions-level"]
		pages?:                 #["permissions-level"]
		"pull-requests"?:       #["permissions-level"]
		"repository-projects"?: #["permissions-level"]
		"security-events"?:     #["permissions-level"]
		statuses?:              #["permissions-level"]
	}

	#: "permissions-level": "read" | "write" | "none"

	#env: matchN(1, [{
		[string]: bool | number | string
	}, #stringContainingExpressionSyntax])

	#environment: {
		// The name of the environment configured in the repo.
		name!: string

		// A deployment URL
		url?: string
	}

	#event: "branch_protection_rule" | "check_run" | "check_suite" | "create" | "delete" | "deployment" | "deployment_status" | "discussion" | "discussion_comment" | "fork" | "gollum" | "issue_comment" | "issues" | "label" | "merge_group" | "milestone" | "page_build" | "project" | "project_card" | "project_column" | "public" | "pull_request" | "pull_request_review" | "pull_request_review_comment" | "pull_request_target" | "push" | "registry_package" | "release" | "status" | "watch" | "workflow_call" | "workflow_dispatch" | "workflow_run" | "repository_dispatch"

	#eventObject: null | {
		...
	}

	#expressionSyntax: =~"""
		^\\$\\{\\{(.|[\r
		])*\\}\\}$
		"""

	#stringContainingExpressionSyntax: =~"""
		^.*\\$\\{\\{(.|[\r
		])*\\}\\}.*$
		"""

	#globs: [...strings.MinRunes(1)] & [_, ...]

	#machine: "linux" | "macos" | "windows"

	#name: =~"^[_a-zA-Z][a-zA-Z0-9_-]*$"

	#path: #globs

	#ref: null | {
		branches?:          #branch
		"branches-ignore"?: #branch
		tags?:              #branch
		"tags-ignore"?:     #branch
		paths?:             #path
		"paths-ignore"?:    #path
		...
	}

	#shell: matchN(>=1, [string, "bash" | "pwsh" | "python" | "sh" | "cmd" | "powershell"])

	#types: [_, ...]

	#: "working-directory": string

	#jobNeeds: matchN(1, [[...#name] & [_, ...], #name])

	#matrix: matchN(1, [{
		{[=~"^(in|ex)clude$" & !~"^()$"]: matchN(1, [#expressionSyntax, [...{
			[string]: #configuration
		}] & [_, ...]])
		}
		{[!~"^(in|ex)clude$" & !~"^()$"]: matchN(1, [[...#configuration] & [_, ...], #expressionSyntax])}
	}, #expressionSyntax])

	#reusableWorkflowCallJob: {
		// The name of the job displayed on GitHub.
		name?:        string
		needs?:       #jobNeeds
		permissions?: #permissions

		// You can use the if conditional to prevent a job from running
		// unless a condition is met. You can use any supported context
		// and expression to create a conditional.
		// Expressions in an if conditional do not require the ${{ }}
		// syntax. For more information, see
		// https://help.github.com/en/articles/contexts-and-expression-syntax-for-github-actions.
		if?: bool | number | string

		// The location and version of a reusable workflow file to run as
		// a job, of the form './{path/to}/{localfile}.yml' or
		// '{owner}/{repo}/{path}/{filename}@{ref}'. {ref} can be a SHA,
		// a release tag, or a branch name. Using the commit SHA is the
		// safest for stability and security.
		uses!: =~"^(.+/)+(.+)\\.(ya?ml)(@.+)?$"

		// A map of inputs that are passed to the called workflow. Any
		// inputs that you pass must match the input specifications
		// defined in the called workflow. Unlike
		// 'jobs.<job_id>.steps[*].with', the inputs you pass with
		// 'jobs.<job_id>.with' are not be available as environment
		// variables in the called workflow. Instead, you can reference
		// the inputs by using the inputs context.
		with?: #env

		// When a job is used to call a reusable workflow, you can use
		// 'secrets' to provide a map of secrets that are passed to the
		// called workflow. Any secrets that you pass must match the
		// names defined in the called workflow.
		secrets?: matchN(1, [#env, "inherit"])

		// A strategy creates a build matrix for your jobs. You can define
		// different variations of an environment to run each job in.
		strategy?: {
			matrix!: #matrix

			// When set to true, GitHub cancels all in-progress jobs if any
			// matrix job fails. Default: true
			"fail-fast"?: bool | string | *true

			// The maximum number of jobs that can run simultaneously when
			// using a matrix job strategy. By default, GitHub will maximize
			// the number of jobs run in parallel depending on the available
			// runners on GitHub-hosted virtual machines.
			"max-parallel"?: number | string
		}

		// Concurrency ensures that only a single job or workflow using
		// the same concurrency group will run at a time. A concurrency
		// group can be any string or expression. The expression can use
		// any context except for the secrets context.
		// You can also specify concurrency at the workflow level.
		// When a concurrent job or workflow is queued, if another job or
		// workflow using the same concurrency group in the repository is
		// in progress, the queued job or workflow will be pending. Any
		// previously pending job or workflow in the concurrency group
		// will be canceled. To also cancel any currently running job or
		// workflow in the same concurrency group, specify
		// cancel-in-progress: true.
		concurrency?: matchN(1, [string, #concurrency])
	}

	#normalJob: {
		// The name of the job displayed on GitHub.
		name?:        string
		needs?:       #jobNeeds
		permissions?: #permissions

		// The type of machine to run the job on. The machine can be
		// either a GitHub-hosted runner, or a self-hosted runner.
		"runs-on"!: matchN(>=1, [string, matchN(>=1, [[string] & [_, ...]]), {
			group?: string
			labels?: matchN(1, [string, [...string]])
			...
		}, #stringContainingExpressionSyntax, #expressionSyntax])

		// The environment that the job references.
		environment?: matchN(1, [string, #environment])

		// A map of outputs for a job. Job outputs are available to all
		// downstream jobs that depend on this job.
		outputs?: {
			[string]: string
		}

		// A map of environment variables that are available to all steps
		// in the job.
		env?: #env

		// A map of default settings that will apply to all steps in the
		// job.
		defaults?: #defaults

		// You can use the if conditional to prevent a job from running
		// unless a condition is met. You can use any supported context
		// and expression to create a conditional.
		// Expressions in an if conditional do not require the ${{ }}
		// syntax. For more information, see
		// https://help.github.com/en/articles/contexts-and-expression-syntax-for-github-actions.
		if?: bool | number | string

		// A job contains a sequence of tasks called steps. Steps can run
		// commands, run setup tasks, or run an action in your
		// repository, a public repository, or an action published in a
		// Docker registry. Not all steps run actions, but all actions
		// run as a step. Each step runs in its own process in the
		// virtual environment and has access to the workspace and
		// filesystem. Because steps run in their own process, changes to
		// environment variables are not preserved between steps. GitHub
		// provides built-in steps to set up and complete a job.
		// Must contain either `uses` or `run`
		steps?: [...matchN(2, [matchN(1, [{
			uses!: string
			...
		}, {
			run!: string
			...
		}]), {
			// A unique identifier for the step. You can use the id to
			// reference the step in contexts. For more information, see
			// https://help.github.com/en/articles/contexts-and-expression-syntax-for-github-actions.
			id?: string

			// You can use the if conditional to prevent a step from running
			// unless a condition is met. You can use any supported context
			// and expression to create a conditional.
			// Expressions in an if conditional do not require the ${{ }}
			// syntax. For more information, see
			// https://help.github.com/en/articles/contexts-and-expression-syntax-for-github-actions.
			if?: bool | number | string

			// A name for your step to display on GitHub.
			name?: string

			// Selects an action to run as part of a step in your job. An
			// action is a reusable unit of code. You can use an action
			// defined in the same repository as the workflow, a public
			// repository, or in a published Docker container image
			// (https://hub.docker.com/).
			// We strongly recommend that you include the version of the
			// action you are using by specifying a Git ref, SHA, or Docker
			// tag number. If you don't specify a version, it could break
			// your workflows or cause unexpected behavior when the action
			// owner publishes an update.
			// - Using the commit SHA of a released action version is the
			// safest for stability and security.
			// - Using the specific major action version allows you to receive
			// critical fixes and security patches while still maintaining
			// compatibility. It also assures that your workflow should still
			// work.
			// - Using the master branch of an action may be convenient, but
			// if someone releases a new major version with a breaking
			// change, your workflow could break.
			// Some actions require inputs that you must set using the with
			// keyword. Review the action's README file to determine the
			// inputs required.
			// Actions are either JavaScript files or Docker containers. If
			// the action you're using is a Docker container you must run the
			// job in a Linux virtual environment. For more details, see
			// https://help.github.com/en/articles/virtual-environments-for-github-actions.
			uses?: string

			// Runs command-line programs using the operating system's shell.
			// If you do not provide a name, the step name will default to
			// the text specified in the run command.
			// Commands run using non-login shells by default. You can choose
			// a different shell and customize the shell used to run
			// commands. For more information, see
			// https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions#using-a-specific-shell.
			// Each run keyword represents a new process and shell in the
			// virtual environment. When you provide multi-line commands,
			// each line runs in the same shell.
			run?:                 string
			"working-directory"?: #["working-directory"]
			shell?:               #shell

			// A map of the input parameters defined by the action. Each input
			// parameter is a key/value pair. Input parameters are set as
			// environment variables. The variable is prefixed with INPUT_
			// and converted to upper case.
			with?: #env & (null | bool | number | string | [...] | {
				args?:       string
				entrypoint?: string
				...
			})

			// Sets environment variables for steps to use in the virtual
			// environment. You can also set environment variables for the
			// entire workflow or a job.
			env?: #env

			// Prevents a job from failing when a step fails. Set to true to
			// allow a job to pass when this step fails.
			"continue-on-error"?: matchN(1, [bool, #expressionSyntax]) | *false

			// The maximum number of minutes to run the step before killing
			// the process.
			"timeout-minutes"?: matchN(1, [number, #expressionSyntax])
		}])] & [_, ...]

		// The maximum number of minutes to let a workflow run before
		// GitHub automatically cancels it. Default: 360
		"timeout-minutes"?: matchN(1, [number, #expressionSyntax]) | *360

		// A strategy creates a build matrix for your jobs. You can define
		// different variations of an environment to run each job in.
		strategy?: {
			matrix!: #matrix

			// When set to true, GitHub cancels all in-progress jobs if any
			// matrix job fails. Default: true
			"fail-fast"?: bool | string | *true

			// The maximum number of jobs that can run simultaneously when
			// using a matrix job strategy. By default, GitHub will maximize
			// the number of jobs run in parallel depending on the available
			// runners on GitHub-hosted virtual machines.
			"max-parallel"?: number | string
		}

		// Prevents a workflow run from failing when a job fails. Set to
		// true to allow a workflow run to pass when this job fails.
		"continue-on-error"?: matchN(1, [bool, #expressionSyntax])

		// A container to run any steps in a job that don't already
		// specify a container. If you have steps that use both script
		// and container actions, the container actions will run as
		// sibling containers on the same network with the same volume
		// mounts.
		// If you do not set a container, all steps will run directly on
		// the host specified by runs-on unless a step refers to an
		// action configured to run in a container.
		container?: matchN(1, [string, #container])

		// Additional containers to host services for a job in a workflow.
		// These are useful for creating databases or cache services like
		// redis. The runner on the virtual machine will automatically
		// create a network and manage the life cycle of the service
		// containers.
		// When you use a service container for a job or your step uses
		// container actions, you don't need to set port information to
		// access the service. Docker automatically exposes all ports
		// between containers on the same network.
		// When both the job and the action run in a container, you can
		// directly reference the container by its hostname. The hostname
		// is automatically mapped to the service name.
		// When a step does not use a container action, you must access
		// the service using localhost and bind the ports.
		services?: {
			[string]: #container
		}

		// Concurrency ensures that only a single job or workflow using
		// the same concurrency group will run at a time. A concurrency
		// group can be any string or expression. The expression can use
		// any context except for the secrets context.
		// You can also specify concurrency at the workflow level.
		// When a concurrent job or workflow is queued, if another job or
		// workflow using the same concurrency group in the repository is
		// in progress, the queued job or workflow will be pending. Any
		// previously pending job or workflow in the concurrency group
		// will be canceled. To also cancel any currently running job or
		// workflow in the same concurrency group, specify
		// cancel-in-progress: true.
		concurrency?: matchN(1, [string, #concurrency])
	}
}
