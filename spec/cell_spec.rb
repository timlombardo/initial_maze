require "spec_helper"
require "cell"

describe Cell do
  describe "#new" do
    it "initializes with accessible row and column" do
      cell = Cell.new(0,1)
      expect(cell.row).to eq 0
      expect(cell.column).to eq 1
    end
  end

  describe "#links" do
    context "when no cells are linked" do
      it "returns an empty hash" do
        cell = Cell.new(0,1)
        expect(cell.links).to eq []
      end
    end
  end
  
  describe "#link" do
    it "adds the given cell to the links hash" do
      cell = Cell.new(0,1)
      linked_cell = Cell.new(1,1)
      cell.link(linked_cell)
      expect(cell.links.first).to eq linked_cell
    end
  end

  describe "#unlink" do
    it "removes th given cell from the links hash" do
      cell = Cell.new(0,1)
      linked_cell = Cell.new(1,1)
      cell.link(linked_cell)
      cell.unlink(linked_cell)
      expect(cell.links.first).to eq nil
    end
  end

  describe "#north, #south, #east, #west" do
    it "stores and retrieves a cell" do
      cell, neighbor = build_cell_with_neighbors
      
      expect(cell.north).to eq neighbor
      expect(cell.south).to eq neighbor
      expect(cell.south).to eq neighbor
      expect(cell.west).to eq neighbor 
    end
  end

  describe "#neighbors" do
    it "returns an array of all neighbors" do
      cell, neighbor = build_cell_with_neighbors

      expect(cell.neighbors.length).to eq 4 
      expect(cell.neighbors.first).to eq neighbor
    end
  end

  def build_cell_with_neighbors
    cell = Cell.new(0,1)
    neighbor = Cell.new(1,1)
    [:north=, :south=, :east=, :west=].each do |method|
      cell.send(method, neighbor)
    end

    [cell, neighbor]
  end
end
