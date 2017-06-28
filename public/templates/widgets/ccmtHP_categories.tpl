<div class="row">
	<div class="col-lg-12 col-sm-12" has-widget-class="col-lg-9 col-sm-12" has-widget-target="sidebar">
		<ul class="categories" itemscope itemtype="http://www.schema.org/ItemList">
			<!-- BEGIN categories -->
			<li component="categories/category" data-cid="{../cid}" data-numRecentReplies="1" class="row clearfix c_custom">
				<meta itemprop="name" content="{../name}">

				<div class="content col-xs-12 <!-- IF config.hideCategoryLastPost -->col-md-10 col-sm-12<!-- ELSE -->col-md-7 col-sm-9<!-- ENDIF config.hideCategoryLastPost -->">
					<div class="icon pull-left" style="{function.generateCategoryBackground}">
						<i class="fa fa-fw {../icon}"></i>
					</div>

					<h2 class="title">
						<!-- IMPORT partials/categories/link.tpl --><br/>
						<!-- IF ../descriptionParsed -->
						<div class="description">
						{../descriptionParsed}
						</div>
						<!-- ENDIF ../descriptionParsed -->
						<!-- IF !config.hideSubCategories -->
						{function.generateChildrenCategories}
						<!-- ENDIF !config.hideSubCategories -->
					</h2>
					<span class="visible-xs pull-right">
						<!-- IF ../teaser.timestampISO -->
						<a class="permalink" href="{../teaser.url}">
							<small class="timeago" title="{../teaser.timestampISO}"></small>
						</a>
						<!-- ENDIF ../teaser.timestampISO -->
					</span>
				</div>

			</li>

			<!-- END categories -->
		</ul>
	</div>
</div>

<style media="screen">
	.c_custom{
		border: 1px solid #eeeeee;
    border-radius: 50px;
    margin: 2px;
	}
</style>
