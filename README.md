# What is venv?

venv (short for virtualenv) is a very basic function designed to assist in
managing virtualenv environments for a developer.  The script is designed
to be sourced in as part of the user's bash profile.

	Last login: Fri May 11 20:27:56 on ttys002
	Stevens-MacBook-Air:~ steve$ venv create test1
	New python executable in /Users/steve/.virtualenvs/test1/bin/python
	Installing setuptools............done.
	Installing pip...............done.
	Stevens-MacBook-Air:~ steve$ venv activate test1
	(test1)Stevens-MacBook-Air:~ steve$ venv delete test1
	Stevens-MacBook-Air:~ steve$ venv list
	brack	sc4
	Stevens-MacBook-Air:~ steve$ 