#!/usr/bin/python3
"""takes in a URL, sends a request to the URL
and displays the body of the response (decoded in utf-8).

You have to manage urllib.error.HTTPError exceptions
and print: Error code: followed by the HTTP status code
"""
import sys
import urllib.request
import urllib.error


def main():
    """takes in a URL, sends a request to the URL
    and displays the body of the response (decoded in utf-8).

    You have to manage urllib.error.HTTPError exceptions
    and print: Error code: followed by the HTTP status code
    """
    url = sys.argv[1]
    req = urllib.request.Request(url)
    try:
        with urllib.request.urlopen(req) as response:
            this_page = response.read().decode('utf-8')
            print(this_page)
    except urllib.error.HTTPError as e:
        print("Error code: {}".format(e.code))


if __name__ == "__main__":
    main()
