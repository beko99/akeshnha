--Begin Tools.lua :)
local SUDO = 209099061 -- حـط ايـديك<===
local function index_function(user_id)
  for k,v in pairs(_config.admins) do
    if user_id == v[1] then
    	print(k)
      return k
    end
  end
  -- If not found
  return false
end

local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 

local function already_sudo(user_id)
  for k,v in pairs(_config.sudo_users) do
    if user_id == v then
      return k
    end
  end
  -- If not found
  return false
end

local function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end

local function sudolint(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 text = "*List of sudo users :*\n🔹◐◐◐◐◐●◐❂◑●◑◑◑◑🔹\n"
   else
 text = "*   🔸قائمة المطورين🔹  \n🔹◐◐◐◐◐●◐❂◑●◑◑◑◑🔹\n"
  end
for i=1,#sudo_users do
    text = text..i.." - "..sudo_users[i].."\n"
end
return text
end

local function adminlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 text = '*List of bot admins :*\n🔹◐◐◐◐◐●◐❂◑●◑◑◑◑🔹\n'
   else
 text = "*    🔸قائمة المسؤلين🔸*\n🔹◐◐◐◐◐●◐❂◑●◑◑◑◑🔹\n"
  end
		  	local compare = text
		  	local i = 1
		  	for v,user in pairs(_config.admins) do
			    text = text..i..'- '..(user[2] or '')..' ➢ ('..user[1]..')\n'
		  	i = i +1
		  	end
		  	if compare == text then
   if not lang then
		  		text = '_No_ *admins* _available_'
      else
		  		text = '*   🔹لا يوجد مسؤولين🔹  *'
           end
		  	end
		  	return text
    end

local function action_by_reply(arg, data)
    local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
    if cmd == "رفع مسؤول" then
local function adminprom_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_admin1(tonumber(data.id_)) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n _is already an_ *admin*", 0, "md")
  else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n *هو ضمن المسؤولين بالفعل 💡", 0, "md")
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n _has been promoted as_ *admin*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n تم رفع رتبتك مسؤول 💡", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, adminprom_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "حذف مسؤول" then
local function admindem_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
	local nameid = index_function(tonumber(data.id_))
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n _is not a_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n *هو ليس ضمن المسؤلين ⚠️", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n _has been demoted from_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n *تم حذف مسؤول من البوت ⚠️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, admindem_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "رفع مطور" then
local function visudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* 🖲️| User :* "..user_name.."\n *🖲️| ID : "..data.id_.."*\n _هو ضمن المطورين بالفعل 🔝
