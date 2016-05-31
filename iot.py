from twython import Twython
import json, requests
import RPi.GPIO as GPIO
import time
from datetime import date
from datetime import datetime  
from datetime import timedelta  

CONSUMER_KEY = '5brZIqbrFTJoVuvg9fL18Z1Tm'
CONSUMER_SECRET = 'XPb4ApUv56oWT2PbRNQqOsyIbWjK6UejznSGWGDnZ0UrOes1To'
ACCESS_KEY = '736907827135012864-CDfzHdtNqOD9rTV9KjvX3Dx3G0Oa6Yu'
ACCESS_SECRET = 'PSObJn2AocDaZ9pzkmny7tYlXRJgJNjgog1VHA8a5L62V'

api = Twython(CONSUMER_KEY,CONSUMER_SECRET,ACCESS_KEY,ACCESS_SECRET)

GPIO.setwarnings(False)

url = 'http://192.168.1.76/gazou/site/controleur/Controleur-CalcDiff.php'
exec_time = 5 * 60 * 1000 #5 minutes
starttime = date(2013, 10, 1) 

#setup GPIO
GPIO.setmode(GPIO.BOARD)  # set board mode to Broadcom

GPIO.setup(7, GPIO.OUT)  # set up pin 17
GPIO.setup(11, GPIO.OUT)  # set up pin 18
GPIO.setup(13, GPIO.OUT)  # set up pin 18


print("----start--- exec time: (ms)" + str(exec_time))

def execute(dt):
	_url = url + "?date=" + str(dt)
	#print "fetch data for " + str(dt)
	resp = requests.get(url=_url)
	result = json.loads(resp.text)	
	data = result["data"]
	
	print (resp.text)

	
	
	GPIO.output(13, data[0])  # turn on pin 17
	GPIO.output(11, data[1])  # turn on pin 18
	GPIO.output(7, data[2])  # turn on pin 18
	try:
		if (data[2] == 1):
			msg = 'bravo! 10% de CO2 en moins, cc #HackTheDatas'
			api.update_status(status=msg)
	except: 
		pass


curr_time = 0
curr_date = starttime
while (curr_time < exec_time):
	execute(curr_date)
	time.sleep(3)
	curr_date = curr_date + timedelta(days=5) 
	curr_time = curr_time + 3 * 1000


print("----stop---")

GPIO.cleanup()
