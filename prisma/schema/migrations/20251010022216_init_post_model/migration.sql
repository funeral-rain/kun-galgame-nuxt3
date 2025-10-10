-- CreateTable
CREATE TABLE "chat_room" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "avatar" TEXT NOT NULL DEFAULT '',
    "type" TEXT NOT NULL,
    "last_message_content" TEXT NOT NULL DEFAULT '',
    "last_message_time" TIMESTAMP(3),
    "last_message_sender_id" INTEGER,
    "last_message_sender_name" TEXT NOT NULL DEFAULT '',
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chat_room_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_room_participant" (
    "id" SERIAL NOT NULL,
    "chat_room_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chat_room_participant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_room_admin" (
    "id" SERIAL NOT NULL,
    "chat_room_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chat_room_admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_message" (
    "id" SERIAL NOT NULL,
    "chatroom_name" TEXT NOT NULL,
    "content" VARCHAR(1000) NOT NULL,
    "is_recall" BOOLEAN NOT NULL DEFAULT false,
    "recall_time" TIMESTAMP(3),
    "edit_time" TIMESTAMP(3),
    "chat_room_id" INTEGER NOT NULL,
    "sender_id" INTEGER NOT NULL,
    "receiver_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chat_message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_message_read_by" (
    "id" SERIAL NOT NULL,
    "read_time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "chat_message_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chat_message_read_by_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_message_reaction" (
    "id" SERIAL NOT NULL,
    "reaction" TEXT NOT NULL,
    "chat_message_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chat_message_reaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_comment" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(1007) NOT NULL,
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "target_user_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_comment_like" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "galgame_comment_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_comment_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_history" (
    "id" SERIAL NOT NULL,
    "action" TEXT NOT NULL DEFAULT '',
    "type" TEXT NOT NULL DEFAULT '',
    "content" VARCHAR(1007) NOT NULL DEFAULT '',
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_link" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(107) NOT NULL DEFAULT '',
    "link" VARCHAR(233) NOT NULL DEFAULT '',
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_pr" (
    "id" SERIAL NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 0,
    "index" INTEGER NOT NULL DEFAULT 0,
    "note" VARCHAR(1007) NOT NULL DEFAULT '',
    "completed_time" TIMESTAMP(3),
    "old_data" JSONB,
    "new_data" JSONB,
    "user_id" INTEGER NOT NULL,
    "galgame_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_pr_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_resource" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL DEFAULT '',
    "language" TEXT NOT NULL DEFAULT '',
    "platform" TEXT NOT NULL DEFAULT '',
    "size" VARCHAR(107) NOT NULL DEFAULT '',
    "code" VARCHAR(1007) NOT NULL DEFAULT '',
    "password" VARCHAR(1007) NOT NULL DEFAULT '',
    "note" VARCHAR(1007) NOT NULL DEFAULT '',
    "update_time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" INTEGER NOT NULL DEFAULT 0,
    "download" INTEGER NOT NULL DEFAULT 0,
    "provider" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_resource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_resource_link" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "galgame_resource_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_resource_link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_resource_like" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "galgame_resource_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_resource_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(500) NOT NULL DEFAULT '',
    "description" VARCHAR(2000) NOT NULL DEFAULT '',
    "status" INTEGER NOT NULL DEFAULT 0,
    "view" INTEGER NOT NULL DEFAULT 0,
    "type" TEXT NOT NULL DEFAULT '',
    "language" TEXT NOT NULL DEFAULT '',
    "platform" TEXT NOT NULL DEFAULT '',
    "homepage" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "resource_update_time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "edited" TIMESTAMP(3),
    "version" VARCHAR(233) NOT NULL DEFAULT '',
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_contributor" (
    "id" SERIAL NOT NULL,
    "toolset_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_contributor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_practicality" (
    "id" SERIAL NOT NULL,
    "rate" INTEGER NOT NULL DEFAULT 1,
    "user_id" INTEGER NOT NULL,
    "toolset_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_practicality_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_alias" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "toolset_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_alias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_resource" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(1007) NOT NULL DEFAULT '',
    "type" TEXT NOT NULL DEFAULT '',
    "code" VARCHAR(1007) NOT NULL DEFAULT '',
    "password" VARCHAR(1007) NOT NULL DEFAULT '',
    "size" VARCHAR(107) NOT NULL DEFAULT '',
    "note" VARCHAR(1007) NOT NULL DEFAULT '',
    "download" INTEGER NOT NULL DEFAULT 0,
    "status" INTEGER NOT NULL DEFAULT 0,
    "edited" TIMESTAMP(3),
    "toolset_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_resource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "alias" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_category_relation" (
    "toolset_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_category_relation_pkey" PRIMARY KEY ("toolset_id","category_id")
);

-- CreateTable
CREATE TABLE "galgame_toolset_comment" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL DEFAULT '',
    "edited" TIMESTAMP(3),
    "user_id" INTEGER NOT NULL,
    "toolset_id" INTEGER NOT NULL,
    "parent_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_toolset_comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_website" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "create_time" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "icon" TEXT NOT NULL DEFAULT '',
    "view" INTEGER NOT NULL DEFAULT 0,
    "language" TEXT NOT NULL DEFAULT 'JA',
    "age_limit" TEXT NOT NULL DEFAULT 'all',
    "domain" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "category_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL DEFAULT 2,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_website_category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "label" TEXT NOT NULL DEFAULT '',
    "description" TEXT NOT NULL DEFAULT '',
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_website_tag" (
    "id" SERIAL NOT NULL,
    "level" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "label" TEXT NOT NULL DEFAULT '',
    "description" TEXT NOT NULL DEFAULT '',
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_website_tag_relation" (
    "galgame_website_id" INTEGER NOT NULL,
    "galgame_website_tag_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_tag_relation_pkey" PRIMARY KEY ("galgame_website_id","galgame_website_tag_id")
);

-- CreateTable
CREATE TABLE "galgame_website_comment" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL DEFAULT '',
    "edited" TIMESTAMP(3),
    "user_id" INTEGER NOT NULL,
    "website_id" INTEGER NOT NULL,
    "parent_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_website_like" (
    "user_id" INTEGER NOT NULL,
    "website_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_like_pkey" PRIMARY KEY ("user_id","website_id")
);

-- CreateTable
CREATE TABLE "galgame_website_favorite" (
    "user_id" INTEGER NOT NULL,
    "website_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_website_favorite_pkey" PRIMARY KEY ("user_id","website_id")
);

-- CreateTable
CREATE TABLE "galgame" (
    "id" SERIAL NOT NULL,
    "vndb_id" VARCHAR(10) NOT NULL,
    "name_en_us" VARCHAR(1000) NOT NULL DEFAULT '',
    "name_ja_jp" VARCHAR(1000) NOT NULL DEFAULT '',
    "name_zh_cn" VARCHAR(1000) NOT NULL DEFAULT '',
    "name_zh_tw" VARCHAR(1000) NOT NULL DEFAULT '',
    "banner" VARCHAR(233) NOT NULL DEFAULT '',
    "intro_en_us" TEXT NOT NULL DEFAULT '',
    "intro_ja_jp" TEXT NOT NULL DEFAULT '',
    "intro_zh_cn" TEXT NOT NULL DEFAULT '',
    "intro_zh_tw" TEXT NOT NULL DEFAULT '',
    "content_limit" VARCHAR(10) NOT NULL DEFAULT 'sfw',
    "status" INTEGER NOT NULL DEFAULT 0,
    "view" INTEGER NOT NULL DEFAULT 0,
    "resource_update_time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "original_language" TEXT NOT NULL DEFAULT 'ja-jp',
    "age_limit" TEXT NOT NULL DEFAULT 'r18',
    "user_id" INTEGER NOT NULL,
    "series_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_series" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(1000) NOT NULL DEFAULT '',
    "description" VARCHAR(2000) NOT NULL DEFAULT '',
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_series_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_alias" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "galgame_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_alias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_like" (
    "id" SERIAL NOT NULL,
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_favorite" (
    "id" SERIAL NOT NULL,
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_favorite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_contributor" (
    "id" SERIAL NOT NULL,
    "galgame_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_contributor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_official" (
    "id" SERIAL NOT NULL,
    "link" TEXT NOT NULL DEFAULT '',
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "lang" TEXT NOT NULL DEFAULT '',
    "description" TEXT NOT NULL DEFAULT '',
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_official_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_official_alias" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "galgame_official_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_official_alias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_engine" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "alias" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_engine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_tag" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "category" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_tag_alias" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "galgame_tag_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_tag_alias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_official_relation" (
    "galgame_id" INTEGER NOT NULL,
    "official_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_official_relation_pkey" PRIMARY KEY ("galgame_id","official_id")
);

-- CreateTable
CREATE TABLE "galgame_engine_relation" (
    "galgame_id" INTEGER NOT NULL,
    "engine_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_engine_relation_pkey" PRIMARY KEY ("galgame_id","engine_id")
);

-- CreateTable
CREATE TABLE "galgame_tag_relation" (
    "galgame_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,
    "spoiler_level" INTEGER NOT NULL DEFAULT 0,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_tag_relation_pkey" PRIMARY KEY ("galgame_id","tag_id")
);

-- CreateTable
CREATE TABLE "galgame_rating" (
    "id" SERIAL NOT NULL,
    "recommend" TEXT NOT NULL,
    "overall" INTEGER NOT NULL,
    "view" INTEGER NOT NULL DEFAULT 0,
    "galgame_type" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "play_status" TEXT NOT NULL DEFAULT 'not_started',
    "short_summary" VARCHAR(1314) NOT NULL DEFAULT '',
    "spoiler_level" TEXT NOT NULL DEFAULT 'none',
    "art" INTEGER NOT NULL DEFAULT 0,
    "story" INTEGER NOT NULL DEFAULT 0,
    "music" INTEGER NOT NULL DEFAULT 0,
    "character" INTEGER NOT NULL DEFAULT 0,
    "route" INTEGER NOT NULL DEFAULT 0,
    "system" INTEGER NOT NULL DEFAULT 0,
    "voice" INTEGER NOT NULL DEFAULT 0,
    "replay_value" INTEGER NOT NULL DEFAULT 0,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "galgame_id" INTEGER NOT NULL,

    CONSTRAINT "galgame_rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_rating_like" (
    "id" SERIAL NOT NULL,
    "galgame_rating_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_rating_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "galgame_rating_comment" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(1314) NOT NULL DEFAULT '',
    "galgame_rating_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "target_user_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "galgame_rating_comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "message" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(233) NOT NULL DEFAULT '',
    "link" VARCHAR(100) NOT NULL DEFAULT '',
    "status" TEXT NOT NULL DEFAULT 'unread',
    "type" TEXT NOT NULL,
    "sender_id" INTEGER NOT NULL,
    "receiver_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "system_message" (
    "id" SERIAL NOT NULL,
    "content_en_us" TEXT NOT NULL DEFAULT '',
    "content_ja_jp" TEXT NOT NULL DEFAULT '',
    "content_zh_cn" TEXT NOT NULL DEFAULT '',
    "content_zh_tw" TEXT NOT NULL DEFAULT '',
    "status" TEXT NOT NULL DEFAULT 'unread',
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "system_message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report" (
    "id" SERIAL NOT NULL,
    "reason" VARCHAR(1007) NOT NULL,
    "type" TEXT NOT NULL DEFAULT '',
    "status" INTEGER NOT NULL DEFAULT 0,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "report_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "todo" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL DEFAULT 'forum',
    "status" INTEGER NOT NULL DEFAULT 0,
    "content_en_us" TEXT NOT NULL DEFAULT '',
    "content_ja_jp" TEXT NOT NULL DEFAULT '',
    "content_zh_cn" TEXT NOT NULL DEFAULT '',
    "content_zh_tw" TEXT NOT NULL DEFAULT '',
    "completed_time" TIMESTAMP(3),
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "todo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_comment" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(1007) NOT NULL DEFAULT '',
    "topic_id" INTEGER NOT NULL,
    "topic_reply_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "target_user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_comment_like" (
    "id" SERIAL NOT NULL,
    "topic_comment_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_comment_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_poll" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "description" VARCHAR(500) NOT NULL DEFAULT '',
    "type" TEXT NOT NULL DEFAULT 'single',
    "min_choice" INTEGER NOT NULL DEFAULT 1,
    "max_choice" INTEGER NOT NULL DEFAULT 1,
    "deadline" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'open',
    "notification_sent" BOOLEAN NOT NULL DEFAULT false,
    "result_visibility" TEXT NOT NULL DEFAULT 'always',
    "is_anonymous" BOOLEAN NOT NULL DEFAULT false,
    "can_change_vote" BOOLEAN NOT NULL DEFAULT true,
    "topic_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_poll_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_poll_option" (
    "id" SERIAL NOT NULL,
    "text" VARCHAR(100) NOT NULL,
    "poll_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_poll_option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_poll_vote" (
    "id" SERIAL NOT NULL,
    "poll_id" INTEGER NOT NULL,
    "option_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_poll_vote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_reply" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL DEFAULT '',
    "floor" INTEGER NOT NULL DEFAULT 0,
    "edited" TIMESTAMP(3),
    "user_id" INTEGER NOT NULL,
    "topic_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_reply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_reply_like" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "topic_reply_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_reply_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_reply_dislike" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "topic_reply_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_reply_dislike_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_reply_target" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL DEFAULT '',
    "reply_id" INTEGER NOT NULL,
    "target_reply_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_reply_target_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(233) NOT NULL,
    "content" TEXT NOT NULL,
    "view" INTEGER NOT NULL DEFAULT 0,
    "is_nsfw" BOOLEAN NOT NULL DEFAULT false,
    "status" INTEGER NOT NULL DEFAULT 0,
    "category" TEXT NOT NULL,
    "tag" TEXT[],
    "status_update_time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "edited" TIMESTAMP(3),
    "upvote_time" TIMESTAMP(3),
    "user_id" INTEGER NOT NULL,
    "best_answer_id" INTEGER,
    "pinned_reply_id" INTEGER,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_section" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_section_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_section_relation" (
    "topic_id" INTEGER NOT NULL,
    "topic_section_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_section_relation_pkey" PRIMARY KEY ("topic_id","topic_section_id")
);

-- CreateTable
CREATE TABLE "topic_upvote" (
    "id" SERIAL NOT NULL,
    "topic_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_upvote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_like" (
    "id" SERIAL NOT NULL,
    "topic_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_dislike" (
    "id" SERIAL NOT NULL,
    "topic_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_dislike_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topic_favorite" (
    "id" SERIAL NOT NULL,
    "topic_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "topic_favorite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "unmoe" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "result" TEXT NOT NULL DEFAULT '',
    "desc_en_us" TEXT NOT NULL DEFAULT '',
    "desc_ja_jp" TEXT NOT NULL DEFAULT '',
    "desc_zh_cn" TEXT NOT NULL DEFAULT '',
    "desc_zh_tw" TEXT NOT NULL DEFAULT '',
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "unmoe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "update_log" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "version" TEXT NOT NULL DEFAULT '',
    "content_en_us" TEXT NOT NULL DEFAULT '',
    "content_ja_jp" TEXT NOT NULL DEFAULT '',
    "content_zh_cn" TEXT NOT NULL DEFAULT '',
    "content_zh_tw" TEXT NOT NULL DEFAULT '',
    "user_id" INTEGER NOT NULL DEFAULT 2,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "update_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "ip" TEXT NOT NULL DEFAULT '',
    "avatar" TEXT NOT NULL DEFAULT '',
    "role" INTEGER NOT NULL DEFAULT 1,
    "status" INTEGER NOT NULL DEFAULT 0,
    "moemoepoint" INTEGER NOT NULL DEFAULT 7,
    "bio" VARCHAR(107) NOT NULL DEFAULT '',
    "daily_check_in" INTEGER NOT NULL DEFAULT 0,
    "daily_image_count" INTEGER NOT NULL DEFAULT 0,
    "daily_toolset_upload_count" INTEGER NOT NULL DEFAULT 0,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_friend" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "friend_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_friend_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_follow" (
    "id" SERIAL NOT NULL,
    "follower_id" INTEGER NOT NULL,
    "followed_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_follow_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "chat_room_name_key" ON "chat_room"("name");

-- CreateIndex
CREATE UNIQUE INDEX "chat_room_participant_chat_room_id_user_id_key" ON "chat_room_participant"("chat_room_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "chat_room_admin_chat_room_id_user_id_key" ON "chat_room_admin"("chat_room_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "chat_message_read_by_chat_message_id_user_id_key" ON "chat_message_read_by"("chat_message_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "chat_message_reaction_chat_message_id_user_id_reaction_key" ON "chat_message_reaction"("chat_message_id", "user_id", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_comment_like_galgame_comment_id_user_id_key" ON "galgame_comment_like"("galgame_comment_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_resource_link_galgame_resource_id_url_key" ON "galgame_resource_link"("galgame_resource_id", "url");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_resource_like_galgame_resource_id_user_id_key" ON "galgame_resource_like"("galgame_resource_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_toolset_contributor_toolset_id_user_id_key" ON "galgame_toolset_contributor"("toolset_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_toolset_alias_toolset_id_name_key" ON "galgame_toolset_alias"("toolset_id", "name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_toolset_resource_toolset_id_content_key" ON "galgame_toolset_resource"("toolset_id", "content");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_toolset_category_name_key" ON "galgame_toolset_category"("name");

-- CreateIndex
CREATE INDEX "galgame_toolset_comment_toolset_id_idx" ON "galgame_toolset_comment"("toolset_id");

-- CreateIndex
CREATE INDEX "galgame_toolset_comment_user_id_idx" ON "galgame_toolset_comment"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_website_name_key" ON "galgame_website"("name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_website_url_key" ON "galgame_website"("url");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_website_category_name_key" ON "galgame_website_category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_website_tag_name_key" ON "galgame_website_tag"("name");

-- CreateIndex
CREATE INDEX "galgame_website_comment_website_id_idx" ON "galgame_website_comment"("website_id");

-- CreateIndex
CREATE INDEX "galgame_website_comment_user_id_idx" ON "galgame_website_comment"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_vndb_id_key" ON "galgame"("vndb_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_series_name_key" ON "galgame_series"("name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_alias_galgame_id_name_key" ON "galgame_alias"("galgame_id", "name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_like_galgame_id_user_id_key" ON "galgame_like"("galgame_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_favorite_galgame_id_user_id_key" ON "galgame_favorite"("galgame_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_contributor_galgame_id_user_id_key" ON "galgame_contributor"("galgame_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_official_name_key" ON "galgame_official"("name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_official_alias_galgame_official_id_name_key" ON "galgame_official_alias"("galgame_official_id", "name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_engine_name_key" ON "galgame_engine"("name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_tag_name_key" ON "galgame_tag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_tag_alias_galgame_tag_id_name_key" ON "galgame_tag_alias"("galgame_tag_id", "name");

-- CreateIndex
CREATE INDEX "galgame_rating_galgame_id_idx" ON "galgame_rating"("galgame_id");

-- CreateIndex
CREATE INDEX "galgame_rating_overall_idx" ON "galgame_rating"("overall");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_rating_user_id_galgame_id_key" ON "galgame_rating"("user_id", "galgame_id");

-- CreateIndex
CREATE UNIQUE INDEX "galgame_rating_like_galgame_rating_id_user_id_key" ON "galgame_rating_like"("galgame_rating_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_comment_like_topic_comment_id_user_id_key" ON "topic_comment_like"("topic_comment_id", "user_id");

-- CreateIndex
CREATE INDEX "topic_poll_vote_user_id_poll_id_idx" ON "topic_poll_vote"("user_id", "poll_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_poll_vote_poll_id_option_id_user_id_key" ON "topic_poll_vote"("poll_id", "option_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_reply_like_user_id_topic_reply_id_key" ON "topic_reply_like"("user_id", "topic_reply_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_reply_dislike_user_id_topic_reply_id_key" ON "topic_reply_dislike"("user_id", "topic_reply_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_reply_target_reply_id_target_reply_id_key" ON "topic_reply_target"("reply_id", "target_reply_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_best_answer_id_key" ON "topic"("best_answer_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_pinned_reply_id_key" ON "topic"("pinned_reply_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_like_topic_id_user_id_key" ON "topic_like"("topic_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_dislike_topic_id_user_id_key" ON "topic_dislike"("topic_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "topic_favorite_topic_id_user_id_key" ON "topic_favorite"("topic_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_name_key" ON "user"("name");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_friend_user_id_friend_id_key" ON "user_friend"("user_id", "friend_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_follow_follower_id_followed_id_key" ON "user_follow"("follower_id", "followed_id");

-- AddForeignKey
ALTER TABLE "chat_room_participant" ADD CONSTRAINT "chat_room_participant_chat_room_id_fkey" FOREIGN KEY ("chat_room_id") REFERENCES "chat_room"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_room_participant" ADD CONSTRAINT "chat_room_participant_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_room_admin" ADD CONSTRAINT "chat_room_admin_chat_room_id_fkey" FOREIGN KEY ("chat_room_id") REFERENCES "chat_room"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_room_admin" ADD CONSTRAINT "chat_room_admin_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message" ADD CONSTRAINT "chat_message_chat_room_id_fkey" FOREIGN KEY ("chat_room_id") REFERENCES "chat_room"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message" ADD CONSTRAINT "chat_message_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message" ADD CONSTRAINT "chat_message_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message_read_by" ADD CONSTRAINT "chat_message_read_by_chat_message_id_fkey" FOREIGN KEY ("chat_message_id") REFERENCES "chat_message"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message_read_by" ADD CONSTRAINT "chat_message_read_by_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message_reaction" ADD CONSTRAINT "chat_message_reaction_chat_message_id_fkey" FOREIGN KEY ("chat_message_id") REFERENCES "chat_message"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chat_message_reaction" ADD CONSTRAINT "chat_message_reaction_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_comment" ADD CONSTRAINT "galgame_comment_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_comment" ADD CONSTRAINT "galgame_comment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_comment" ADD CONSTRAINT "galgame_comment_target_user_id_fkey" FOREIGN KEY ("target_user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_comment_like" ADD CONSTRAINT "galgame_comment_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_comment_like" ADD CONSTRAINT "galgame_comment_like_galgame_comment_id_fkey" FOREIGN KEY ("galgame_comment_id") REFERENCES "galgame_comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_history" ADD CONSTRAINT "galgame_history_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_history" ADD CONSTRAINT "galgame_history_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_link" ADD CONSTRAINT "galgame_link_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_link" ADD CONSTRAINT "galgame_link_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_pr" ADD CONSTRAINT "galgame_pr_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_pr" ADD CONSTRAINT "galgame_pr_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_resource" ADD CONSTRAINT "galgame_resource_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_resource" ADD CONSTRAINT "galgame_resource_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_resource_link" ADD CONSTRAINT "galgame_resource_link_galgame_resource_id_fkey" FOREIGN KEY ("galgame_resource_id") REFERENCES "galgame_resource"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_resource_like" ADD CONSTRAINT "galgame_resource_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_resource_like" ADD CONSTRAINT "galgame_resource_like_galgame_resource_id_fkey" FOREIGN KEY ("galgame_resource_id") REFERENCES "galgame_resource"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset" ADD CONSTRAINT "galgame_toolset_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_contributor" ADD CONSTRAINT "galgame_toolset_contributor_toolset_id_fkey" FOREIGN KEY ("toolset_id") REFERENCES "galgame_toolset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_contributor" ADD CONSTRAINT "galgame_toolset_contributor_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_practicality" ADD CONSTRAINT "galgame_toolset_practicality_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_practicality" ADD CONSTRAINT "galgame_toolset_practicality_toolset_id_fkey" FOREIGN KEY ("toolset_id") REFERENCES "galgame_toolset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_alias" ADD CONSTRAINT "galgame_toolset_alias_toolset_id_fkey" FOREIGN KEY ("toolset_id") REFERENCES "galgame_toolset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_resource" ADD CONSTRAINT "galgame_toolset_resource_toolset_id_fkey" FOREIGN KEY ("toolset_id") REFERENCES "galgame_toolset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_resource" ADD CONSTRAINT "galgame_toolset_resource_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_category_relation" ADD CONSTRAINT "galgame_toolset_category_relation_toolset_id_fkey" FOREIGN KEY ("toolset_id") REFERENCES "galgame_toolset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_category_relation" ADD CONSTRAINT "galgame_toolset_category_relation_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "galgame_toolset_category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_comment" ADD CONSTRAINT "galgame_toolset_comment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_comment" ADD CONSTRAINT "galgame_toolset_comment_toolset_id_fkey" FOREIGN KEY ("toolset_id") REFERENCES "galgame_toolset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_toolset_comment" ADD CONSTRAINT "galgame_toolset_comment_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "galgame_toolset_comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website" ADD CONSTRAINT "galgame_website_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "galgame_website_category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website" ADD CONSTRAINT "galgame_website_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_tag_relation" ADD CONSTRAINT "galgame_website_tag_relation_galgame_website_id_fkey" FOREIGN KEY ("galgame_website_id") REFERENCES "galgame_website"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_tag_relation" ADD CONSTRAINT "galgame_website_tag_relation_galgame_website_tag_id_fkey" FOREIGN KEY ("galgame_website_tag_id") REFERENCES "galgame_website_tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_comment" ADD CONSTRAINT "galgame_website_comment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_comment" ADD CONSTRAINT "galgame_website_comment_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "galgame_website"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_comment" ADD CONSTRAINT "galgame_website_comment_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "galgame_website_comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_like" ADD CONSTRAINT "galgame_website_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_like" ADD CONSTRAINT "galgame_website_like_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "galgame_website"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_favorite" ADD CONSTRAINT "galgame_website_favorite_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_website_favorite" ADD CONSTRAINT "galgame_website_favorite_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "galgame_website"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame" ADD CONSTRAINT "galgame_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame" ADD CONSTRAINT "galgame_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "galgame_series"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_alias" ADD CONSTRAINT "galgame_alias_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_like" ADD CONSTRAINT "galgame_like_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_like" ADD CONSTRAINT "galgame_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_favorite" ADD CONSTRAINT "galgame_favorite_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_favorite" ADD CONSTRAINT "galgame_favorite_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_contributor" ADD CONSTRAINT "galgame_contributor_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_contributor" ADD CONSTRAINT "galgame_contributor_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_official_alias" ADD CONSTRAINT "galgame_official_alias_galgame_official_id_fkey" FOREIGN KEY ("galgame_official_id") REFERENCES "galgame_official"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_tag_alias" ADD CONSTRAINT "galgame_tag_alias_galgame_tag_id_fkey" FOREIGN KEY ("galgame_tag_id") REFERENCES "galgame_tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_official_relation" ADD CONSTRAINT "galgame_official_relation_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_official_relation" ADD CONSTRAINT "galgame_official_relation_official_id_fkey" FOREIGN KEY ("official_id") REFERENCES "galgame_official"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_engine_relation" ADD CONSTRAINT "galgame_engine_relation_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_engine_relation" ADD CONSTRAINT "galgame_engine_relation_engine_id_fkey" FOREIGN KEY ("engine_id") REFERENCES "galgame_engine"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_tag_relation" ADD CONSTRAINT "galgame_tag_relation_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_tag_relation" ADD CONSTRAINT "galgame_tag_relation_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "galgame_tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating" ADD CONSTRAINT "galgame_rating_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating" ADD CONSTRAINT "galgame_rating_galgame_id_fkey" FOREIGN KEY ("galgame_id") REFERENCES "galgame"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating_like" ADD CONSTRAINT "galgame_rating_like_galgame_rating_id_fkey" FOREIGN KEY ("galgame_rating_id") REFERENCES "galgame_rating"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating_like" ADD CONSTRAINT "galgame_rating_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating_comment" ADD CONSTRAINT "galgame_rating_comment_galgame_rating_id_fkey" FOREIGN KEY ("galgame_rating_id") REFERENCES "galgame_rating"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating_comment" ADD CONSTRAINT "galgame_rating_comment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "galgame_rating_comment" ADD CONSTRAINT "galgame_rating_comment_target_user_id_fkey" FOREIGN KEY ("target_user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "message" ADD CONSTRAINT "message_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "message" ADD CONSTRAINT "message_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "system_message" ADD CONSTRAINT "system_message_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "todo" ADD CONSTRAINT "todo_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_comment" ADD CONSTRAINT "topic_comment_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_comment" ADD CONSTRAINT "topic_comment_topic_reply_id_fkey" FOREIGN KEY ("topic_reply_id") REFERENCES "topic_reply"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_comment" ADD CONSTRAINT "topic_comment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_comment" ADD CONSTRAINT "topic_comment_target_user_id_fkey" FOREIGN KEY ("target_user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_comment_like" ADD CONSTRAINT "topic_comment_like_topic_comment_id_fkey" FOREIGN KEY ("topic_comment_id") REFERENCES "topic_comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_comment_like" ADD CONSTRAINT "topic_comment_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_poll" ADD CONSTRAINT "topic_poll_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_poll" ADD CONSTRAINT "topic_poll_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_poll_option" ADD CONSTRAINT "topic_poll_option_poll_id_fkey" FOREIGN KEY ("poll_id") REFERENCES "topic_poll"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_poll_vote" ADD CONSTRAINT "topic_poll_vote_poll_id_fkey" FOREIGN KEY ("poll_id") REFERENCES "topic_poll"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_poll_vote" ADD CONSTRAINT "topic_poll_vote_option_id_fkey" FOREIGN KEY ("option_id") REFERENCES "topic_poll_option"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_poll_vote" ADD CONSTRAINT "topic_poll_vote_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply" ADD CONSTRAINT "topic_reply_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply" ADD CONSTRAINT "topic_reply_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply_like" ADD CONSTRAINT "topic_reply_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply_like" ADD CONSTRAINT "topic_reply_like_topic_reply_id_fkey" FOREIGN KEY ("topic_reply_id") REFERENCES "topic_reply"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply_dislike" ADD CONSTRAINT "topic_reply_dislike_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply_dislike" ADD CONSTRAINT "topic_reply_dislike_topic_reply_id_fkey" FOREIGN KEY ("topic_reply_id") REFERENCES "topic_reply"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply_target" ADD CONSTRAINT "topic_reply_target_reply_id_fkey" FOREIGN KEY ("reply_id") REFERENCES "topic_reply"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_reply_target" ADD CONSTRAINT "topic_reply_target_target_reply_id_fkey" FOREIGN KEY ("target_reply_id") REFERENCES "topic_reply"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic" ADD CONSTRAINT "topic_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic" ADD CONSTRAINT "topic_best_answer_id_fkey" FOREIGN KEY ("best_answer_id") REFERENCES "topic_reply"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "topic" ADD CONSTRAINT "topic_pinned_reply_id_fkey" FOREIGN KEY ("pinned_reply_id") REFERENCES "topic_reply"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "topic_section_relation" ADD CONSTRAINT "topic_section_relation_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_section_relation" ADD CONSTRAINT "topic_section_relation_topic_section_id_fkey" FOREIGN KEY ("topic_section_id") REFERENCES "topic_section"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_upvote" ADD CONSTRAINT "topic_upvote_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_upvote" ADD CONSTRAINT "topic_upvote_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_like" ADD CONSTRAINT "topic_like_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_like" ADD CONSTRAINT "topic_like_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_dislike" ADD CONSTRAINT "topic_dislike_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_dislike" ADD CONSTRAINT "topic_dislike_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_favorite" ADD CONSTRAINT "topic_favorite_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "topic_favorite" ADD CONSTRAINT "topic_favorite_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "unmoe" ADD CONSTRAINT "unmoe_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "update_log" ADD CONSTRAINT "update_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_friend" ADD CONSTRAINT "user_friend_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_friend" ADD CONSTRAINT "user_friend_friend_id_fkey" FOREIGN KEY ("friend_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_follow" ADD CONSTRAINT "user_follow_follower_id_fkey" FOREIGN KEY ("follower_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_follow" ADD CONSTRAINT "user_follow_followed_id_fkey" FOREIGN KEY ("followed_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
