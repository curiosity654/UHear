from flask import Flask
from flask import make_response
from flask import request
from flask_sqlalchemy import SQLAlchemy
from flask_socketio import SocketIO
from flask_socketio import join_room, leave_room
import json
import os
import time

app = Flask(__name__)
basedir=os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI']='sqlite:///'+os.path.join(basedir,'userConfigBase.sqlite')
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN']=True
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=True
userdb=SQLAlchemy(app)
app.config['SECRET_KEY']='secret'
socketio = SocketIO(app)

@app.route('/')
def test():
    return '服务器正常运行'

class userInfoTable(userdb.Model):
    __tablename__ = 'userInfo'
    id=userdb.Column(userdb.Integer,primary_key=True)
    username=userdb.Column(userdb.String,unique=True)
    password=userdb.Column(userdb.String)

    def __repr__(self):
        return 'table name is '+self.username

#此方法处理用户登录 返回码为0无注册 返回码为1密码错误
@app.route('/user/login',methods=['POST'])
def check_user():
    print(request.data)
    data = json.loads(request.data)
    print(data)
    haveregisted = userInfoTable.query.filter_by(username=data['username']).all()
    if haveregisted.__len__() is not 0: # 判断是否已被注册
        passwordRight = userInfoTable.query.filter_by(username=data['username'],password=data['password']).all()
        if passwordRight.__len__() is not 0:
            return '0'
        else:
            return '1'
    else:
        return '2'

#此方法处理用户注册
@app.route('/register',methods=['POST'])
def register():
    userdb.create_all()
    haveregisted = userInfoTable.query.filter_by(username=request.form.get('username')).all()
    if haveregisted.__len__() is not 0: # 判断是否已被注册
        return 'Username has been taken'
    userInfo=userInfoTable(username=request.form.get('username'),password=request.form.get('password'))
    userdb.session.add(userInfo)
    userdb.session.commit()
    return 'Register Success'

@socketio.on('connect')
def connect():
    print('------------emit connect message------------')
    socketio.emit('connect')

@socketio.on('join')
def on_join(data):
    room = data['roomId']
    user = data['userId']
    join_room(room)
    print('------------' + user + ' joined room ' + room + '------------')
    socketio.send(user + 'someone has joined the room', room=room)

@socketio.on('leave')
def on_leave(data):
    room = data['roomId']
    user = data['userId']
    leave_room(room)
    print('------------' + user + ' has left room ' + room + '------------')
    socketio.send(user + 'someone has left the room', room=room)

@socketio.on('play')
def play_music(data):
    print('------------emit play message------------')
    print(data)
    room = data['roomId']
    socketio.emit('play', data, room=room)

@socketio.on('pause')
def pause_music(data):
    print('------------emit pause message------------')
    print(data)
    room = data['roomId']
    socketio.emit('pause', data, room=room)

@socketio.on('stop')
def stop_music(data):
    print('------------emit stop message------------')
    room = data['roomId']
    socketio.emit('stop', data, room=room)

@socketio.on('changeSong')
def pause_music(data):
    print('------------emit changeSong message------------')
    print(data)
    room = data['roomId']
    socketio.emit('changeSong', data, room=room)

if __name__ == '__main__':
    socketio.run(app,host='0.0.0.0', debug=True)