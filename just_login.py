from xauat_login import XauatLogin
import os

if __name__ == '__main__':
    username = os.environ.get('UCAS_USERNAME')
    passwd = os.environ.get('UCAS_PASSWD')
    a = XauatLogin(username=username,
                   password=passwd)
    a.log_in()
