from xauat_login import XauatLogin

if __name__ == '__main__':
    username = 'your_mail'
    passwd = 'your_password'
    a = XauatLogin(username=username,
                   password=passwd)
    a.log_in()
