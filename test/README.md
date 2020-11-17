# Tests

This folder contains the tests for the modules in this repo.

## Running the tests locally

**Note #1**: Many of these tests create real resources in an AWS account. That means they cost money to run, especially
if you don't clean up after yourself. Please be considerate of the resources you create and take extra care to clean
everything up when you're done!

**Note #2**: Never hit `CTRL + C` or cancel a build once tests are running or the cleanup tasks won't run!

**Note #3**: We set `-timeout 45m` on all tests not because they necessarily take 45 minutes, but because Go has a
default test timeout of 10 minutes, after which it does a `SIGQUIT`, preventing the tests from properly cleaning up
after themselves. Therefore, we set a timeout of 45 minutes to make sure all tests have enough time to finish and
cleanup.

#### Prerequisites

- Install the latest version of [Go](https://golang.org/).
- Install [Terraform](https://www.terraform.io/downloads.html).
- Add your AWS credentials as environment variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`
- For some of the tests, you also need to set the `GITHUB_OAUTH_TOKEN` environment variable to a valid GitHub
  auth token with "repo" access. You can generate one here: https://github.com/settings/tokens

#### Run all the tests

The tests in this repo are split into two types:

- Tests related to account setup (`landingzone` folder)
- Everything else (`security` folder)

You can run the tests for each package by going into the folder and calling `go test`. For example, to run the
`landingzone` tests:

```bash
cd test/landingzone
go test -v -timeout 45m -parallel 128
```

**Note**: Some of the tests need to run against the Gruntwork LZ Test AWS Organization root account. Therefore you will also
need to set the `AWS_ORGTEST_ACCESS_KEY_ID` and `AWS_ORGTEST_SECRET_ACCESS_KEY` environment variables. The logic that uses
these variables is in `landingzone/test_helpers.go`.


And to run the security tests:

```bash
cd test/security
go test -v -timeout 45m -parallel 128
```

#### Run a specific test

To run a specific test called `TestFoo`:

```bash
cd test/landingzone
go test -v -timeout 45m -parallel 128 -run TestFoo
```
