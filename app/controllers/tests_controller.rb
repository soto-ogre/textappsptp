class TestsController < ApplicationController

  def index
    @test = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    binding.pry
    test_params[:images].each do |a|
      @test = Test.new(test_params.clone.merge({images: a}))
    @test.save
    end
    redirect_to tests_path
  end

  private
  def test_params
    params.require(:test).permit(:name,:content, {images: []}).merge(user_id: current_user.id)
  end
end
