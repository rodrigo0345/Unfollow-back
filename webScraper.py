from instabot import Bot
from flask import Flask, request, jsonify

app = Flask(__name__)


def instaBot(username, password):
    bot = Bot() # initialize the bot
    print(bot.login(username = username, password = password))
       

@app.route('/api', methods = ['GET'])
def insta():
    information = dict()
    username = str(request.args['username'])
    password = str(request.args['pswd'])
    responseUser = str(username)
    responsePswd = str(password)
    instaBot(responseUser, responsePswd)
    information[responseUser] = responsePswd
    return information


if __name__ == '__main__':
    app.run()   
    
'''
 if __name__ == "__main__":
    User = ''
    Pswd = ''
    bot = Bot()
    bot.login(username = User, password = Pswd)
    bot.unfollow_non_followers()
'''