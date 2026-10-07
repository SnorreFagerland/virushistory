from flask import Flask, request
import pygame

pygame.mixer.init()
pygame.mixer.music.load('main.mp3')
pygame.mixer.music.play()

app = Flask(__name__)

@app.route('/')

def index():
    IP = request.headers.get("X-Forwarded-For", request.remote_addr)
    User_Agent = request.headers.get("User-Agent")
    Referrer = request.headers.get("Referer")
    Request_Method = request.method 
    All_Info = request.headers
    print("\n\n\nIP: %s"%(IP))
    print("\nUser-Agent: %s"%(User_Agent))
    print("\nReferer: %s"%(Referrer))
    print("\nAll Information Taken: ")
    print("_"*50)
    print(f"\n{All_Info}")

    with open("logs.txt", "a") as file:
        file.write(f"IP: {IP}\n")
        file.write(f"User-Agent: {User_Agent}\n")
        file.write(f"Referer: {Referrer}\n")
        file.write("All Information Taken:\n")
        file.write("_" * 30 + "\n")
        file.write(f"{All_Info}\n\n")

    return "Hello, World!"

if __name__ == "__main__":
  app.run(host="0.0.0.0", port=443, debug=True)
