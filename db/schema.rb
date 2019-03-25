# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190325065817) do

  create_table "factories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sn_article", primary_key: "aid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "acid"
    t.string "atitle", limit: 150
    t.string "pic", limit: 300
    t.string "keyword", limit: 100
    t.string "alink", limit: 300
    t.string "des", limit: 150
    t.text "content", limit: 16777215
    t.integer "uid"
    t.integer "count_click", default: 0
    t.integer "create_time"
    t.integer "top", default: 0
    t.integer "isyes", default: 0
    t.integer "sort", default: 0
    t.index ["aid", "acid", "atitle"], name: "aid"
  end

  create_table "sn_article_cat", primary_key: "acid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "afid"
    t.string "aname", limit: 80
    t.string "dir", limit: 20
    t.integer "atop", default: 0
    t.string "apic", limit: 300
    t.integer "wap", default: 0
    t.integer "sort", default: 0
    t.string "keyword", limit: 200
    t.string "ades", limit: 200
    t.integer "acreate_time"
    t.integer "ispic", default: 0
    t.index ["acid", "afid", "aname", "dir"], name: "acid"
  end

  create_table "sn_config", id: :integer, comment: "配置ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "cate", default: 0, comment: "0为基本设置，1为支付设置，2登录设置,3店铺设置,4积分设置"
    t.string "name", limit: 30, default: "", null: false, comment: "配置名称"
    t.integer "type", limit: 1, default: 0, null: false, comment: "配置类型", unsigned: true
    t.string "title", limit: 50, default: "", null: false, comment: "配置说明"
    t.string "extra", default: "", null: false, comment: "配置值"
    t.string "remark", limit: 100, null: false, comment: "配置说明"
    t.integer "create_time", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "update_time", default: 0, null: false, comment: "更新时间", unsigned: true
    t.integer "status", limit: 1, default: 0, null: false, comment: "状态"
    t.text "value", null: false, comment: "配置值"
    t.integer "sort", limit: 2, default: 0, null: false, comment: "排序", unsigned: true
    t.index ["name"], name: "uk_name", unique: true
    t.index ["type"], name: "type"
  end

  create_table "sn_credit", primary_key: "creid", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "type", default: 0, comment: "0为加，1为减去"
    t.string "typename", limit: 200
    t.integer "uid", comment: "用户id"
    t.integer "sid"
    t.string "sname", limit: 100
    t.string "source", limit: 100
    t.integer "crecount"
    t.integer "ctime"
    t.string "ip", limit: 100
    t.integer "etime", comment: "积分失效时间"
    t.string "crecontent", limit: 500
  end

  create_table "sn_creditgood", primary_key: "cgid", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "goodname", limit: 150, default: "0", comment: "0为加，1为减去"
    t.string "goodcontent", limit: 500
    t.integer "credits", comment: "积分数量"
    t.integer "count"
    t.integer "sid"
    t.string "sname", limit: 100, comment: "充值门店名称"
    t.string "goodpic", limit: 200
    t.integer "ctime"
    t.integer "sort"
  end

  create_table "sn_faddress", primary_key: "faddid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "uid", null: false
    t.integer "cityid"
    t.string "cityname", limit: 90
    t.integer "areaid", default: 0
    t.string "areaname", limit: 60
    t.string "address", limit: 100
    t.integer "addtop", default: 0
    t.integer "ctime"
    t.string "name", limit: 60
    t.string "tel", limit: 60
    t.index ["uid", "areaid"], name: "fcid"
  end

  create_table "sn_food", primary_key: "fid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "fcid"
    t.integer "fnum"
    t.string "fname", limit: 90
    t.string "ftitle", limit: 150
    t.float "fprice", limit: 24
    t.string "fcontent", limit: 200
    t.string "fpic", limit: 200
    t.integer "fsort", default: 0
    t.integer "ftop", default: 0
    t.integer "fctime"
    t.integer "status", default: 0
    t.integer "salecount"
    t.integer "iswaimai", default: 0, comment: "是否为外卖"
    t.index ["fid", "fcid", "fnum", "fname", "fprice", "status"], name: "fid"
  end

  create_table "sn_foodcat", primary_key: "fcid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "fcname", limit: 90
    t.integer "fpid", default: 0
    t.integer "fcsort", default: 0
    t.integer "fctop", default: 0
    t.integer "ctime"
    t.integer "sid"
    t.integer "fcount"
    t.index ["fcid", "fcname", "fpid"], name: "fcid"
  end

  create_table "sn_foodorder", primary_key: "oid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.float "orderprice", limit: 24
    t.integer "ordercount"
    t.float "zhekou", limit: 24
    t.float "pay", limit: 24
    t.integer "paytype", default: 0
    t.integer "ucount", default: 0
    t.integer "uid"
    t.string "uname", limit: 60
    t.string "pid", limit: 100
    t.integer "shopspay", default: 0, comment: "配送费用"
    t.string "shopname", limit: 100
    t.string "gid", limit: 90
    t.integer "order_ctime"
    t.integer "order_endtime"
    t.integer "print_time"
    t.string "print_name", limit: 100
    t.string "morecontent", limit: 200
    t.string "otel", limit: 80
    t.string "oman", limit: 100
    t.string "oaddress", limit: 200
    t.integer "orderstatus", default: 1
    t.string "ordersource", limit: 40
    t.integer "couponid", default: 0
    t.datetime "order_dtime"
    t.index ["oid", "orderprice", "ordercount", "orderstatus"], name: "oid"
  end

  create_table "sn_foodorderext", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "oid"
    t.integer "did"
    t.integer "fid"
    t.string "fname", limit: 100
    t.integer "fcid"
    t.string "fcname", limit: 100
    t.float "fprice", limit: 24
    t.integer "fcount"
    t.float "prices", limit: 24
    t.integer "muid"
    t.string "muname", limit: 100
    t.integer "time"
    t.string "fenliang", limit: 100
    t.string "kouwei", limit: 100
    t.integer "call_time"
    t.integer "print_time"
    t.integer "end_time"
    t.integer "status", default: 0
    t.string "gid", limit: 64
  end

  create_table "sn_link", primary_key: "lid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "type", default: 0
    t.string "linkname", limit: 200
    t.string "link", limit: 300
    t.string "linkpic", limit: 300
    t.string "des", limit: 300
    t.string "content", limit: 300
    t.integer "top", default: 0
    t.integer "create_time"
    t.integer "isweb", default: 0
  end

  create_table "sn_members", primary_key: "uid", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "username", limit: 60, default:"test", null:false
    t.string "userpass", limit: 90, default: "", null: false
    t.string "userpic", limit: 200, default:"", null: false
    t.string "useremail", limit: 100, default: "", null: false
    t.integer "usertel", default: 0
    t.string "nickname", limit: 50
    t.integer "userqq", null: false
    t.integer "usersex"
    t.integer "usergroup", default: 0
    t.string "last_login_ip", limit: 16, null: false
    t.integer "last_login_time"
    t.integer "create_time"
    t.string "userlevel", limit: 60, default: "0", null: false
    t.integer "userpoint", limit: 2, default: 0
    t.integer "userstatus", default: 0, null: false
    t.string "gid", limit: 100
    t.index ["nickname"], name: "user_nicename"
  end

  create_table "sn_message", primary_key: "msid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "mtype", default: 0
    t.integer "sid"
    t.string "sname", limit: 100
    t.integer "uid"
    t.string "uname", limit: 200
    t.string "upic", limit: 200
    t.string "mcontent", limit: 600
    t.integer "pid", default: 0
    t.integer "top", default: 0
    t.integer "create_time"
    t.integer "isweb", default: 0
  end

  create_table "sn_pages", primary_key: "pagid", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "page_fid", default: 0
    t.string "pagedir", limit: 30
    t.string "page_title", limit: 150
    t.text "page_content", limit: 16777215
    t.string "page_header", limit: 1000
    t.string "page_footer", limit: 1000
    t.string "page_key", limit: 100
    t.string "page_des", limit: 200
    t.string "pic", limit: 300
    t.string "pic2", limit: 300
    t.string "pic3", limit: 300
    t.string "pic4", limit: 300
    t.integer "sort", default: 0
    t.integer "create_time"
    t.integer "page_top", default: 0
    t.index ["pagid", "pagedir", "page_title"], name: "pagid"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
