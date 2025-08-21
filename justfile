[private]
default:
    just --list

install-test-dependencies:
    sudo snap install lxd
    sudo snap install --classic --channel edge snapcraft
    sudo snap install yq
    sudo snap install just --classic

# Run tests for the snap
[group("test")]
smoke:
	bash tests/test_smoke.sh