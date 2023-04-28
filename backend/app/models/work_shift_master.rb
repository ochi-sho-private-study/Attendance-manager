# frozen_string_literal: true

# == Schema Information
#
# Table name: work_shift_masters
#
#  id                                :bigint           not null, primary key
#  end_time(シフトの終了時刻)        :datetime         not null
#  name(シフトの時間帯名 (ex. 夜勤)) :string(255)      default("その他")
#  start_time(シフトの開始時刻)      :datetime         not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
class WorkShiftMaster < ApplicationRecord
end
