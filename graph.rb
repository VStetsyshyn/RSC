class Graph
  Vertex = Struct.new(:name, :neighbours, :dist, :prev)
 
  def initialize(graph)
    @vertices = Hash.new{|h,k| h[k]=Vertex.new(k,[],Float::INFINITY)}
    @edges = {}
    graph.each do |(v1, v2, dist)|
      @vertices[v1].neighbours << v2
      @vertices[v2].neighbours << v1
      @edges[[v1, v2]] = @edges[[v2, v1]] = dist
    end
    @dijkstra_source = nil
  end
 
  def dijkstra(start)
    return  if @dijkstra_start == start
    q = @vertices.values
    q.each do |v|
      v.dist = Float::INFINITY
      v.prev = nil
    end
    @vertices[start].dist = 0
    until q.empty?
      u = q.min_by {|vertex| vertex.dist}
      break if u.dist == Float::INFINITY
      q.delete(u)
      u.neighbours.each do |v|
        vv = @vertices[v]
        if q.include?(vv)
          alt = u.dist + @edges[[u.name, v]]
          if alt < vv.dist
            vv.dist = alt
            vv.prev = u.name
          end
        end
      end
    end
    @dijkstra_start = start
  end
 
  def smallest_distance(from_station, to_station)  
    dijkstra(from_station.to_sym)
    path = []
    u = to_station.to_sym
    while u
      path.unshift(u)
      u = @vertices[u].prev
    end
    return @vertices[to_station.to_sym].dist
  end

end