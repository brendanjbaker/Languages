# Xojo

Using official tooling from Xojo does not seem possible for the purposes of this
project, because:

⚠️ You cannot download Xojo tooling without an account.
⚠️ You cannot run Xojo code without using the IDE (GUI).
⚠️ You cannot build Xojo code without a license.

Therefore, this alternative implementation is used:

https://github.com/simulanics/XojoScript

I think it is missing functionality compared to "real" Xojo. For example, I
think the following program _should_ work, but it doesn't:

```
Project "Program.xojo_binary_project"
	Class App Inherits ConsoleApplication
		EventHandler Function Run(args() as String) As Integer
			StdOut.WriteLine("Hello, world!")
			Return 0
		End EventHandler
	End Class
End Project
```
