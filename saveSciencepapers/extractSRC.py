from bs4 import BeautifulSoup

html = open("html.txt", "r")
soup = BeautifulSoup(html, 'html.parser')
getembed = soup.find_all('embed')
for part in getembed:
      print(part['src'])
