# コントローラークラス
class TasksController < ApplicationController
  # 一覧画面
  def index
    # DBに保存されている全てのタスクデータを取得
    @task = Task.all
  end

  # 新規登録画面
  def new
    # 新しいオブジェクトを生成
    @task = Task.new
  end

  # 詳細画面
  def show
    @task = Task.find(params[:id])
  end

  # 登録
  def create
    # 安全化されたtaskパラメータを使ってオブジェクト生成
    @task = Task.new(task_params)
    # 検証が成功した場合DBに保存
    if @task.save
      # 一覧画面にリダイレクト
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    # 検証エラーの場合
    else
      # 新規登録画面を再び表示
      render :new
  end

  # 編集
  def edit
    # 編集対象のオブジェクトを取得
    @task = Task.find(params[:id])
  end

  # 更新
  def update
    # 編集対象のオブジェクトを取得
    task = Task.find(params[:id])
    # DBに保存
    task.update!(task_params)
    # 一覧画面にリダイレクト
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  # 削除
  def destroy
    # 削除対象のオブジェクトを取得
    task = Task.find(params[:id])
    # DBから削除
    task.destroy
    # 一覧画面にリダイレクト
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private
  
  # 不正データでないことをチェック
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
