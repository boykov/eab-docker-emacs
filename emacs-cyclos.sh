docker run \
-e UNAME="eab" \
-e GNAME="eab" \
-e UID="1000" \
-e GID="1000" \
-e UHOME="/home/eab" \
-e LANG="ru_RU.UTF-8" \
-e LC_ALL="en_US.UTF-8" \
-e TZ="Asia/Vladivostok" \
-v $('pwd'):/mnt/workspace \
-v /home/eab/.emacs.d:/home/eab/.emacs.d \
-v /etc/localtime:/etc/localtime:ro \
-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
--device /dev/console:/dev/console:rw \
--privileged \
-h emacs-cyclos \
--name eab-emacs-cyclos \
 eab-emacs28