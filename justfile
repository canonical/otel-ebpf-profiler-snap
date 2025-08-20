[private]
default:
    just --list

# Run tests for the snap
[group("test")]
smoke:
	sh tests/smoke/test_smoke.sh