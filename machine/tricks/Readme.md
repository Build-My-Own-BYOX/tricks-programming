# Machine > Tricks

## Keep track of processes
- Needs a real-time dashboard / process table to continously monitor process.
    - Windows: Task Manager, Process Explorer, Process Hacker
    - Linux & MacOS: top, htop

- With htop, use Filter to keep track specific processes. Eventhough, htop is a cli tool, it's still interactive & very user-friendly.
- Another method (not good practice but fun to try) is combining `watch` & `ps aux`. The `watch` tool provides the result of a command in real-time manner. 
    - E.g.: get vscode info realtime with `watch "ps aux | grep vscode"`

- References: 
    - Quick cheat sheet: https://cheat.sh/htop

## Find process with multiple filters using ps command
- Use `ps | grep -E '<pattern1>|<pattern2>|...'`
- E.g.: Command `ps | grep -E 'sleep|84452'` will looks for results that contain `sleep` or `84452`

# TODO
- setup alias file for MacOS: setup `ps aux | head -n1; ps aux | grep -E '<name>|<PID>'`