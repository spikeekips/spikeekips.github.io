################################################################################
projectkk 스트레스 테스트용 로봇
################################################################################


                                    last updated at Wed Jun 25 15:55:26 KST 2014
                                   written by Spike^ekipS <spikeekips@gmail.com>



간단한 설명
################################################################################

``robot`` 은 projectkk 게임 서버의 성능을 측정하기 위한 도구입니다. Linux, MacOS
환경에서, 간단하게 command line에서 실행할 수 있습니다.

이 문서에서는 현재, Wed Jun 25 15:12:33 KST 2014, 운영툴이 설치된 서버에
설치하고 실행하는 과정을 설명합니다.

주의 ::

    실제 게임서버에는 절대 테스트해서는 안됩니다. :)


설치하는 법
################################################################################

기본적으로 `projectkk` 운영툴을 운영할 수 있는 환경이어야 합니다. 운영툴 환경을
만들기 위해서는 이미 전달해드린, 운영툴 설치 문서를 참고하세요.

미리 전달받은 `projectkk.robot` 소스를 준비합니다. ::

    $ cd /home/manage/service/manage
    $ source activate

::
    $ cd /home/manage/service/manage/src/
    $ mkdir robot
    $ cd robot
    $ tar zxf <robot source>.tar.gz
    $ cd robot
    $ python setup.py install


이제 실행해봅니다. ::

    $ cd /home/manage/service/manage/
    $ robot

    $ robot -h
    usage: robot [-h] --server-addr SERVER_ADDR [--number-to-run N]
                 [--number-of-clients N] [--csv CSV] [--store STORE]
                 [--loglevel {info,debug,error,warning,critical,notset}]
                 [--log LOG] [--fake] [-q]
                 scenario [scenario ...]

    projectkk: gameserver test robot.

    positional arguments:
      scenario               client benavior scenario, CSV file.

    optional arguments:
      -h, --help            show this help message and exit
      --server-addr SERVER_ADDR
                            server address, <host>:<port>
      --number-to-run N     how many times to repeat the scenario
      --number-of-clients N
                            number of clients
      --csv CSV             store results to CSV file
      --store STORE         store results to pickle file
      --loglevel {info,debug,error,warning,critical,notset}
                            log level
      --log LOG             log output file
      --fake
      -q, --quiet



옵션
################################################################################

`robot` 은 command line 에서 실행합니다. 옵션을 조정할 수 있습니다. ::

    $ robot -h
    usage: robot [-h] --server-addr SERVER_ADDR [--number-to-run N]
                 [--number-of-clients N] [--csv CSV] [--store STORE]
                 [--loglevel {info,debug,error,warning,critical,notset}]
                 [--log LOG] [--fake] [-q]
                 scenario [scenario ...]

    projectkk: gameserver test robot.

    positional arguments:
      scenario               client benavior scenario, CSV file.

    optional arguments:
      -h, --help            show this help message and exit
      --server-addr SERVER_ADDR
                            server address, <host>:<port>
      --number-to-run N     how many times to repeat the scenario
      --number-of-clients N
                            number of clients
      --csv CSV             store results to CSV file
      --store STORE         store results to pickle file
      --loglevel {info,debug,error,warning,critical,notset}
                            log level
      --log LOG             log output file
      --fake
      -q, --quiet


`scenario` ::

    `robot` 이 어떤 요청을 게임서버로 보낼지 담고 있는 CSV 형태의 파일을
    지정합니다. 자세한 내용은 아래에서 추가로 설명합니다.

`-h, --help` ::

    옵션 설명을 출력합니다.

`--server-addr` ::

    게임서버 주소를 <host>:<port> 형태로 지정합니다.

`--number-to-run` ::

    scenario를 몇번 반복할 지 지정합니다. 기본값은 1, 한번 입니다.

`--number-of-clients` ::

    테스트를 수행할 client 의 개수를 지정합니다. 기본값은 1, 하나입니다. 단,
    실행하는 운영체제의 제한으로 많은 수, 1000 개 이상을 지정할 경우, 문제가
    생길 수도 있습니다. 많은 수를 실행해야할 경우, 여러 머신에 개수를 분리해서
    운영할 필요가 있습니다.


`--csv` ::

    테스트 결과를 CSV 파일로 저장합니다. 자세한 내용은 아래에서 추가로 설명합니다.


`--loglevel` ::

    로그 메세지의 수준을 지정합니다. `info', `debug', `error', `warning',
    `critical', `notset' 중에 하나를 지정할 수 있습니다. 각각의 자세한 내용은,
    https://docs.python.org/2/howto/logging.html 을 찹고하세요.

    기본값은 기본적인 정보를 출력하는, `info` 입니다.

`--log` ::

    기본적으로 로그 메세지는 console로 출력됩니다. `--log` 옵션에 원하는 파일
    경로를 지정해서 로그 메세지를 파일로 저장할 수 있습니다.


실행
################################################################################

::

    $ cd /home/manage/service/manage/
    $ robot robot-test-scenario.csv --server-addr=14.63.196.129:15001 --number-to-run=2 --number-of-clients=20 --csv=/tmp/robot-result.csv --log=/tmp/robot-result.log

    = projectkk: gameserver test robot =============================================
                  tested at :       2014-06-25T15:12:56.611149
             server address :       14.63.196.129:15001
               elapsed time :       1.463093 seconds
    ********************************************************************************
        requests per second :      53.636584

         * time per request
                     - mean :       0.018644 seconds
                   - median :       0.010206 seconds
                      - min :       0.006897 seconds
                      - max :       1.009161 seconds
    ********************************************************************************
          complete requests :     120
            failed requests :       0
       time taken for tests :       2.237279
          total transferred :   34680 bytes
          number of clients :      20
          number of clients :      20 (colllected from result)
    --------------------------------------------------------------------------------
    percentage of the requests served within total time
                        10% :      36
                        20% :      49
                        30% :      32
                        40% :       0
                        50% :       0
                        60% :       0
                        70% :       0
                        80% :       0
                        90% :       0
                       100% :       3
    ================================================================================

위와 같은 내용을 결과로 출력합니다. 자세하게 내용을 살펴보겠습니다.

`tested at` ::

    테스트를 실행한 시각

`server address` ::

    테스트를 실행한 서버 주소

`elapsed time` ::

    테스트에 걸린 시간, 초

`requests per second` ::

    초당 게임서버로 보낸 요청 수

`time per request - mean` ::

    한 요청을 보내고 받는 데 걸린 평균 시간, 초

`time per request - median` ::

    한 요청을 보내고 받는 데 걸린 중간 시간

`time per request - min` ::

    한 요청을 보내고 받는 데 걸린 가장 적게 걸린 시간

`time per request - max` ::

    한 요청을 보내고 받는 데 걸린 가장 오래 걸린 시간

`complete requests` ::

    보낸 요청 수

`failed requests` ::

    보낸 요청 중 실패한 요청 수

`time taken for tests` ::

    요청을 보내고 받는 데 걸린 시간을 모두 합한 시간, 초

`total transferred` ::

    보낸 요청 데이터 값을 합한 값, 바이트

`number of clients` ::

    테스트에 참가한 client 수

`percentage of the requests served within total time` ::

    보낸 요청들을 시간대별로 보낸 요청 수, 10%는 처음 10% 대의 보낸 요청 수 단, 테스트 시간이 긴 경우에만 의미가 있습니다.


`scenario` 시나리오 작성하는 법
################################################################################

아래는 CSV 로 작성된 scenario 파일 예입니다. ::

    command,args,just once,desc,,
    user_info,"@member_no,",,,,
    char_list,@member_no,,,,
    char_data_list,,,,,


`command` ::

    보낼 요청의 command 이름, 보낼 수 있는 요청 command는 아래에서 설명합니다.


`args` ::

    요청에 필요한 인자들, 쉼표, `,` 로 분리해서 입력할 수 있습니다. member
    number 의 경우, 직접 숫자로 된 회원 번호, member number 를 지정할 수도 있습니다.
    그리고 `robot` 에서는 테스트를 위해서 임의의 member number를 `@member_no`
    로 지정할 수 있습니다. 이 경우, `robot` 이 만든 의의의 회원을 만들어서
    테스트합니다.


`just once` ::

    해당 요청을 테스트 과정에서 딱 한번만 실행해고 싶을 때, `1` 로 지정합니다.


`desc` ::

    간단한 설명을 추가할 수 있습니다.



결과물 CSV
################################################################################

`robot` 실행할 때, `--csv=filename` 옵션으로 결과를 CSV로 저장할 수 있습니다.
이 CSV 를 바탕으로 다양한 용도로 분석에 활용하시기 바랍니다.

이 내용은, ::

    ,time_started,name,elapsed_time,success,length,result,worker
    0,2014-06-25 15:12:55.487061,user_info,0.022392988204956055,success,313,0,PoolWorker-1
    1,2014-06-25 15:12:55.509679,char_list,0.011942148208618164,success,26,0,PoolWorker-1
    2,2014-06-25 15:12:55.521742,char_data_list,0.011330842971801758,success,528,0,PoolWorker-1
    3,2014-06-25 15:12:55.508854,user_info,0.012310028076171875,success,313,0,PoolWorker-5
    4,2014-06-25 15:12:55.521336,char_list,0.012040853500366211,success,26,0,PoolWorker-5
    ...

과 같습니다. `robot` 이 게임서버로 보낸 모든 요청들을, 요청 종류와 결과를 그대로 저장합니다. 각 column은,


`time_started` ::

    요청을 보낸 시각

`name` ::

    요청 이름. scenario에서 지정한 요청 command의 이름과 동일합니다.


`elapsed_time` ::

    요청하고 응답을 받는 데 걸린 시간


`success` ::

    정상적인 응답을 받았는지 여부, 정상적일 때, `success`, 실패한 경우, `failed`.


`length` ::

    요청을 보낸 데이터 길이, 바이트.


`result` ::

    게임서버로부터 받은 응답코드


`worker` ::

    테스트에 참여한 client 이름.


요청 command 목록
################################################################################

 +--------------------------+--------------------------------+
 | `battle_info`            | `회원 번호`                   
 +--------------------------+--------------------------------+
 | `battle_rank`            | `회원 번호`                   
 +--------------------------+--------------------------------+
 | `battle_reward_data`     |                                
 +--------------------------+--------------------------------+
 | `challenge_data`         |                                
 +--------------------------+--------------------------------+
 | `challenge_info`         | `회원 번호`                   
 +--------------------------+--------------------------------+
 | `char_data_list`         |                                
 +--------------------------+--------------------------------+
 | `char_list`              | `회원 번호`                   
 +--------------------------+--------------------------------+
 | `char_skin_data`         |                                
 +--------------------------+--------------------------------+
 | `char_skin_list`         | `회원 번호`                   
 +--------------------------+--------------------------------+
 | `check_nick`             | `회원 번호`, `닉네임` 
 +--------------------------+-------------------------------+
 | `echo`                   |                               
 +--------------------------+-------------------------------+
 | `inven_info`             | `회원 번호`                  
 +--------------------------+-------------------------------+
 | `logout`                 | `회원 번호`                  
 +--------------------------+-------------------------------+
 | `monster_data_list`      |                               
 +--------------------------+-------------------------------+
 | `ping`                   | `임의의 숫자` 
 +--------------------------+-------------------------------+
 | `spirit_collection_data` | `회원 번호`                  
 +--------------------------+-------------------------------+
 | `spirit_data_list`       | `회원 번호`                  
 +--------------------------+-------------------------------+


끝
################################################################################


