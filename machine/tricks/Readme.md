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

## Run a command multiple times on terminal
- Create a bash file with the following codes
    ```bash
    #!/bin/bash 
    eval "for i in {1..$1}; do ($2 &); done"
    ```
    The first argument will be run occurence, and the second one is the executing command

- Add permission for that script so normal user can use it: `chmod +x dup.sh` (I name the bash script as dup.sh)
- Now, we can use this bash script as `./dup.sh 3 'echo 123'`. The result would be
    ```
    echo 123
    echo 123
    echo 123
    ```
- SUPER TRICK: add an alias for it
    ```
    alias dup='<absolute_path_of_dup.sh> $1 $2'
    ```
    For this alias to be callable from anywhere, we should use absolute path of the bash script. For instance, my script stays in `~/dup.sh`, so the alias would be
    ```
    alias dup='~/dup.sh $1 $2'
    ```
    Then, compile it with `source <profile_file>`, and now we're free to call `dup 3 'echo 123'`

# TODO
- setup alias file for MacOS: setup `ps aux | head -n1; ps aux | grep -E '<name>|<PID>'`