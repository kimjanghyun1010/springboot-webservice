#!/usr/bin/env bash

# 쉬고 있는 프로파일 찾기
function find_idle_profile()
{
	RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/profile)
	
	if [ ${RESPONSE_CODE} -ge 400 ]
 	then
 		CURRENT_PROFILE=real2
 	else
 		CURRENT_PROFILE=$(curl -s http://localhost/profile)
 	fi
 	
 	if [ ${CURRENT_PROFILE} == real1 ]
 	then
 		IDLE_PROFILE=real2
 	else
 		IDLE_PROFILE=real1
 	fi
 	
 	echo "${IDLE_PROFILE}"
}

# 쉬고 있는 포트 검색
function find_idle_port()
{
	IDLE_PROFILE=$(find_idle_profile)
	
	if [ ${IDLE_PROFILE} == real1 ]
	then
		echo "8081"
		echo "> profile8081_find_idle_port : ${find_idle_profile}"
	else
		echo "8082"
		echo "> profile8082_find_idle_port : ${find_idle_profile}"
	fi
}
