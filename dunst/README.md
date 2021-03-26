Run the following command:

```sh
sudo vim /usr/share/dbus-1/services/org.knopwob.dunst.service
```

and change
`Exec=/usr/bin/dunst`
to
`Exec=/usr/bin/dunst /home/etienne/.config/dunst/dunstrc`.

Then, copy and paste the `dunstrc` file to `~/.config/dunst/dunstrc`.

Log out and log in again.

Links:
```
https://github.com/dunst-project/dunst/blob/master/dunstrc
https://framagit.org/gagbo/dotfiles/blob/dd02a0c6f733deca71abb3ab354520dee3c55c63/dunst/.config/dunst/dunstrc
```
