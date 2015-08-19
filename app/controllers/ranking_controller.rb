class RankingController < ApplicationController
  after_action :set_rank 
  
  @rank = []

  def have
    @i = 1
    @ranking = 1
    @save_count = 0
    @rank_items = []
    @rank_counts = []
    @rank_rankings = []

    @type = 'Have'
    @rank = Ownership.group("item_id").where("type = 'Have'").order("count_all DESC").limit(10).count

    @rank.each do |item_id, count|
      # item_idを元に@item情報を取得してセットする
      @item = Item.find(item_id)
      @rank_items.push(@item)
      # countからHave/Wantの数を取得してセットする
      @rank_counts.push(count)
      # 順位をセットする。同数のHave/Wantの場合、同じ順位にする。
      if @save_count != count
        @ranking = @i
      end
      @rank_rankings.push(@ranking)
      @i = @i + 1
      @save_count = count
    end
  end

  def want
    @i = 1
    @ranking = 1
    @save_count = 0
    @rank_items = []
    @rank_counts = []
    @rank_rankings = []
    
    @type = 'Want'
    @rank = Ownership.group("item_id").where("type = 'Want'").order("count_all DESC").limit(10).count

    @rank.each do |item_id, count|
      # item_idを元に@item情報を取得してセットする
      @item = Item.find(item_id)
      @rank_items.push(@item)
      # countからHave/Wantの数を取得してセットする
      @rank_counts.push(count)
      # 順位をセットする。同数のHave/Wantの場合、同じ順位にする。
      if @save_count != count
        @ranking = @i
      end
      @rank_rankings.push(@ranking)
      @i = @i + 1
      @save_count = count
    end
  end
  
  private
  
  def set_rank
    @i = 1
    @ranking = 1
    @save_count = 0
    @rank_items = []
    @rank_counts = []
    @rank_rankings = []

    @rank.each do |item_id, count|
      # item_idを元に@item情報を取得してセットする
      @item = Item.find(item_id)
      @rank_items.push(@item)
      # countからHave/Wantの数を取得してセットする
      @rank_counts.push(count)
      # 順位をセットする。同数のHave/Wantの場合、同じ順位にする。
      if @save_count != count
        @ranking = @i
      end
      @rank_rankings.push(@ranking)
      @i = @i + 1
      @save_count = count
    end
  end

end
