diff --git a/handlers/views_handler_argument.inc b/handlers/views_handler_argument.inc
index 05644cf..fb0dd01 100644
--- a/handlers/views_handler_argument.inc
+++ b/handlers/views_handler_argument.inc
@@ -45,7 +45,7 @@ class views_handler_argument extends views_handler {
     }
   }
 
-  function init(&$view, &$options) {
+  function init(&$view, $options) {
     parent::init($view, $options);
   }
 
@@ -713,7 +713,7 @@ class views_handler_argument extends views_handler {
     if (isset($this->argument)) {
       return $this->argument;
     }
-    
+
     // Otherwise, we have to pretend to process ourself to find the value.
     $value = NULL;
     // Find the position of this argument within the view.
diff --git a/handlers/views_handler_argument_many_to_one.inc b/handlers/views_handler_argument_many_to_one.inc
index cc887d4..ee6f2f4 100644
--- a/handlers/views_handler_argument_many_to_one.inc
+++ b/handlers/views_handler_argument_many_to_one.inc
@@ -7,13 +7,13 @@
  * - numeric: If true, the field will be considered numeric. Probably should
  *   always be set TRUE as views_handler_argument_string has many to one
  *   capabilities.
- * - zero is null: If true, a 0 will be handled as empty, so for example 
+ * - zero is null: If true, a 0 will be handled as empty, so for example
  *   a default argument can be provided or a summary can be shown.
  *
  * @ingroup views_argument_handlers
  */
 class views_handler_argument_many_to_one extends views_handler_argument {
-  function init(&$view, &$options) {
+  function init(&$view, $options) {
     parent::init($view, $options);
     $this->helper = new views_many_to_one_helper($this);
 
diff --git a/handlers/views_handler_argument_string.inc b/handlers/views_handler_argument_string.inc
index ae7dd1e..52665ce 100644
--- a/handlers/views_handler_argument_string.inc
+++ b/handlers/views_handler_argument_string.inc
@@ -7,7 +7,7 @@
  * @ingroup views_argument_handlers
  */
 class views_handler_argument_string extends views_handler_argument {
-  function init(&$view, &$options) {
+  function init(&$view, $options) {
     parent::init($view, $options);
     if (!empty($this->definition['many to one'])) {
       $this->helper = new views_many_to_one_helper($this);
@@ -204,7 +204,7 @@ class views_handler_argument_string extends views_handler_argument {
 
   function case_transform($string, $option) {
 		global $multibyte;
-		
+
     switch ($this->options[$option]) {
       default:
         return $string;
diff --git a/handlers/views_handler_filter.inc b/handlers/views_handler_filter.inc
index 49b93e5..2718042 100644
--- a/handlers/views_handler_filter.inc
+++ b/handlers/views_handler_filter.inc
@@ -101,7 +101,7 @@ class views_handler_filter extends views_handler {
   /**
    * Simple validate handler
    */
-  function options_validate(&$form, &$form_state) {
+  function options_validate($form, &$form_state) {
     $this->operator_validate($form, $form_state);
     $this->value_validate($form, $form_state);
     if (!empty($this->options['exposed'])) {
@@ -113,7 +113,7 @@ class views_handler_filter extends views_handler {
   /**
    * Simple submit handler
    */
-  function options_submit(&$form, &$form_state) {
+  function options_submit($form, &$form_state) {
     unset($form_state['values']['expose_button']); // don't store this.
     $this->operator_submit($form, $form_state);
     $this->value_submit($form, $form_state);
diff --git a/handlers/views_handler_filter_boolean_operator.inc b/handlers/views_handler_filter_boolean_operator.inc
index c2ec624..ec9e415 100644
--- a/handlers/views_handler_filter_boolean_operator.inc
+++ b/handlers/views_handler_filter_boolean_operator.inc
@@ -108,7 +108,7 @@ class views_handler_filter_boolean_operator extends views_handler_filter {
     }
   }
 
-  function value_validate(&$form, &$form_state) {
+  function value_validate($form, &$form_state) {
     if ($form_state['values']['options']['value'] == 'All' && empty($form_state['values']['options']['expose']['optional'])) {
       form_set_error('value', t('You must select a value unless this is an optional exposed filter.'));
     }
diff --git a/handlers/views_handler_filter_date.inc b/handlers/views_handler_filter_date.inc
index 356ec78..98007b8 100644
--- a/handlers/views_handler_filter_date.inc
+++ b/handlers/views_handler_filter_date.inc
@@ -31,7 +31,7 @@ class views_handler_filter_date extends views_handler_filter_numeric {
     parent::value_form($form, $form_state);
   }
 
-  function options_validate(&$form, &$form_state) {
+  function options_validate($form, &$form_state) {
     parent::options_validate($form, $form_state);
 
     if (!empty($form_state['values']['options']['expose']['optional'])) {
diff --git a/includes/base.inc b/includes/base.inc
index 7522d9f..126bde3 100644
--- a/includes/base.inc
+++ b/includes/base.inc
@@ -42,7 +42,7 @@ class views_object {
    * Set default options on this object. Called by the constructor in a
    * complex chain to deal with backward compatibility.
    */
-  function options() { }
+  function options(&$options) { }
 
   /**
    * Set default options.
diff --git a/modules/comment/views_handler_field_comment.inc b/modules/comment/views_handler_field_comment.inc
index 6755b14..95edf0e 100644
--- a/modules/comment/views_handler_field_comment.inc
+++ b/modules/comment/views_handler_field_comment.inc
@@ -6,7 +6,7 @@ class views_handler_field_comment extends views_handler_field {
   /**
    * Override init function to provide generic option to link to comment.
    */
-  function init(&$view, &$options) {
+  function init(&$view, $options) {
     parent::init($view, $options);
     if (!empty($this->options['link_to_comment'])) {
       $this->additional_fields['cid'] = 'cid';
diff --git a/modules/node/views_handler_filter_node_access.inc b/modules/node/views_handler_filter_node_access.inc
index f787aee..010a286 100644
--- a/modules/node/views_handler_filter_node_access.inc
+++ b/modules/node/views_handler_filter_node_access.inc
@@ -4,7 +4,7 @@
  */
 class views_handler_filter_node_access extends views_handler_filter {
   function admin_summary() { }
-  function operator_form() { }
+  function operator_form(&$form, &$form_state) { }
   function can_expose() {
     return FALSE;
   }
diff --git a/modules/node/views_handler_filter_node_status.inc b/modules/node/views_handler_filter_node_status.inc
index 7047caa..a91b5c6 100644
--- a/modules/node/views_handler_filter_node_status.inc
+++ b/modules/node/views_handler_filter_node_status.inc
@@ -4,7 +4,7 @@
  */
 class views_handler_filter_node_status extends views_handler_filter {
   function admin_summary() { }
-  function operator_form() { }
+  function operator_form(&$form, &$form_state) { }
 
   function query() {
     $table = $this->ensure_my_table();
diff --git a/modules/system/views_handler_field_file.inc b/modules/system/views_handler_field_file.inc
index 0c5f4b2..82b06cd 100644
--- a/modules/system/views_handler_field_file.inc
+++ b/modules/system/views_handler_field_file.inc
@@ -6,7 +6,7 @@ class views_handler_field_file extends views_handler_field {
   /**
    * Constructor to provide additional field to add.
    */
-  function init(&$view, &$options) {
+  function init(&$view, $options) {
     parent::init($view, $options);
     if (!empty($options['link_to_file'])) {
       $this->additional_fields['filepath'] = 'filepath';
diff --git a/modules/taxonomy/views_handler_filter_term_node_tid.inc b/modules/taxonomy/views_handler_filter_term_node_tid.inc
index 2158965..1fe30c9 100644
--- a/modules/taxonomy/views_handler_filter_term_node_tid.inc
+++ b/modules/taxonomy/views_handler_filter_term_node_tid.inc
@@ -173,7 +173,7 @@ class views_handler_filter_term_node_tid extends views_handler_filter_many_to_on
     }
   }
 
-  function value_validate(&$form, &$form_state) {
+  function value_validate($form, &$form_state) {
     // We only validate if they've chosen the text field style.
     if ($this->options['type'] != 'textfield') {
       return;
diff --git a/modules/upload/views_handler_field_upload_description.inc b/modules/upload/views_handler_field_upload_description.inc
index 964925c..2b0ac18 100644
--- a/modules/upload/views_handler_field_upload_description.inc
+++ b/modules/upload/views_handler_field_upload_description.inc
@@ -4,7 +4,7 @@
  * Field handler to provide a list of roles.
  */
 class views_handler_field_upload_description extends views_handler_field {
-  function init(&$view, &$options) {
+  function init(&$view, $options) {
     parent::init($view, $options);
     if (!empty($options['link_to_file'])) {
       $this->additional_fields['fid'] = 'fid';
diff --git a/modules/user/views_handler_field_user.inc b/modules/user/views_handler_field_user.inc
index de8c6e6..0c62556 100644
--- a/modules/user/views_handler_field_user.inc
+++ b/modules/user/views_handler_field_user.inc
@@ -7,7 +7,7 @@ class views_handler_field_user extends views_handler_field {
   /**
    * Override init function to provide generic option to link to user.
    */
-  function init(&$view, &$data) {
+  function init(&$view, $data) {
     parent::init($view, $data);
     if (!empty($this->options['link_to_user'])) {
       $this->additional_fields['uid'] = 'uid';
diff --git a/modules/user/views_handler_field_user_name.inc b/modules/user/views_handler_field_user_name.inc
index 42ff1c8..deb814a 100644
--- a/modules/user/views_handler_field_user_name.inc
+++ b/modules/user/views_handler_field_user_name.inc
@@ -6,7 +6,7 @@ class views_handler_field_user_name extends views_handler_field_user {
   /**
    * Add uid in the query so we can test for anonymous if needed.
    */
-  function init(&$view, &$data) {
+  function init(&$view, $data) {
     parent::init($view, $data);
     if (!empty($this->options['overwrite_anonymous'])) {
       $this->additional_fields['uid'] = 'uid';
diff --git a/modules/user/views_handler_filter_user_name.inc b/modules/user/views_handler_filter_user_name.inc
index 8bf1a88..addfd82 100644
--- a/modules/user/views_handler_filter_user_name.inc
+++ b/modules/user/views_handler_filter_user_name.inc
@@ -35,7 +35,7 @@ class views_handler_filter_user_name extends views_handler_filter_in_operator {
     }
   }
 
-  function value_validate(&$form, &$form_state) {
+  function value_validate($form, &$form_state) {
     $values = drupal_explode_tags($form_state['values']['options']['value']);
     $uids = $this->validate_user_strings($form['value'], $values);
 
diff --git a/plugins/views_plugin_row.inc b/plugins/views_plugin_row.inc
index 06d0930..2fe3ae4 100644
--- a/plugins/views_plugin_row.inc
+++ b/plugins/views_plugin_row.inc
@@ -98,13 +98,13 @@ class views_plugin_row extends views_plugin {
   /**
    * Validate the options form.
    */
-  function options_validate($form, &$form_state) { }
+  function options_validate(&$form, &$form_state) { }
 
   /**
    * Perform any necessary changes to the form values prior to storage.
    * There is no need for this function to actually store the data.
    */
-  function options_submit($form, &$form_state) { }
+  function options_submit(&$form, &$form_state) { }
 
   function query() {
     if (isset($this->base_table) && isset($this->options['relationship']) && isset($this->view->relationship[$this->options['relationship']])) {
diff --git a/plugins/views_plugin_row_fields.inc b/plugins/views_plugin_row_fields.inc
index 491f5d2..bd66b42 100644
--- a/plugins/views_plugin_row_fields.inc
+++ b/plugins/views_plugin_row_fields.inc
@@ -60,7 +60,7 @@ class views_plugin_row_fields extends views_plugin_row {
    * Perform any necessary changes to the form values prior to storage.
    * There is no need for this function to actually store the data.
    */
-  function options_submit($form, &$form_state) {
+  function options_submit(&$form, &$form_state) {
     $form_state['values']['row_options']['inline'] = array_filter($form_state['values']['row_options']['inline']);
   }
 }

