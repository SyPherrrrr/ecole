
import os
import time
from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.edge.options import Options

user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'


# Les 20 codes promotionnels
codes_promo = [
    "Pepechicken20246j-%©30W",
    "Pepechicken20246j-®™30W",
    "Pepechicken20246j-✓[]30W",
    "Pepechicken20246j-£¥30W",
    "Pepechicken20246j-$¢30W",
    "Pepechicken20246j-^°30W",
    "Pepechicken20246j-={}30W",
    "Pepechicken20246j-∆§30W",
    "Pepechicken20246j-×÷30W",
    "Pepechicken20246j-π√30W",
    "Pepechicken20246j-•|30W",
    "Pepechicken20246j-`~30W",
    "Pepechicken20246j-©®30W",
    "Pepechicken20246j-™✓30W",
    "Pepechicken20246j-[]£30W",
    "Pepechicken20246j-¥$30W",
    "Pepechicken20246j-¢^30W",
    "Pepechicken20246j-°={}30W",
    "Pepechicken20246j-§×30W",
    "Pepechicken20246j-÷π30W"
]

# Chemin vers le WebDriver d'edge
driver_path = 'C:/Users/Elias/Desktop/ecole/code/.ipynb_checkpoints/msedgedriver.exe'
print(driver_path)
edge_service = Service(driver_path)
edge_options = Options()
edge_options.add_argument(f'user-agent={user_agent}')


# Initialisation du navigateur
browser = webdriver.Edge(service=edge_service, options=edge_options)

# Se rendre sur le site d'Uber Eats
browser.get("https://python.org")

