import os
import argparse


def main(database: str):
    print("I am going to work with " + database)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-db", "--database", help="SQL File Name")
    args = parser.parse_args()
    database_file = args.database
    main(database=database_file)
