--@d_1_t
--@DEV_s_o
local function run(msg, matches)
if matches[1] == 'help' and is_owner(msg) then
 local help = [[
/رفع ادمن ⇰ ⇰ لرفع ادمن
/تنزيل ادمن     ⇰ ⇰ لتنزيل ادمن
/ثبت           ⇰ ⇰ لتثبيت رساله
/احذف تثبيت  ⇰ ⇰ لحذف الرسائل المثبت
/الاعدادات ⇰ ⇰ لرؤية اعدادت الكروب
/ايدي              ⇰ ⇰ لمعرفة ايديك 
/احذف            ⇰ ⇰ لحذف رساله بلرد
➖➖➖➖➖➖➖➖➖➖➖
/قفل التعديل ⇰ ⇰ لقفل التعديل
/فتح التعديل  ⇰ ⇰ لفتح التعديل
/قفل الانلاين  ⇰ ⇰ لقفل انلاين
/فتح الانلاين  ⇰ ⇰ لفتح انلاين
/قفل الروابط ⇰ ⇰ لقفل الروابط
/فتح الروابط ⇰ ⇰ لفتح الروابط 
/قفل الملصقات ⇰ ⇰ لقفل الملصقات
/فتح الملصقات ⇰ ⇰ لفتح الملصقات
 /قفل التوجيه ⇰ ⇰ لقفل التوجيه 
/فتح التوجيه ⇰ ⇰ لفتح التوجيه
/قفل اليوزر ⇰ ⇰ لقفل المعرفات 
/فتح اليوزر ⇰ ⇰ لفتح المعرفات
/قفل السبام ⇰ ⇰ لقفل الكلايش
/فتح السبام ⇰ ⇰ لفتح الكلايش
➖➖➖➖➖➖➖➖➖➖➖
/قفل الكل ⇰ ⇰ لقفل الكل 
/فتح الكل ⇰ ⇰ لفتح الكل
/قفل الصور ⇰ ⇰ لقفل الصور
/فتح الصور ⇰ ⇰ لفتح الصور
/قفل الملقات ⇰ ⇰ لقفل الملفات
/فتح الملفات ⇰ ⇰ لفتح الملفات
/قفل المتحركه ⇰ ⇰ لقفل المتحركة
/فتح المتحركه ⇰ ⇰ لفتح المتحركة
/قفل الموسيقى ⇰ ⇰ mp3 لقفل
/فتح الموسيقى ⇰ ⇰ mp3 لفتح
/قفل البصمات ⇰ ⇰ لقفل البصمات
/قفل البصمات ⇰ ⇰ لفتح البصمات
/قفل الفيديو ⇰ ⇰ لقفل الفيديو
/فتح الفيديو ⇰ ⇰ لفتح الفيديو
➖➖➖➖➖➖➖➖➖➖➖➖
DEV           ⇰ ⇰ @d_1_t
CHBOT     ⇰ ⇰ @DEV_s_o
VR=V2
]]

               tg.sendMessage(msg.chat_id_, 0, 1, help, 1, 'html')

end
end
return {
  patterns = {
    "^[#!/](help)$",
  },
  run = run
}
--@d_1_t
--@DEV_s_o
