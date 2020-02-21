from tkinter import *
from tkinter.ttk import *
import os
import glob
from PIL import ImageTk, Image


# Global variables
        #OS
user_home = os.path.expanduser('~')
storage_home = user_home+r'\Desktop\AxNotes\Storage'

        #TK
root = Tk()
root.title('AxNotes')
root.iconbitmap(user_home+r'\Desktop\AxNotes\favicon.ico')
root.geometry('1200x800')
frame=Frame(root,width=1200,height=800)
frame.pack(fill=BOTH)

        #TK Styles
style = Style()
style.configure('TButton', font = 
               ('calibri', 10, 'bold', 'underline'), 
                foreground = 'green') 

        #Expandables
AxNotes_Logo = PhotoImage(file=user_home+r'\Desktop\AxNotes\logo.png')



# Functions
def NewNote(): # new window definition
    NewNoteAttr = Toplevel(frame)
    NewNoteAttr.title('New Note')
    NewNoteAttr.iconbitmap(user_home+r'\Desktop\AxNotes\favicon.ico')
    NewNoteWindow = Label(NewNoteAttr, text="Humm, see a new window !")
    NewNoteWindow.pack() 

def CurrNote(): # new window definition
    CurrNoteAttr = Toplevel(frame)
    CurrNoteAttr.title('New Note')
    CurrNoteAttr.iconbitmap(user_home+r'\Desktop\AxNotes\favicon.ico')
    CurrNoteWindow = Label(CurrNoteAttr, text="Humm, see a new window !")
    CurrNoteWindow.pack() 







# Create Elements

        #Basic
Logo = Label(frame, image=AxNotes_Logo)
Title = Label(frame,text='Welcome to AxNotes\n')
Description = Label(frame,text='This is the home base of AxNotes - You can either create a new note or open up previous ones.\n\n')

        #Create Button
Createnote = Button(frame,text='Create New Note',command=NewNote, style='TButton')
Space = Label(frame, text=' ')

        #Frame for currents





MainFrame = Canvas(frame, background='snow', width=1000, height = 400, scrollregion=(0,0,500,1500))
vbar = Scrollbar(frame,orient=VERTICAL)
vbar.pack(fill=Y, side=RIGHT)
vbar.config(command=MainFrame.yview)
MainFrame.config(yscrollcommand=vbar.set)


for filename in os.listdir(storage_home):
    option = Button(MainFrame, text=filename, command=CurrNote)
    option.pack(fill=BOTH, padx=10, pady=10)



# Add Elements
Logo.pack()
Title.pack()
Description.pack()
Createnote.pack()
Space.pack()
MainFrame.pack()

#Enter program
root.mainloop()
