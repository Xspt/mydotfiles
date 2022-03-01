import os
import shutil
from colorama import Fore, Back

HOME = os.environ['HOME']
cwd = os.path.abspath(os.path.dirname(__file__))

configDir = cwd + "/config/"
configs = sorted(os.listdir(configDir))

fontDir = cwd + "/fonts/"
fonts = sorted(os.listdir(fontDir))

fontPath = HOME + "/.local/share/fonts/"
backupPath = HOME + "/dotfiles.old/"
configPath = HOME + "/.config/"

def createPath():
    if not(os.path.exists(fontPath)):
        os.mkdir(fontPath)
        print(f"{Fore.YELLOW}Fonts folder created at {Fore.MAGENTA}{fontPath}{Fore.RESET}")
    if not(os.path.exists(backupPath)):
        os.mkdir(backupPath)
        print(f"{Fore.YELLOW}Backup folder created at {Fore.MAGENTA}{backupPath}{Fore.RESET}")
    if not(os.path.exists(backupPath + 'fonts/')):
        os.mkdir(backupPath + 'fonts/')
        print(f"{Fore.YELLOW}Font backup folder created at {Fore.MAGENTA}{backupPath + 'fonts/'}{Fore.RESET}")
    if not(os.path.exists(configPath)):
        os.mkdir(configPath)
        print(f"{Fore.YELLOW}Backup folder created at {Fore.MAGENTA}{configPath}{Fore.RESET}")

def makeBackup():
    print(f"{Fore.GREEN}=====ATTEMPTING TO BACKUP FILES====={Fore.RESET}")
    for i in configs:
        if (os.path.exists(configPath + i)):
            try:
                shutil.move(configPath + i, backupPath + i)
                print(f"{Fore.YELLOW}Moving {Fore.MAGENTA}{configPath + i} {Fore.YELLOW}to: {Fore.MAGENTA}{backupPath + i}{Fore.RESET}")
            except Exception as e:
                print(f"{Back.RED}{e}{Back.RESET}")
        else:
            print(f"{Fore.GREEN}No dotfiles found for {Fore.MAGENTA}{i} {Fore.GREEN}no backup needed.{Fore.RESET}")
    print(f"{Fore.GREEN}================DONE================{Fore.RESET}\n")
    print(f"{Fore.GREEN}=====ATTEMPTING TO BACKUP FONTS====={Fore.RESET}")
    for i in fonts:
        if (os.path.isfile(fontPath + i)):
            try:
                shutil.move(fontPath + i, backupPath + "fonts/" + i)
                print(f"{Fore.YELLOW}Moving {Fore.MAGENTA}{fontPath + i} {Fore.YELLOW}to: {Fore.MAGENTA}{backupPath}fonts/{i}{Fore.RESET}")
            except Exception as e:
                print(f"{Back.RED}{e}{Back.RESET}")
        else:
            print(f"{Fore.GREEN}No matching fonts found for {Fore.MAGENTA}{i} {Fore.GREEN}no backup needed.{Fore.RESET}")
    print(f"{Fore.GREEN}================DONE================{Fore.RESET}\n")


def installConfig():
    print(f"{Fore.GREEN}=====ATTEMPTING TO INSTALL FILES====={Fore.RESET}")
    for i in configs:
        try:
            shutil.copytree(configDir + i, configPath + i)
            print(f"{Fore.YELLOW}Copying {Fore.MAGENTA}{configDir + i} {Fore.YELLOW}to: {Fore.MAGENTA}{configPath + i}{Fore.RESET}")
        except Exception as e:
            print(f"{Back.RED}{e}{Back.RESET}")
    print(f"{Fore.GREEN}================DONE================{Fore.RESET}\n")


def installFont():
    print(f"{Fore.GREEN}=====ATTEMPTING TO INSTALL FONTS====={Fore.RESET}")
    for i in fonts:
        try:
            shutil.copy(fontDir + i, fontPath)
            print(f"{Fore.YELLOW}Copying {Fore.MAGENTA}{fontDir + i} {Fore.YELLOW}to: {Fore.MAGENTA}{fontPath + i}{Fore.RESET}")
        except Exception as e:
            print(f"{Back.RED}{e}{Back.RESET}")
    try:
        os.system('fc-cache')
        print(f"{Fore.YELLOW}Font cache updated successfully{Fore.RESET}")
    except Exception as e:
        print(f"{Back.RED}{e}{Back.RESET}")
    print(f"{Fore.GREEN}================DONE================{Fore.RESET}\n")

createPath()
makeBackup()
installConfig()
installFont()