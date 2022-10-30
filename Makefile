version:
	@echo "Bumping cocoons version..."
	@echo "TODO Task to bump coccon version"

build:
	@echo "Builing cocoon site..."
	./scripts/build.sh

serve:
	@echo "Serving cocoon site..."
	./scripts/serve.sh

run:
	@echo "Building and serving cocoon..."
	$(MAKE) build
	$(MAKE) serve

smart_run:
	@echo "Building and serving cocoon..."
	./scripts/serve_cont.sh

clean:
	@echo "Deleting cocoon local files..."
	rm -rf site/

clean_and_build:
	$(MAKE) clean
	$(MAKE) build

upload_site:
	@echo "Uploading current site to host"
	@echo "TODO upload content with warning"

