# Testing a local deployment on the internet

Sometimes it becomes needed to test some local code on a public webserver's
interface (for instance, if you get callbacks to a URL).

This is doable with port forwarding over SSH. For instance, to forward my local
Django server to one of my VPS' ports (port 2222), you can use the following
bit of ssh:

    ssh -N -R metatron.pault.ag:2222:localhost:8000 tag@metatron.pault.ag -v -g

Of course, replace `metatron.pault.ag` and `tag@` with the correct server and
user account.
