[private]
default:
    just --list

# Run tests for the snap
[group("test")]
smoke:
	bash tests/test_smoke.sh