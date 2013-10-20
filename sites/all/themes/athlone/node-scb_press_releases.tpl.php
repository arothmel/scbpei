<?php
// $Id: node.tpl.php,v 1.7 2007/08/07 08:39:36 goba Exp $
?>
<div id="node-<?php print $node->nid; ?>" class="node press<?php if ($sticky) { print ' sticky'; } ?><?php if (!$status) { print ' node-unpublished'; } ?> clear-block">

    <?php if ($picture) {
      print $picture;
    }?>
    <?php if ($page == 0) { ?>
    <h2 class="title"><?php print $title?></h2><?php }; ?>

  <?php if ($submitted): ?>
    <span class="submitted">Posted by <?php print $node->name; ?>&nbsp;on&nbsp; <?php print $date ?></span>
  <?php endif; ?>    

    <div class="taxonomy"><?php print $terms?></div>
    <div class="content">
     <?php print $node->content['body']['#value']; ?>
     <?php print $node->content['field_press_link']['#children']; ?>
   <!--  <?php print $content?> -->
   </div>
   
  <?php if ($links): ?>
   <div class="postmeta">&raquo; <?php print $links; ?> </div>
  <?php endif; ?>   
  </div>
