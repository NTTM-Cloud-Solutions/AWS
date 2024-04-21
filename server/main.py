import requests
import base64
import os
from flask import Flask , render_template
from dotenv import load_dotenv
import json

load_dotenv('.env.local')

# Get access token
def get_access_token():
    client_id = os.getenv("CLIENT_ID")
    client_secret = os.getenv("CLIENT_SECRET")

    if client_id is None or client_secret is None:
        print("Missing client ID or client secret") ############## exit here
        exit()

    # Encode client ID and client secret in base64
    message = f"{client_id}:{client_secret}"
    message_bytes = message.encode("ascii")
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode("ascii")

    # Request headers
    token_headers = {
        "Authorization": f"Basic {base64_message}",
    }
   
    # Request body
    token_data = {
        "grant_type": "client_credentials"
    }

    response = requests.post("https://accounts.spotify.com/api/token", headers=token_headers, data=token_data)
    return response.json().get("access_token")

os.environ['SPOTIFY_ACCESS_TOKEN'] = get_access_token()
print(os.getenv('SPOTIFY_ACCESS_TOKEN'))

def fetch_show_data(show_id, access_token):
    url = f"https://api.spotify.com/v1/shows/{show_id}"

    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        show_data = response.json()
        with open('episodes.json', 'w', encoding='utf-8') as f:
            json.dump(show_data['episodes'], f, indent=4)

        return show_data
    else:
        print(f"Failed to fetch show data. Status code: {response.status_code}")
        return None



def render_show_data(access_token, show_id):
    with open('episodes.json', 'r', encoding='utf-8') as f:
        show_data = json.load(f)
    if show_data is not None:
        episodes = show_data['items'][1:4]
        episode_data = []
        for episode in episodes:
            description = episode['description'].replace('.', '.<br>')
            episode_data.append({
                'name': episode['name'],
                'id': episode['id'],
                'images': episode['images'][0]['url'],
                'uri': episode['uri'],
                'description': description,
                'release_date': episode['release_date'],
                'duration': episode['duration_ms'] / 1000 / 60
            })
        return render_template('show_data.html', episodes=episode_data)
    else:
        return "Failed to fetch show data"


app = Flask(__name__)
@app.route('/')
def hello():
    access_token = os.getenv("SPOTIFY_ACCESS_TOKEN")
    show_id = os.getenv("SPOTIFY_SHOW_ID")
    # fetch_show_data(show_id, access_token)
    return render_show_data(access_token, show_id)
    
if __name__ == '__main__':
    app.run(port=5001, debug=True)