import 'package:collection/collection.dart';
import 'place_nearby_model.dart' as nearby;
import 'dart:math';

class Vertex {
  final int id;
  final nearby.Location? location;

  Vertex(this.id, this.location);

  @override
  String toString() {
    return 'id: $id, location: ${location?.lat}|${location?.lng}';
  }
}

class Edge {
  final Vertex destination;
  final double weight;

  Edge(this.destination, this.weight);
}

class Graph {
  final List<Vertex> vertices;
  final Map<Vertex, List<Edge>> adjacencyList;

  Graph()
      : vertices = [],
        adjacencyList = {};

  void addVertex(Vertex vertex) {
    vertices.add(vertex);
    adjacencyList[vertex] = [];
  }

  void addEdge(Vertex source, Vertex destination, double weight) {
    final edge = Edge(destination, weight);
    adjacencyList[source]?.add(edge);
  }

  double calculateDistanceBetween(Vertex v1, Vertex v2) {
    double deltaX = v2.location!.lat! - v1.location!.lat!;
    double deltaY = v2.location!.lng! - v1.location!.lng!;
    double distance = sqrt(deltaX * deltaX + deltaY * deltaY);
    return distance;
  }

  Map<Vertex, double> dijkstra(Vertex startVertex) {
    final PriorityQueue<Vertex> queue =
        PriorityQueue<Vertex>((a, b) => a.id.compareTo(b.id));

    final Map<Vertex, double> distances = {};
    final Map<Vertex, bool> visited = {};
    final Map<Vertex, Vertex> predecessors = {};

    for (final vertex in vertices) {
      distances[vertex] = double.infinity;
      visited[vertex] = false;
    }

    distances[startVertex] = 0;
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      final currentVertex = queue.removeFirst();

      if (visited[currentVertex]!) {
        continue;
      }

      visited[currentVertex] = true;

      for (final edge in adjacencyList[currentVertex]!) {
        final destination = edge.destination;
        final weight = edge.weight;
        final newDistance = distances[currentVertex]! + weight;

        if (newDistance < distances[destination]!) {
          distances[destination] = newDistance;
          predecessors[destination] = currentVertex;
          queue.add(destination);
        }
      }
    }

    return distances;
  }

  void generateMesh() {
    addEdge(vertices[0], vertices[1], calculateDistanceBetween(vertices[0], vertices[1]));
    addEdge(vertices[0], vertices[2], calculateDistanceBetween(vertices[0], vertices[2]));
    addEdge(vertices[1], vertices[2], calculateDistanceBetween(vertices[1], vertices[2]));
    addEdge(vertices[1], vertices[3], calculateDistanceBetween(vertices[1], vertices[3]));
    addEdge(vertices[2], vertices[4], calculateDistanceBetween(vertices[2], vertices[4]));
    addEdge(vertices[3], vertices[4], calculateDistanceBetween(vertices[3], vertices[4]));
    addEdge(vertices[3], vertices[5], calculateDistanceBetween(vertices[3], vertices[5]));
    addEdge(vertices[4], vertices[5], calculateDistanceBetween(vertices[4], vertices[5]));
  }
}