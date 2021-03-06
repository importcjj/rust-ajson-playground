BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/dist

build:
	npm run build

github: build
ifeq ($(TRAVIS_PULL_REQUEST), false)
	ghp-import -n $(OUTPUTDIR)
	@git push -fq https://${GH_TOKEN}@github.com/$(TRAVIS_REPO_SLUG).git gh-pages > /dev/null
endif