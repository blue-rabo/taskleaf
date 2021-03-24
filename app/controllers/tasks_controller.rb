class TasksController < ApplicationController
  # 一覧画面
  def index
    @tasks = Task.all
  end

  # 詳細画面
  def show
    @task = Task.find(params[:id])
  end

  # 新規登録画面
  def new
    # オブジェクト生成
    @task = Task.new
  end

  # 登録
  def create
    # オブジェクト生成
    task = Task.new(task_params)
    # DBに保存
    task.save!
    # 一覧画面にリダイレクト
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
  end

  private
  
  # 不正データでないことをチェック
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
