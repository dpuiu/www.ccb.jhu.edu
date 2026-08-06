#!/usr/bin/env python3

from pathlib import Path
import sys
import yaml
from jinja2 import Environment, FileSystemLoader

if len(sys.argv) != 3:
    print("Usage: make_people.py file.jinja file.yaml")
    sys.exit(1)

env = Environment(
    loader=FileSystemLoader("_templates"),
    trim_blocks=True,
    lstrip_blocks=True,
)

jinja_file = Path(sys.argv[1])
template = env.get_template(str(jinja_file))

yaml_file = Path(sys.argv[2])
with open(yaml_file) as f:
    data = yaml.safe_load(f)

output = template.render(data=data)
print(output)
