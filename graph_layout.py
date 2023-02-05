import sys
import json
import igraph as ig


if __name__ == "__main__":
    input_edges = sys.argv[1].split()
    # input_edges = " 1 34 2 100 3 86 4 86 5 51 6 3 7 27 8 34 9 8 10 91 11 28 12 46 13 60 14 32 15 49 16 76 17 92 18 23 19 65 20 97 21 2 22 1 23 16 24 12 25 34 26 7 27 70 28 22 29 54 30 4 31 73 32 42 33 94 34 2 35 28 36 13 37 44 38 53 39 16 40 46 41 86 42 18 43 9 44 94 45 17 46 39 47 61 48 64 49 82 50 89 51 91 52 97 53 57 54 89 55 26 56 61 57 31 58 74 59 78 60 2 61 94 62 68 63 65 64 14 65 49 66 46 67 16 68 80 69 30 70 77 71 48 72 16 73 69 74 47 75 2 76 75 77 72 78 70 79 31 80 81 81 70 82 67 83 59 84 77 85 65 86 85 87 69 88 89 89 1 90 96 91 63 92 86 93 26 94 64 95 6 96 67 97 77 98 70 99 21".split()
    input_edges = [int(x) for x in input_edges]
    edges = list(zip(*[iter(input_edges)] * 2))
    print(edges)
    g = ig.Graph(edges)
    layout = g.layout_davidson_harel()
    json_layout = {}
    for x in range(len(layout.coords)):
        json_layout[str(x)] = layout.coords[x]
    with open("layout.json", "w") as f:
        json.dump(json_layout, f)
