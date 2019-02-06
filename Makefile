#!/usr/bin/make

GATEWAY ?= $(shell ip r l | awk '/^default/ {print $$3}')
DATABASE ?= nhclinical

install_sauce_connect:
	@curl -o sauce_connect.tar.gz -SL https://saucelabs.com/downloads/sc-4.4.9-linux.tar.gz
	@tar -xf sauce_connect.tar.gz
	@rm sauce_connect.tar.gz
	@mv sc-4.4.9-linux sauce_connect

run_sauce_connect:
	@test -f /var/tmp/sc.pid && kill -9 $$(cat /var/tmp/sc.pid) || /bin/true
	screen -d -m ./sauce_connect/bin/sc \
		-u ${SAUCELABS_USERNAME} \
		-k ${SAUCELABS_ACCESS_TOKEN} \
		-l sauce_connect.log \
		-i ${GO_REVISION_LIVEOBS} \
		--pidfile /var/tmp/sc.pid
	sleep 30

install:
	@virtualenv venv
	venv/bin/pip install -r requirements.txt

setup_chrome:
	@docker pull yukinying/chrome-headless-browser-selenium:64.0.3278.0

run_chrome:
	@docker run -d --name selenium --shm-size=1024m --cap-add SYS_ADMIN -p 0.0.0.0:4444:4444 yukinying/chrome-headless-browser-selenium:64.0.3278.0

stop_chrome:
	@docker stop selenium || /bin/true
	@docker rm selenium || /bin/true

install_chromedriver:
	@rm -rf chromedriver
	@curl -o chromedriver.zip -SL https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip
	@unzip -d chromedriver chromedriver.zip
	@rm chromedriver.zip

run: install_chromedriver
	@curl -sf --head http://${GATEWAY}:8069/web
	@sleep 5
	@sed -i "s,localhost,${GATEWAY},g" config.yml
	@sed -i "s,nhclinical,${DATABASE},g" config.yml
	PATH=$$PATH:chromedriver/ GATEWAY="${GATEWAY}" venv/bin/behave features/

clean_up:
	test -f /var/tmp/sc.pid && kill -9 $$(cat /var/tmp/sc.pid) || /bin/true

.PHONY: install run install_chromedriver install_sauce_connect run_sauce_connect clean_up
