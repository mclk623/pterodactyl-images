#!/bin/bash
cd /home/container
# 修改变量
MODIFIED_STARTUP=$(echo $(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
START_COMMAND=$(echo -e ${MODIFIED_STARTUP})
echo -e ":/home/container$ ${START_COMMAND}"
export JAVA_HOME=/usr/local/dragonwell17/dragonwell-17.0.3.0.3+7-GA
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export  PATH=$PATH:$JAVA_HOME/bin
#显示JAVA版本
java -version
# 启动服务器
${MODIFIED_STARTUP}
