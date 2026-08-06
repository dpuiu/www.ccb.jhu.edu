#!/usr/bin/env python3

from pathlib import Path
import yaml
from jinja2 import Environment, FileSystemLoader

with open("people/faculty.yaml") as f:
    data = yaml.safe_load(f)

env = Environment(
    loader=FileSystemLoader("_templates"),
    trim_blocks=True,
    lstrip_blocks=True,
)

faculty = data["faculty"]

template = env.get_template("people/faculty.jinja")

output = template.render(faculty=faculty)

Path("people/faculty.md").write_text(output, encoding="utf-8")
