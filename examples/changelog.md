# Changelog

## Master Branch -- Untagged

(Install with `$ brew install --head doormat-cli` or build locally with `$ make build`)

_Features not on a tagged version are considered to be in a testing phase. No Support/SLA for these._

## Released Versions

### v3.1.1 - Bug fixes
* Fix - doormat `login` and doormat `update`

### v3.1.0 - Ringing in the New Year with a new and improved Doormat

* Feature - Auto-update
  * You can now update Doormat ... from Doormat!
* Feature - Azure CLI support 
  * You can now use the Doormat CLI to interact with MS Azure (for subscriptions created through Doormat)
* Rework - Move flags to commands
  * Old functionality is NOT deprecated
* Fix - Push AWS creds to TFC/E
  * We are now looking in the correct place for the Terraform default directory on Windows
* Feature - Add linux_arm64 build of session manager plugin
* Feature - Open the AWS console in the region of your choice (from the CLI)
* Feature - Allow pass arbitrary `ssh` arguments in `doormat session`
* Feature - Run Doormat cred server as an [AWS external credential process](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sourcing-external.html)

Check out the [Doormat CLI docs](https://docs.prod.secops.hashicorp.services/doormat/cli/) for more details...

### v3.0.1 - Bug Fix

* Bug fix for `doormat session` when passing in an instance ID in the `--target` flag.
* Default TF hostname to `app.terraform.io` (TFC)

### v3.0 - Doormat Session Enhancements

* The `AWS_SESSION_EXPIRATION` value returned by `doormat aws` is now RFC3339 string format.
* `doormat session` instance enumeration is moved to the Doormat backend.
* Improved formatting of `doormat session` instance selection display.
* Add clear error message for when there are no instances in a targeted account/region.

### v2.10 - Feature Fiesta!

* Now you can run `doormat cred-server` in a docker container!
  * Local Nomad playing in S3 anyone?
* New `--tf-local` flag to auto-determine TFC/E hostname, organization, and workspace values from a local, initialized TF directory
  * Makes the `--tf-push` option semi-automatic!
* `session` support for M1 (Apple Silicon) chipset.

### v2.9 - Credential Expiry Bugfix

* Bugfix on `AWS_SESSION_EXPIRATION` for `stdout` creds and `Expiration` in `cred-server` creds.

### v2.8 - Cred Server Mode!

* rebrand ECS mode to not confuse people

### v2.7 - ECS Mode!

* Support ECS mode to make credential management locally easier
* Support --break-glass flag to use local credentials for Doormat Session for break glass scenarios

### v2.6 - Windows and Linux Builds

### v2.5 - Enhanced Doormat Session

* Support --ssh to gain a native shell if using the base AMI
* Enhanced error message if you do not have a valid Doormat auth token

### v2.4 - Doormat Session

* Shell access to instances via `session` command (uses AWS SSM Session Manager).
* Support for non-default browser via ENV VAR `DOORMAT_URL_HANDLER_ARGS`.

### v2.3 - Support pushing to multiple TFC/E workspaces at once

* Now supports pushing to multiple workspaces via comma delimited workspace names

### v2.2 - Bugfix for TFC/E Creds

* Incorrect TFC/E Environment Variable Name ([#23](https://github.com/hashicorp/doormat-cli/issues/23))

### v2.1 - Console Support and TFC Creds

* Add the ability to launch the console from the CLI
* Support pushing credentials to a Terraform Workspace (Default TFC)
* zsh completion fix

### v2.0 - New CLI Syntax with Sub Commands

* Refactor the CLI to move away from Flags
* Refactor the CLI syntax to support future additions to doormat like new cloud providers, sessions, etc

### v1.2

* Adds exporting `AWS_SESSION_EXPIRATION` to be able to track AWS credential expiration
* Updates wording around `smoke-test` to make it known this checks the Doormat auth token
* Adds ability to write credentials to `~/.aws/credentials` file

### v1.1

* Adds ability to check the version of CLI supported and available on `doormat -refresh` to help with upgrade UX

### Initial Release - v1.0

* Initial release of Doormat CLI
  * Supports getting an auth token to ask for CLI credentials for AWS
  * Supports printing out an export statement for creds
