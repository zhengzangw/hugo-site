---
title: 4. Job Control
date: 2020-03-17
weight: 4
---

## Jobs Control

```sh
sleep 20 # seconds
man signal
#ctrl+c SIGINT
#ctrl+\ SIGQUIT
#ctrl+z SIGSTOP
nohup ./run.sh &
jobs # show jobs background
bg %1 # continue to run
fg %2
kill -STOP %1
kill -HUP %1
kill -KILL %2
```

### C signal

```C++
#include <signal.h>
#include <stdint.h>
void signal_callback_handler(int signum) {
  printf("         TERMINATED         \n");
  setBufferedInput(true);
  printf("\033[?25h\033[m");
  exit(signum);
}
int main(){
  signal(SIGINT, signal_callback_handler);
}
```

### Python signal

```python
#!/usr/bin/env python
import signal, time
def handler(signum, time):
	print("\nI got a SIGINT, but I am not stopping")

signal.signal(signal.SIGINT, handler)
i = 0
while True:
	time.sleep(.1)
	print("\r{}".format(i), end="")
	i+=1
```

## Multiplexes

```sh
tmux # Sessions - Windows - Panes
tmux ls
```

## Remote

```sh
ssh-keygen
ssh-copy-id -i .ssh/id_rsa.pub zzw@example
ssh zzw@example ls -a
scp notes.md zzw@example:~/notes.md
rsync -avP SRC [USER@]host:DEST
```

## System Deamon

- `systemd` on Linux
- `launchd` on Macos
- `sysctl`
- `lauchctl`
