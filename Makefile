.SUFFIXES:
version = $(shell git describe | tr "-" "." | awk -F. -vOFS=. '{if (NF>3) {NF=3; $$NF++;} print}' | cut -c 2-)
name = $(notdir $(CURDIR))
file = ${name}-${version}.vsix
vsce-flags =

all: ${file} publish

CHANGELOG.md: .git/refs/heads/main
	echo "# Changelog\n### v${version}" >$@
	git log --oneline --decorate-refs='tags/*' --format="%(decorate:prefix=### ,suffix=%n,tag=)%n- %w(0,0,2)%B" >>$@

.git/refs/tags/v${version}: CHANGELOG.md
	npm version ${version} --no-git-tag-version
	git add package*.json CHANGELOG.md
	git commit --amend --no-edit
	git tag -afsm "" v${version}
	git push origin main v${version}

${file}: CHANGELOG.md .git/refs/tags/v${version}
	npx vsce package ${vsce-flags} ${version}

.INTERMEDIATE: ${name}-${version}-dev.vsix
${name}-${version}-dev.vsix:
	npx vsce package ${vsce-flags} ${version}-dev --no-git-tag-version --no-update-package-json

.PHONY install:
install: ${name}-${version}-dev.vsix
	code --install-extension ${name}-${version}-dev.vsix

.PHONY publish:
publish: ${file}
	npx vsce publish -i ${file} ${vsce-flags}
	git log --oneline --decorate-refs='tags/*' --format="- %w(0,0,2)%B" $(shell git describe --tags --abbrev=0 @^)... | gh release create v${version} --notes-file - ${file}
