from pathlib import Path
import re

def extract_section(
    filename: str | Path,
    title: str,
    *,
    include_heading: bool = True,) -> str:
    """
    Extract a Markdown section by heading title.

    The section includes all subsections and ends when a heading
    at the same or higher level is encountered.

    Parameters
    ----------
    filename:
        Markdown file to read.

    title:
        Heading text to extract, without the '#' markers.

    include_heading:
        If True, include the requested heading in the result.

    Returns
    -------
    str
        The extracted Markdown section.

    Raises
    ------
    ValueError
        If the requested section is not found.
    """

    text = Path(filename).read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)

    heading_pattern = re.compile(r"^(#{1,6})[ \t]+(.+?)[ \t]*#*[ \t]*$")

    start = None
    section_level = None

    for i, line in enumerate(lines):
        match = heading_pattern.match(line)

        if not match:
            continue

        level = len(match.group(1))
        heading = match.group(2).strip()

        if heading == title:
            start = i
            section_level = level
            break

    if start is None:
        raise ValueError(f"Section not found: {title!r}")

    end = len(lines)

    for i in range(start + 1, len(lines)):
        match = heading_pattern.match(lines[i])

        if match:
            level = len(match.group(1))

            if level <= section_level:
                end = i
                break

    if include_heading:
        return "".join(lines[start:end])

    return "".join(lines[start + 1:end])


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Extract a section from a Markdown file.")
    parser.add_argument("file", help="Markdown file")
    parser.add_argument("section", help="Section heading")
    parser.add_argument("--no-heading",action="store_true",help="Exclude the section heading",)

    args = parser.parse_args()

```python
from pathlib import Path
import re


def extract_section(
    filename: str | Path,
    title: str,
    *,
    include_heading: bool = True,
) -> str:
    """
    Extract a Markdown section by heading title.

    The section includes all subsections and ends when a heading
    at the same or higher level is encountered.

    Parameters
    ----------
    filename:
        Markdown file to read.

    title:
        Heading text to extract, without the '#' markers.

    include_heading:
        If True, include the requested heading in the result.

    Returns
    -------
    str
        The extracted Markdown section.

    Raises
    ------
    ValueError
        If the requested section is not found.
    """

    text = Path(filename).read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)

    heading_pattern = re.compile(r"^(#{1,6})[ \t]+(.+?)[ \t]*#*[ \t]*$")

    start = None
    section_level = None

    for i, line in enumerate(lines):
        match = heading_pattern.match(line)

        if not match:
            continue

        level = len(match.group(1))
        heading = match.group(2).strip()

        if heading == title:
            start = i
            section_level = level
            break

    if start is None:
        raise ValueError(f"Section not found: {title!r}")

    end = len(lines)

    for i in range(start + 1, len(lines)):
        match = heading_pattern.match(lines[i])

        if match:
            level = len(match.group(1))

            if level <= section_level:
                end = i
                break

    if include_heading:
        return "".join(lines[start:end])

    return "".join(lines[start + 1:end])


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description="Extract a section from a Markdown file."
    )
    parser.add_argument("file", help="Markdown file")
    parser.add_argument("section", help="Section heading")
    parser.add_argument(
        "--no-heading",
        action="store_true",
        help="Exclude the section heading",
    )

    args = parser.parse_args()

    print(
        extract_section(
            args.file,
            args.section,
            include_heading=not args.no_heading,
        ),
        end="",
    )
