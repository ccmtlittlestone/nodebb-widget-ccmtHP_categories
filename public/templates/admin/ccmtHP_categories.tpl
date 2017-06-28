<div class="row">
  <div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">ccmtHP_categories settings</div>
			<div class="panel-body">
				<form role="form" id="ccmtHP_categories">
					<!-- <div class="form-group">
						<label for="opacity">ico1</label>
						<input type="text" id="ico1" data-key="ico1" title="ico1" class="form-control" placeholder="">
					</div>
          <div class="form-group">
						<label for="opacity">tit1</label>
						<input type="text" id="tit1" data-key="tit1" title="tit1" class="form-control" placeholder="">
					</div>
          <div class="form-group">
						<label for="opacity">url1</label>
						<input type="text" id="url1" data-key="url1" title="url1" class="form-control" placeholder="">
					</div> -->

          <div class="form-group">
            <input type="text" id="cids" data-key="cids" title="cids" class="form-control" placeholder="">
          </div>

				</form>
			</div>
		</div>
	</div>

  <div class="col-lg-3">
    <div class="panel panel-default">
      <div class="panel-heading">Control Panel</div>
      <div class="panel-body">
        <button class="btn btn-primary" id="save">Save Settings</button>
      </div>
    </div>
  </div>
</div>

<script>
require(['settings'], function(settings) {

	settings.sync('ccmtHP_categories', $('#ccmtHP_categories'));

	$('#save').click( function (event) {
		settings.persist('ccmtHP_categories', $('#ccmtHP_categories'), function(){
			socket.emit('admin.settings.syncCcmtHP_categories');
			app.alertSuccess('Please restart your forum for changes to fully take effect.');
		});
    // socket.emit('admin.settings.syncccmtHP_categories');
	});
});

</script>
