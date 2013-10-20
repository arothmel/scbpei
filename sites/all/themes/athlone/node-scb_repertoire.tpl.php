<?php
// $Id: node.tpl.php,v 1.7 2007/08/07 08:39:36 goba Exp $
?>
<div id="node-<?php print $node->nid; ?>" class="node music<?php if ($sticky) { print ' sticky'; } ?><?php if (!$status) { print ' node-unpublished'; } ?> clear-block">

    <?php if ($picture) {
      print $picture;
    }?>

    <?php if ($page == 0) { ?>
    <h2 class="title"><a href="<?php print $node_url?>"><?php print $title?></a></h2><?php }; ?>

  <?php if ($submitted): ?>
    <?php endif; ?>    

    <div class="taxonomy"><?php print $terms?></div>
    <div class="content">
    <table>
    <tr><td class="music-tab">
     <?php print $node->content['field_cover_pic']['field']['#children']; ?>
     </td><td class="music-tab">
     <?php print $node->content['field_editors_review']['field']['#children']; ?>
     </td>
    </tr>
    <tr><td class="music-tab">&raquo; &nbsp; <?php print $node->content['field_listen_now']['field']['#children']; ?> 
        </td><td class="music-tab"></td></tr>
        
    </table>
</div> <?php if ($links): ?> <div class="postmeta">&raquo; <?php print $links; ?> </div> <?php endif; ?>   </div>
