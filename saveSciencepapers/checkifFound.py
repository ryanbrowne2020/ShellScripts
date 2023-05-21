from bs4 import BeautifulSoup

html = open("html.txt", "r")
soup = BeautifulSoup(html, 'html.parser')

get_title = soup.find('title').getText()
article_title = str(get_title)

if "article not found" in article_title:
    get_id = soup.find("p", {"id": "request"}).getText()
    print(get_id)
