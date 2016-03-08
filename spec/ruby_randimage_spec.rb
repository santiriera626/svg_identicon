require 'spec_helper'

describe RubyRandimage do
  
  describe 'dummy' do

    # TODO: [sriera] Eliminar antes de build
    #it "text" do
    #  25.times do |i|
    #    RubyRandimage.create_and_save_file "temp_image_#{i}.svg" , { :title=>"image_#{i}", :colors=> ["#ffffff","#ffffff","#ffffff", "#770000", "#550000", "#990000", "#990000", "#990000"], :symmetry_axes=> [true, true], :num_cells=> 10}
    #  end
    #end

    it "creates a svg" do
      svg = RubyRandimage.create
      expect(svg).to be_a_kind_of(String)
    end

    it "creates a svg without simetry" do
      svg = RubyRandimage.create({ :symmetry_axes=> [false, false] })
      expect(svg).to be_a_kind_of(String)
    end

    it "creates a svg with horizontal simetry" do
      svg = RubyRandimage.create({ :symmetry_axes=> [true, false] })
      expect(svg).to be_a_kind_of(String)
    end

    it "creates a svg with vertical simetry" do
      svg = RubyRandimage.create({ :symmetry_axes=> [false, true] })
      expect(svg).to be_a_kind_of(String)
    end

    it "creates a svg with horizontal and vertical simetry" do
      svg = RubyRandimage.create({ :symmetry_axes=> [false, true] })
      expect(svg).to be_a_kind_of(String)
    end

    #it "creates an svg file" do
    #  result = RubyRandimage.create_and_save_file("test_image_0.svg")
    #  expect(result).to be_truthy
    #end

    it "does not create a svg image with an invalid grid size" do
      lambda { RubyRandimage.create(:num_cells=> 1) }.should raise_exception('num_cells must be between 2 and 256')
      lambda { RubyRandimage.create(:num_cells=> 257) }.should raise_exception('num_cells must be between 2 and 256')
    end

    it "does not create a svg image with an invalid title" do
      lambda { RubyRandimage.create({:title=> nil}) }.should raise_exception('title is invalid')
      lambda { RubyRandimage.create({:title=> ''}) }.should raise_exception('title is invalid')
    end
  end
end