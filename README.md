# python-base-image

Base image for Python env for self-hosted runners

Usage:
```yaml
name: Python

on:
  push:
    branches:
      - "main"

jobs:
  tests:
    runs-on: [ "ubuntu-latest" ]
    strategy:
      fail-fast: true
      max-parallel: 2
      matrix:
        PYTHON_VERSION: # important to use "", otherwise matrix will treat values as floats
          - "3.8"
          - "3.9"
          - "3.10"
          - "3.11"
    container: opaoz/python-base:${{ matrix.PYTHON_VERSION }}
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
      - name: Run test
        run: |
          pytest test_main.py
```