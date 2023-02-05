import sys
import igraph as ig

if __name__ == "__main__":
    input_edges = sys.argv[1].split()
    edges = list(zip(*[iter(input_edges)] * 2))
    g = ig.Graph(edges)
    layout = g.layout_davidson_harel()
    print(layout)
# WHAT THE FUCK PYTHON
