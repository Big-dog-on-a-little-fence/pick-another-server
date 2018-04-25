class JamsController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_jam, only: [:show, :destroy]
  before_action :set_tunes, only: [:show]
  helper_method :jam_structure
  
  def index
    @jams = Jam.includes(:users).all.order('created_at DESC').page(params[:page]).per(5)
  end
  
  def show
    @tune = @tunes.sample
    @j_struct = jam_structure(@jam.users)
    # @q = @tunes.ransack(params[:q])
    # @jam_tunes = @q.result.page(params[:page]).per(25)
  end
  
  def new
    @jam = Jam.new
  end

  def create
    @jam = Jam.new(jam_params)
    if @jam.save
      flash[:success] = "Jam created successfully"
      redirect_to jam_path(@jam)
    else
      render 'new'  ## render new article template in case of failure for another try
    end
  end

  def destroy
  end

  def jam_structure(users)
    j = {}
    j['Kickoff'] = users.sample
    j['Tag'] = users.sample
    j['Trade'] = users.sample
    j['Unison'] = users.sample
    if users.length >= 2
      j['Trade'] = users.sample(2)
      j['Unison'] = users.sample(2)
      if users.length >= 4
        j['Unison'] = (users - j['Trade']).sample(2)
      end
      
    end
    return j
  end

  private
  
  def set_jam
    jam_includes = [{comments: :user}, {comments: :commentable}, {comments: :comments}]
    @jam = Jam.includes(jam_includes).find(params[:id])
  end
  
  def set_tunes
    user_includes = [:repertoires, :tunes]
    unless @jam.users.length < 1
      @tunes = @jam.users[0].tunes.includes(:genres, :sources, charts: [progressions: :measures])
      @jam.users.includes(user_includes).each do |user|
        @tunes &= user.tunes
      end
    end
  end

  def jam_params
    params.require(:jam).permit(:name, user_ids: [])
  end

end
