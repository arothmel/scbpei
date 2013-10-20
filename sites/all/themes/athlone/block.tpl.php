<?php
// $Id: block.tpl.php,v 1.3 2007/08/07 08:39:36 goba Exp $
?>
  <div class="block block-<?php print $block->module; ?>" id="block-<?php print $block->module; ?>-<?php print $block->delta; ?>">
    <h1 class="title"><?php print $block->subject; ?></h1>
    <div class="content"><?php print $block->content; ?></div>
 </div>
