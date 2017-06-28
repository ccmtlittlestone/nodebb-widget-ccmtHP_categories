(function(module) {
	"use strict";

	var async = module.parent.require('async');
	var nconf = module.parent.require('nconf');
	var validator = module.parent.require('validator');
	var fs = require('fs');
	var path = require('path');
	var db = module.parent.require('./database');
	var categories = module.parent.require('./categories');
	var user = module.parent.require('./user');
	var plugins = module.parent.require('./plugins');
	var topics = module.parent.require('./topics');
	var posts = module.parent.require('./posts');
	var groups = module.parent.require('./groups');
	var translator = module.parent.require('../public/src/modules/translator');
	var templates = module.parent.require('templates.js');
	var websockets = module.parent.require('./socket.io');
	var settings = module.parent.require('./settings');
	var socketAdmin = module.parent.require('./socket.io/admin');
	var defaultSettings = { title: 'Recent Topics', opacity: '1.0', textShadow: 'none', enableCarousel: 1, enableCarouselPagination: 1 };
	var app;


	var Widget = {};

	Widget.init = function(params, callback) {
		app = params.app;

		const router = params.router,
					hostMiddleware = params.middleware,
					hostControllers = params.controllers;

		router.get('/admin/plugins/ccmtHP_categories', hostMiddleware.admin.buildHeader, Widget.renderAdminPage);
		router.get('/api/admin/plugins/ccmtHP_categories', Widget.renderAdminPage);
		callback();

		Widget.settings = new settings('ccmtHP_categories', '1.0.0', defaultSettings);
		socketAdmin.settings.syncCcmtHP_categories = function () {
			Widget.settings.sync();
		};
	};

	Widget.renderAdminPage = function(req,res,next){
		res.render('admin/ccmtHP_categories', {});
	}

	Widget.addAdminNavigation = function(header, callback) {
		header.plugins.push({
			route: '/plugins/ccmtHP_categories',
			icon: 'fa-tint',
			name: 'ccmtHP_categories'
		});

		callback(null, header);
	};

	Widget.defineWidgets=function(widgets,callback){
		widgets = widgets.concat([
			{
			widget: 'ccmtHP_categories',
			name: 'ccmtHP_categories',
			description: 'a categories widgets for homepage',
			content: 'admin/ccmtHP_categories'
			}
		]);

		callback(null, widgets);
	}

	Widget.renderCcmtHP_categories=function(widget,callback){
		const uid=widget.req.uid;
		widget.data.cids=Widget.settings.get('cids').split(",");
		categories.getCategories(widget.data.cids,uid,function(err,cate){
			app.render('widgets/ccmtHP_categories',{categories:cate},callback);
		})

	}

	module.exports = Widget;
}(module));
