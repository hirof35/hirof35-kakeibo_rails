class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]

  def index
    @records = Record.all
    
    # --- 全体予算の計算 ---
    current_month = Time.now.beginning_of_month
    budget_record = Budget.find_by(month: current_month)
    @budget = budget_record ? budget_record.amount : 100000
    @total_spent = Record.where(date: Time.now.all_month).sum(:amount) || 0
    @remaining_budget = @budget - @total_spent
    @budget_percentage = @budget > 0 ? ([(@total_spent.to_f / @budget) * 100, 100].min).round : 0

    # --- カテゴリ別予算の取得 ---
    @categories = ["食費", "日用品", "娯楽", "交際費", "交通費", "その他"]
    @category_totals = Record.where(date: Time.now.all_month).group(:category).sum(:amount)
    @category_settings = CategoryBudget.pluck(:category, :amount).to_h
  end

  # 全体予算の更新
  def update_budget
    current_month = Time.now.beginning_of_month
    budget = Budget.find_or_initialize_by(month: current_month)
    budget.amount = params[:amount]
    budget.save
    redirect_to records_path, notice: "全体予算を更新しました"
  end

  # カテゴリ予算の更新
  def update_category_budget
    category_budget = CategoryBudget.find_or_initialize_by(category: params[:category])
    category_budget.amount = params[:amount]
    category_budget.save
    redirect_to records_path, notice: "#{params[:category]}の予算を更新しました"
  end

  def new
    @record = Record.new
  end

  def create
    # 1. 画面から送られてきたデータで新しいレコードを作る
    @record = Record.new(record_params)

    # 2. データベースに保存を試みる
    if @record.save
      # 保存に成功したら、一覧画面（index）に戻る
      redirect_to records_path, notice: "支出を記録しました！"
    else
      # 失敗（入力漏れなど）したら、もう一度入力画面を表示
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to records_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy!
    redirect_to records_path, notice: "削除しました"
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  # 安全のために、保存を許可する項目を指定する（ストロングパラメーター）
  def record_params
    params.require(:record).permit(:date, :amount, :category, :memo)
  end
end