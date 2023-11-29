# Environment > Tricks

1. Create an .env sample file from .env file
- Use command in linux and macos
    ```
    sed 's/=.*/=/' .env > .env.example
    ```
- Reference: https://github.com/motdotla/dotenv/issues/119#issuecomment-172914309

2. Get new value of Environment Variables immediately for Windows
- Reason: when setting new environment variables/path, the current terminal will not know if there were new changes to update new values
- Solution: 
    - Quickiest solution: create new terminal session. The new session will obtain new values
    - SUPER TIPS: use an utility script to refresh the env in the current terminal session
        - Step 1: write a new file `refreshenv.cmd` with content as in [here](./scripts/refreshenv.cmd)
        - Step 2: add path of this script to `Path` variable in the `System variables` & `User variables` (System > About > Advanced system settings > System Properties > Advanced > Environment Variables)
        - Step 3: the script is ready to be run on new sessions from now on. To run the script, simply run `refreshenv.cmd`

- References: 
    - content of `refreshenv.cmd`: https://github.com/chocolatey/choco/blob/master/src/chocolatey.resources/redirects/RefreshEnv.cmd