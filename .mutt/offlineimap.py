#!/usr/bin/python2
import subprocess, os

def mailpasswd(acct):
    acct = os.path.basename(acct)
    path = "/home/smd/.password.%s.gpg" % acct
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
