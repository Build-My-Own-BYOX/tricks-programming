# Machine > Troubleshooting

## Kill process does not work in Linux & MacOS
- First step to notice: you kill the process by pid or by name, BUT:
    - when use `ps aux` and grep by name or PID, you see that it is still there.
        - Except for for the case of zombie process, `grep <name>` will not show it because the its entry in `ps aux` results have changed to `<defunct>`

- Diagnose step: take a closer look at state of that process with 2 tools `ps` & `htop`
    - Method 1: Use `ps aux | head -n1; ps aux | grep -E '<name>|<PID>'` to know which state it is in.
        - The first part of the command `ps aux | head -n1` returns column names.
        - The second part of the command `ps aux | grep -E '<name>|<PID>` returns records having process name or PID.
        - The comma will combine results of these 2 commands.
        - After running this aggregated command, notice the strange value of the column `STAT`. Normal process will have state of `S` or `R`
    - Method 2: Use `htop` and filter the name of process. Notice the strange value of the column `STAT`

- Explanation: This unkillable process actually resides in the UNINTERRUPTABLE_SLEEP state, which make the process cannot be killed by `kill -9`. To this process, Kill Signal is only queued & only executed if it moves out of this state

- **Troubleshoot step**: Killing process depends on which state the process is in 
    - State `Z`: this is a zombie (aka defunct) process. It's process descriptor stays in memory UNTIL:
        - Parent process execute wait() system call to read exit status from this zombie process -> handle this nicely in code
        - OR its parent also dies -> find the parent & kill it
    - State `T`: Use `fg` to restore it to the background, and then `Ctrl + C`
        - Also, `kill -9` can be used to kill `T` zombie process
    - State `D`: reboot the system

- Quick reproduce: these steps below is only for experimenting to understand more about these situations & how to fix them
    - State `Z`: Process in this state must have been a child process -> take a look at this [snippet](./poc/create_zombie_proc.c)
    - State `T`: setup `sleep 300 &`, read the PID, and send stop signal to it by `kill -STOP <PID>`

- References: 
    - 5 linux process state: https://www.cbtnuggets.com/blog/certifications/open-source/what-are-the-5-linux-process-states
    - Process state codes: https://askubuntu.com/questions/360252/what-do-the-stat-column-values-in-ps-mean
    - Kill zombie (defunct) process in linux: https://www.linkedin.com/pulse/how-identify-kill-zombiedefunct-processes-linux-without-george-gabra/