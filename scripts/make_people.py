from pathlib import Path
import sys
import yaml
from jinja2 import Environment, FileSystemLoader

if len(sys.argv) != 2:
    print("Usage: make_people.py people.yaml")
    sys.exit(1)

yaml_file = Path(sys.argv[1])

with open(yaml_file) as f:
    data = yaml.safe_load(f)

env = Environment(
    loader=FileSystemLoader("_templates"),
    trim_blocks=True,
    lstrip_blocks=True,
)

template = env.get_template("people/people.jinja")

output = template.render(data=data)

print(output)
