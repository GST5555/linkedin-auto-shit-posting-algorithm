from splinter import Browser
from selenium.webdriver.common.keys import Keys
import subprocess
import os
from time import sleep
import json

def main(browser):
    browser.visit(url = 'https://www.linkedin.com/login?trk=guest_homepage-basic_nav-header-signin')
    sleep(1)
    browser.type('session_key', '<YOUR EMAIL ACCOUNT>')
    browser.type('session_password', '<YOUR PASSWORD>')
    sleep(1)
    browser.find_by_xpath(xpath = '//*[@id="app__container"]/main/div/form/div[3]/button').click()
    sleep(1)
    browser.find_by_text('Start a post').click()

#    with open('content_to_post.json', encoding='ISO-8859-1', "r") as f:
    jsonFile = open("content_to_post.json", "r", encoding='ISO-8859-1')
    #Open the JSON file for reading
    data = json.load(jsonFile) # Read the JSON into the buffer
    jsonFile.close() # Close the JSON file
#        data = json.load(f)

    #print(data[0]["link"])
    if "link" in data[0].keys():
        #print("du has")
        link = data[0]["link"]
    else:
        link = ""
    if "hastags" in data[0].keys():
        #print("du has")
        hastags = data[0]["hastags"]
    else:
        hastags = ""
    if "comment" in data[0].keys():
        #print("du has")
        comment = data[0]["comment"]
    else:
        comment = ""

    data.pop(0)
#    with open('content_to_post.json', encoding='ISO-8859-1', "w") as f:
#        json.dump(data, f)

    ## Save our changes to JSON file
    jsonFile = open("content_to_post.json", "w+", encoding='ISO-8859-1')
    jsonFile.write(json.dumps(data))
    jsonFile.close()
    
    browser.find_by_css('div[class="mentions-texteditor__contenteditable t-18 t-black--light t-normal"]').type(link)
    active_web_element = browser.driver.switch_to_active_element() 
    active_web_element.send_keys(Keys.ENTER)
    browser.find_by_css('div[class="mentions-texteditor__contenteditable t-18 t-black--light t-normal"]').type(comment)
    active_web_element = browser.driver.switch_to_active_element() 
    active_web_element.send_keys(Keys.ENTER)    
    for i in range(0,len(hastags)):
        browser.find_by_css('div[class="mentions-texteditor__contenteditable t-18 t-black--light t-normal"]').type(hastags[i])
        sleep(1)
        browser.find_by_css('div[class="mentions-texteditor__contenteditable t-18 t-black--light t-normal"]').type("  ")
    browser.find_by_text('Post').click()
    
    sleep(1)

if __name__ == '__main__':
    browser = Browser('firefox', incognito=True)
    main(browser = browser)
    browser.quit()
