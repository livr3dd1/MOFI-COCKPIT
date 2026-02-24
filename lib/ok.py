import psutil
import os
import time as t
import sys

def kill():

    for proc in psutil.process_iter(['pid', 'name']):
        
        if proc.info['name'] == sys.argv[2]:
            proc.kill()
def normal():

    for proc in psutil.process_iter(['pid', 'name']):
        nombre = proc.info['name']
        pid = proc.info['pid']
        t.sleep(0.1)
        print(nombre, pid)

if sys.argv[1] == "normal":
    normal()
elif sys.argv[1] == "kill":
    kill()

