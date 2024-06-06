# Online Judge Deploy Setting

Main modules are available below:

+ Backend(Django): [https://github.com/dAiv-CNU/OnlineJudge](https://github.com/dAiv-CNU/OnlineJudge)
+ Frontend(Vue): [https://github.com/dAiv-CNU/OnlineJudgeFE](https://github.com/dAiv-CNU/OnlineJudgeFE)
+ Judger Sandbox(Seccomp): [https://github.com/dAiv-CNU/Judger](https://github.com/dAiv-CNU/Judger)
+ JudgeServer(A wrapper for Judger): [https://github.com/dAiv-CNU/JudgeServer](https://github.com/dAiv-CNU/JudgeServer)


## Environmental preparation (Linux)

+ System: Ubuntu 18.04 LTS

1. Install the necessary dependencies

    ```bash
    sudo apt-get update
    sudo apt-get install -y vim python3-pip curl git
    sudo pip3 install --upgrade pip
    sudo pip3 install docker-compose
    ```

2. Install Docker

    Install using script: `sudo curl -sSL get.docker.com | sh`

    Other installation methods: [https://docs.docker.com/install/](https://docs.docker.com/install/)

## Install

1. Please select a location with some surplus disk space and run the following command:

    ```bash
    git clone -b 2.0 https://github.com/dAiv-CNU/OnlineJudgeDeploy.git deploy
    sudo ln -rs deploy ./Desktop/deploy
    cd deploy
    git clone https://github.com/dAiv-CNU/OnlineJudge.git backend
    ```

2. Build custom docker images

    ```bash
    sudo docker buildx build ./backend -t oj-image/backend --load
    ```

3. Start service containers

    ```bash
    sudo docker compose up -d
    ```

4. Check status

    ```bash
    sudo docker ps -a
    ```


According to the network speed, the setup can be completed automatically in about 5 to 30 minutes without manual intervention.

Wait for the command execution to complete, and then run `docker ps -a`. When you see that the status of all the containers does not have `unhealthy` or `Exited (x) xxx`, it means OnlineJudge has started successfully.

Access the server's HTTP 80 port or HTTPS 443 port through a browser, and you can start using it. The background management path is `/admin`, the super administrator user name automatically added during the installation process is `root`, and the password is `rootroot`. **If you log in successfully, please change your account password immediately.**.

Don't forget to read the documentation: http://opensource.qduoj.com/


## SSL Configuration

1. Generate SSL certificate

    ```bash
    sudo apt-get install -y certbot
    sudo certbot certonly --standalone -d your_domain
    ```

## Uninstall

1. Stop service containers

    ```bash
    sudo docker compose down
    ```

2. Delete all docker containers and images

    ```bash
   sudo docker stop $(sudo docker ps -a -q)
   sudo docker rm $(sudo docker ps -a -q)
   sudo docker rmi $(sudo docker images -q)
    ```
