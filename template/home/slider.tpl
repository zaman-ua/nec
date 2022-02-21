<!-- SLIDER -->
<div class="container-fluid carousel_main hidden-xs">
    <div id="carousel-example-generic" class="carousel slide first_carousel" data-ride="carousel">
        <ol class="carousel-indicators">
        {foreach from=$aBanner item=aCurrentBanner key=myId name=bannerForeach}
            <li data-target="#carousel-example-generic" data-slide-to="{$myId}" {if $smarty.foreach.bannerForeach.first}class="active"{/if}></li>
        {/foreach}
        </ol>

        <div class="carousel-inner" role="listbox">
        {foreach from=$aBanner item=aCurrentBanner name=bannerForeach}
            <div class="item {if $smarty.foreach.bannerForeach.first}active{/if}">
                <a href="{$aCurrentBanner.link}">
                <img src="{$aCurrentBanner.image}" alt="" class="img-responsive">
                </a>
           </div>
         {/foreach}
       </div>
       <div class="container">
           <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
           </a>
           <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
           </a>
       </div>
   </div>