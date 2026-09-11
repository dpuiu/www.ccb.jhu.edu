#!/usr/bin/env python3

import csv
import re
import sys


def bib_escape(s):
    """Escape characters that need protection in BibTeX."""
    if not s:
        return ""

    s = s.strip()
    s = s.replace("\\", r"\textbackslash{}")
    s = s.replace("&", r"\&")
    s = s.replace("%", r"\%")
    s = s.replace("#", r"\#")
    s = s.replace("_", r"\_")

    return s


def format_authors(authors):
    """
    Convert PubMed author format:

        Hansen NF, Dwarshuis N, Ji HJ, ... , et al.

    to BibTeX format:

        Hansen, NF and Dwarshuis, N and Ji, HJ and ...
    """

    # Remove "et al." from the end
    authors = re.sub(r",?\s*et\s+al\.?\s*$", "", authors, flags=re.IGNORECASE)

    result = []

    for author in authors.split(","):
        author = author.strip().rstrip(".")

        if not author:
            continue

        parts = author.split()

        if len(parts) == 1:
            result.append(parts[0])
        else:
            surname = parts[0]
            initials = " ".join(parts[1:])
            result.append(f"{surname}, {initials}")

    return " and ".join(result)

def bib_key0(row):
    """Use PMID as the BibTeX citation key."""

    pmid = row.get("PMID", "").strip()

    if pmid:
        return f"PMID{pmid}"

    author = row.get("First Author", "unknown").strip()
    year = row.get("Publication Year", "unknown")

    author = re.sub(r"[^A-Za-z0-9]", "", author)

    return f"{author}{year}"


def bib_key(row):
    """Use PMCID as the BibTeX citation key."""

    pmcid = row.get("PMCID", "").strip()

    if pmcid:
        return f"{pmcid}"

    author = row.get("First Author", "unknown").strip()
    year = row.get("Publication Year", "unknown")

    author = re.sub(r"[^A-Za-z0-9]", "", author)

    return f"{author}{year}"


def main(input_file, output_file):

    with open(input_file, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)

        with open(output_file, "w", encoding="utf-8") as out:

            for row in reader:

                key = bib_key(row)

                title = bib_escape(row.get("Title", ""))
                authors = format_authors(row.get("Authors", ""))
                journal = bib_escape(row.get("Journal/Book", ""))
                year = row.get("Publication Year", "").strip()
                doi = row.get("DOI", "").strip()
                pmid = row.get("PMID", "").strip()
                pmcid = row.get("PMCID", "").strip()

                out.write(f"@article{{{key},\n")

                if authors:
                    out.write(f"  author = {{{authors}}},\n")

                if title:
                    out.write(f"  title = {{{title}}},\n")

                if journal:
                    out.write(f"  journal = {{{journal}}},\n")

                if year:
                    out.write(f"  year = {{{year}}},\n")

                if doi:
                    out.write(f"  doi = {{{doi}}},\n")

                if pmid:
                    out.write(f"  pmid = {{{pmid}}},\n")

                if pmcid:
                    out.write(f"  pmcid = {{{pmcid}}},\n")

                out.write("}\n\n")


if __name__ == "__main__":

    if len(sys.argv) != 3:
        print(
            f"Usage: {sys.argv[0]} input.csv output.bib",
            file=sys.stderr,
        )
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])
