require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '登録機能' do
    context 'タスクを登録した場合' do
      it '登録したタスクが表示される' do
        # テストで使用するためのタスクを登録
        # タスク一覧画面に遷移
        # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
        # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
        visit new_task_path
        fill_in 'task_title', with: '書類作成'
        fill_in 'task_content', with: '企画書を作成する。'
        click_button 'Create Task'
        expect(page).to have_content '企画書を作成する。'
        
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '登録済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを登録
        # タスク一覧画面に遷移
        # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
        # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
        task = FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content '企画書を作成する。'
        
      end 
    end
  end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it 'そのタスクの内容が表示される' do
        # テストで使用するためのタスクを登録
        # タスク詳細画面に遷移
        # visit（遷移）したpage（この場合、タスク詳細画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
        # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
        task = FactoryBot.create(:task)
        visit task_path(task)
        expect(page).to have_content '企画書を作成する。'
       end
     end
  end

  describe '登録表示機能' do
    context '一覧画面から任意のタスク登録画面に遷移した場合' do
      it 'ページタイトルに「New Task Page」が表示される' do
       # テストで使用するためのタスクを登録
       # タスク詳細画面に遷移
       # visit（遷移）したpage（この場合、タスク詳細画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
       # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
       task = FactoryBot.create(:task)
       visit new_task_path
       expect(page).to have_title 'New Task Page'
      end
    end
 end

  describe '登録機能' do
    context 'Backをクリックした場合' do
      it 'ページタイトルに「Tasks Index Page」が表示される' do
        # テストで使用するためのタスクを登録
        # タスク一覧画面に遷移
        # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
        # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
        visit new_task_path
        click_link 'Back'
        expect(page).to have_title 'Tasks Index Page'
      end
    end
  end

  describe '編集機能' do
    context 'Backをクリックした場合' do
      it 'ページタイトルに「Tasks Index Page」が表示される' do
        # テストで使用するためのタスクを登録
        # タスク一覧画面に遷移
        # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
        # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
        task = FactoryBot.create(:task)
        visit task_path(task)
        click_link 'Back'
        expect(page).to have_title 'Tasks Index Page'
      end
    end
  end
end