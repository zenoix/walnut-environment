"""A simple script for syntax highlighted `head` command.

This is supposed to allow for the syntax hightlighting when using `head`
on a file supported by `bat`. It uses `bat` to do the syntax highlighting
if it is installed and can be found.
"""  # noqa: INP001

import argparse
import logging
import shutil
import subprocess
from collections.abc import Sequence
from dataclasses import dataclass
from enum import StrEnum

logger = logging.getLogger(__name__)


class ANSIEscapeSequence(StrEnum):
    HEADER = "\033[95m"
    OKBLUE = "\033[94m"
    OKCYAN = "\033[96m"
    OKGREEN = "\033[92m"
    WARNING = "\033[93m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"


@dataclass
class ProgramArgs:
    """Dataclass for parsed program args.

    This is used for static type checking.
    """

    files: list[str]
    bytes: int | None
    lines: int | None
    plain: bool | None = False


def main(argv: Sequence[str] | None = None) -> int:
    """Docstring first line goes here.

    Args:
        argv: The argument strings to the program

    Returns:
        The exit code of the program (non-zero means an error occurred)
    """
    parser = argparse.ArgumentParser()
    _ = parser.add_argument(
        "-c",
        "--bytes",
        metavar="[-]NUM",
        help="print the first NUM bytes of each file; with the leading '-', print all but the last NUM bytes of each file",  # noqa: E501
        type=int,
    )
    _ = parser.add_argument(
        "-n",
        "--lines",
        metavar="[-]NUM",
        help="print the first NUM lines instead of the first 10; with the leading '-', print all but the last NUM lines of each file",  # noqa: E501
        type=int,
    )
    _ = parser.add_argument(
        "-p",
        "--plain",
        help="print the first part of files without any syntax highlighting",
        type=bool,
        default=False,
    )
    _ = parser.add_argument("files", nargs="+")
    args = ProgramArgs(**parser.parse_args(argv).__dict__)  # pyright: ignore[reportAny]

    if bat_binary := shutil.which("bat"):
        cmd_args = [bat_binary, *list(args.files)]

        if args.lines >= 0:
            cmd_args += ["-r", f":{args.lines}"]

        try:
            completed_process = subprocess.run(cmd_args, check=True)  # noqa: S603
        except subprocess.CalledProcessError as e:
            return e.returncode

        return completed_process.returncode

    logger.warning(
        f"{ANSIEscapeSequence.WARNING}WARNING: bat executable could not be found, falling back to head{ANSIEscapeSequence.ENDC}\n"  # noqa: E501, G004
    )
    head_binary_path = shutil.which("head")
    if head_binary_path is None:
        logger.error(
            f"{ANSIEscapeSequence.FAIL}ERROR: head executable could not be found{ANSIEscapeSequence.ENDC}"  # noqa: E501, G004
        )
        return 1

    cmd_args = [head_binary_path, "-n", str(args.lines), *list(args.files)]

    if args.bytes:
        cmd_args += ["-c", str(args.bytes)]

    try:
        completed_process = subprocess.run(cmd_args, check=True)  # noqa: S603
    except subprocess.CalledProcessError as e:
        return e.returncode

    return completed_process.returncode


if __name__ == "__main__":
    raise SystemExit(main())
