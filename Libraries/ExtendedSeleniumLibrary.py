from SeleniumLibrary import SeleniumLibrary
from SeleniumLibrary.base import keyword
from SeleniumLibrary.keywords import (ElementKeywords, WindowKeywords)
from selenium.webdriver.common.keys import Keys

class ExtendedSeleniumLibrary(SeleniumLibrary):

    @keyword()
    def open_link_in_new_tab(self, link):
        """Clicks a link identified by ``locator`` in and navigates to newly opened tab.
        Links are searched using ``id``, ``name``, ``href`` and the link text."""

        window_keywords = WindowKeywords(self)
        element_keywords = ElementKeywords(self)

        initial_window_count = len(window_keywords.get_window_handles())
        element_keywords.click_link(link)
        window_titles = window_keywords.get_window_titles()
        window_keywords.select_window(window_titles[initial_window_count])

    @keyword()
    def send_keys(self, controlId, text):
        """ Created for entering the date on the enroll lead screen.
            No other methods work for the date field """
            
        element_keywords = ElementKeywords(self)
        elem = element_keywords.find_element(controlId)
        elem.send_keys(text)