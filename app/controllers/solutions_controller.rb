class SolutionsController < ApplicationController 

  # PUT /solution/1
  def update

    if params[:solution][:archivo] == nil
      respond_to do |format|
        format.html { redirect_to problem_path(params[:id]), :alert => "You must attach a ruby application file."}
      end
      return
    end

    filename =  params[:id] + params[:solution][:archivo].original_filename
    directory = "public/data/tmp/"
    contype = params[:solution][:archivo].content_type

    if contype != 'application/x-ruby'
      respond_to do |format|
        format.html { redirect_to problem_path(params[:id]), notice: 'File must be a ruby application.' }
      end
      
      return
    end

    @problem = Problem.find(params[:id])
 
    # create the file path
    path = File.join(directory, filename)

    # save the temp tile 
    File.open(path, "wb") { |x| x.write(params[:solution][:archivo].read) }

    # load the test file
    tes = File.read(@problem.test.path)

    # run the application
    pathf = Rails.root.join(path)
    sol = `ruby #{pathf}`

    # check the answer
    if sol == tes
      stat = 'Correct Answer'
    else
      stat = 'Wrong Answer'
    end

    # erase temp file
    File.delete(path)

    solutions = @problem.solutions.for_user(current_user.id)

    respond_to do |format|
      if solutions.blank?
        @solution = Solution.new({:user_id => current_user.id, :problem_id => params[:id], :state => stat})

        @solution.save
      else
        @solution = solutions.first
        @solution.state = stat
        @solution.save
      end

      format.html{ redirect_to @problem , notice: stat}
    end

  end

end
