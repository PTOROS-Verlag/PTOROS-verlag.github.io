import urllib.request
from bs4 import BeautifulSoup
import re
import json

def find_dirs():
    base_url = "https://www.thelatinlibrary.com/sen.html"
    root_url = "https://www.thelatinlibrary.com"
    
    req = urllib.request.Request(base_url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response:
        html = response.read()
        
    soup = BeautifulSoup(html, 'html.parser')
    
    links = []
    work_div = soup.find('div', class_='work')
    if work_div:
        for a in work_div.find_all('a'):
            href = a.get('href')
            if href and href.startswith('sen/seneca.ep'):
                links.append(f"{root_url}/{href}")
                
    dir_instances = []
    
    for link in links:
        print(f"Scanning {link}...")
        req = urllib.request.Request(link, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req) as response:
            page_html = response.read()
        page_soup = BeautifulSoup(page_html, 'html.parser')
        
        current_letter = "Unknown"
        
        # We need to iterate over all elements in order to keep track of the current letter
        for element in page_soup.body.descendants:
            if element.name == 'p':
                text = element.get_text(strip=True)
                if 'SENECA' in text.upper() and 'LVCILIO' in text.upper().replace('U', 'V') and 'SALVTEM' in text.upper().replace('U', 'V'):
                    m = re.match(r'^([MDCLXVI]+)\.', text, re.IGNORECASE)
                    if m:
                        current_letter = m.group(1).upper()
            
            elif element.name == 'dir':
                dir_text = element.get_text(separator='\n', strip=True)
                # clean up multiple newlines
                dir_text = re.sub(r'\n+', '\n', dir_text)
                if dir_text:
                    dir_instances.append({
                        "letter": current_letter,
                        "text": dir_text
                    })
                    
    with open('quotes_list.json', 'w', encoding='utf-8') as f:
        json.dump(dir_instances, f, ensure_ascii=False, indent=2)
    print(f"Found {len(dir_instances)} <dir> blocks. Saved to quotes_list.json")

if __name__ == "__main__":
    find_dirs()