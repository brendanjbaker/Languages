# Wolfram

⚠️ The `hello` and `sum` programs work, but the Wolfram Engine can't be used without a license.

Therefore, a `.disable` file has been placed in this directory to prevent it from being included as part of "run everything."

The language can still be run manually, like so:

* `./languages.sh run wolfram`
* `./languages.sh run wolfram hello`

For it to work, you'll need to update `setup.sh` with your Wolfram credentials.

Once you have it working, you can optionlly delete the `.disable` file, so that this language will be included in the "run everything" routine.
