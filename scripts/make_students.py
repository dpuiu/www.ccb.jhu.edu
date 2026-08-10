#!/usr/bin/env python3

from pathlib import Path
import yaml
from jinja2 import Environment, FileSystemLoader

with open("people/students.yaml") as f:
    data = yaml.safe_load(f)

env = Environment(
    loader=FileSystemLoader("_templates"),
    trim_blocks=True,
    lstrip_blocks=True,
)

students = data["students"]

template = env.get_template("people/students.jinja")

output = template.render(students=students)

Path("people/students.md").write_text(output, encoding="utf-8")
