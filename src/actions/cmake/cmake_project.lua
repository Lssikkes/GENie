--
-- _cmake.lua
-- Define the CMake action(s).
-- Copyright (c) 2015 Miodrag Milanovic
--

local cmake = premake.cmake
local tree = premake.tree

function cmake.files(prj)
	local tr = premake.project.buildsourcetree(prj)
	tree.traverse(tr, {
		onbranchenter = function(node, depth)
		end,
		onbranchexit = function(node, depth)
		end,
		onleaf = function(node, depth)
			_p(1, '../%s', node.cfg.name)
		end,
	}, true, 1)
end

function premake.cmake.project(prj)
	io.indent = "  "
	_p('cmake_minimum_required(VERSION 2.8.4)')
	_p('')
	local target=premake.esc(prj.name)
	local tool = premake.gettool(prj)
	_p('project(%s)', target)
	_p('set(')
	_p('source_list')
	cmake.files(prj)
	_p(')')

	local platforms = premake.filterplatforms(prj.solution, premake[_OPTIONS.cc].platforms, "Native")
	for i = #platforms, 1, -1 do
		if premake.platforms[platforms[i]].iscrosscompiler then
			table.remove(platforms, i)
		end
	end 
	
	for _, platform in ipairs(platforms) do
		for cfg in premake.eachconfig(prj, platform) do
			for _,v in ipairs(cfg.includedirs) do
				_p('include_directories(../%s)', premake.esc(v))
			end
			for _,v in ipairs(cfg.defines) do
				_p('add_definitions(-D%s)', premake.esc(v))
			end
			for _,v in ipairs(premake.getlinks(cfg, "all", "directory")) do
				_p('link_directories(%s)', premake.esc(v))
			end
			local flags = {
				defines   =(tool.getdefines(cfg.defines)),
				includes  =(table.join(tool.getincludedirs(cfg.includedirs), tool.getquoteincludedirs(cfg.userincludedirs))),
				cppflags  =(tool.getcppflags(cfg)),
				cflags    = (table.join(tool.getcflags(cfg), cfg.buildoptions, cfg.buildoptions_c)),
				cxxflags  = (table.join(tool.getcflags(cfg), tool.getcxxflags(cfg), cfg.buildoptions, cfg.buildoptions_cpp)),
				objcflags = (table.join(tool.getcflags(cfg), tool.getcxxflags(cfg), cfg.buildoptions, cfg.buildoptions_objc)),
			}
			for _,v in ipairs(flags.cflags) do			
				_p('set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} %s")', premake.esc(v))
			end
			for _,v in ipairs(flags.cxxflags) do			
				_p('set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} %s")', premake.esc(v))
			end
			break
		end
		break
	end

	if (prj.kind=='StaticLib') then
		_p('add_library(%s STATIC ${source_list})',premake.esc(prj.name))
	end
	if (prj.kind=='SharedLib') then
		_p('add_library(%s SHARED ${source_list})',premake.esc(prj.name))
	end
	if (prj.kind=='ConsoleApp') then
		_p('add_executable(%s ${source_list})',premake.esc(prj.name))
	end
	if (prj.kind=='WindowedApp') then
		_p('add_executable(%s ${source_list})',premake.esc(prj.name))
	end

	for _, platform in ipairs(platforms) do
		for cfg in premake.eachconfig(prj, platform) do
			local flags = cfg.linkoptions
			for _,v in ipairs(flags) do
				_p('target_link_libraries(%s %s)', target, premake.esc(v))
			end
			for _,v in ipairs(premake.getlinks(cfg, "all", "basename")) do
				_p('target_link_libraries(%s %s)', target, premake.esc(v))
			end
			break
		end
		break
	end
end
