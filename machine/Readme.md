# Machine
This focuses on setup/configuring on developer machines so it's more convenient for development process

## Keep track of processes
- Needs a real-time dashboard / process table to continously monitor process.
    - Windows: Task Manager, Process Explorer, Process Hacker
    - Linux & Macos: top, htop

- With htop, use Filter to keep track specific processes. Eventhough, htop is a cli tool, it's still interactive & very user-friendly.
- Another method (not good practice but fun to try) is combining `watch` & `ps aux`. The `watch` tool provides the result of a command in real-time manner. 
    - E.g.: get vscode info realtime with `watch "ps aux | grep vscode"`

- References: 
    - Quick cheat sheet: https://cheat.sh/htop