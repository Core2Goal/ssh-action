# SSH for GitHub Actions
GitHub Action for remote command execution over SSH

## Inputs

| Input Name    | Description                                        | Default Value | Required           |
|---------------|----------------------------------------------------|---------------|--------------------|
| `host`        | Hostname or IP address of the remote server        |               | :heavy_check_mark: |
| `port`        | Port for SSH connection                            | `'22'`        | :heavy_check_mark: |
| `username`    | Username for SSH connection                        |               | :heavy_check_mark: |
| `password`    | Password for SSH connection                        |               |                    |
| `private_key` | Path to private key file for SSH connection        |               |                    |
| `timeout`     | Timeout in seconds for establishing SSH connection | `'120'`       |                    |
| `script`      | Commands to execute on remote server               |               | :heavy_check_mark: |

# Usage
## Workflow files
### Private Key
Example path: `.github/workflows/ssh.yml`
```yaml
name: 'SSH Action Test'
on: [push]

jobs:
  Deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: Core2Goal/ssh-action@main
        with:
          host: ${{ secrets.SSH_HOST }}
          port: ${{ secrets.SSH_PORT }}
          username: ${{ secrets.SSH_USERNAME }}
          private_key: ${{ secrets.SSH_PRIVATE_KEY }}
          script: |
            echo "Hello World"
```

### Password
Example path: `.github/workflows/ssh.yml`
```yaml
name: 'SSH Action Test'
on: [push]

jobs:
  Deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: Core2Goal/ssh-action@main
        with:
          host: ${{ secrets.SSH_HOST }}
          port: ${{ secrets.SSH_PORT }}
          username: ${{ secrets.SSH_USERNAME }}
          password: ${{ secrets.SSH_PASSWORD }}
          script: |
            echo "Hello World"
```

# PR, Issues, Contributing
If you want to help us to develop that action, feel free to open PRs, report bugs, suggest new features or improve existing code. Anything you would like to add or improve can be done by submitting PRs, Issues or by contacting us (email on the organization home page). Thank you in advance. Together, let's help other developers. :)
