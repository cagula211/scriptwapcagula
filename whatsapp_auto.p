import requests
import time

# Configurare
api_url = "https://graph.facebook.com/v17.0/YOUR_PHONE_NUMBER_ID/messages"
access_token = "YOUR_ACCESS_TOKEN"
phone_number = "+393533870586"  # Numărul de telefon destinatar
message = "Acesta este un mesaj automat!"

# Funcție pentru trimiterea mesajului
def send_whatsapp_message():
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    payload = {
        "messaging_product": "whatsapp",
        "to": phone_number,
        "type": "text",
        "text": {
            "body": message
        }
    }
    response = requests.post(api_url, headers=headers, json=payload)
    if response.status_code == 200:
        print("Mesaj trimis cu succes!")
    else:
        print(f"Eroare: {response.status_code}, {response.text}")

# Trimite mesaje nonstop (cu o pauză între ele)
while True:
    send_whatsapp_message()
    time.sleep(10)  # Așteaptă 10 secunde între mesaje
