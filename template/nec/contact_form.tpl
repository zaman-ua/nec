<!-- Get in touch-->
<section class="section section-lg bg-transparent text-center novi-background" >
    <div class="container">
        <h2>Get in Touch</h2>
        <form class="rd-mailform" data-form-type="contact" method="post" action="components/rd-mailform/rd-mailform.php">
            <div class="row row-20 novi-disabled">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="input-name">Name:</label>
                        <div class="position-relative">
                            <input class="form-control" id="input-name" type="text" name="name" placeholder="Your name" data-constraints="@Required">
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="input-email">E-mail:</label>
                        <div class="position-relative">
                            <input class="form-control" id="input-email" type="email" name="email" placeholder="Your e-mail address" data-constraints="@Email @Required">
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="input-tel">Phone:</label>
                        <div class="position-relative">
                            <input class="form-control" id="input-tel" type="tel" name="tel" placeholder="X-XXX-XXX-XXXX" data-constraints="@PhoneNumber @Required">
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-group">
                        <label for="input-question">Question:</label>
                        <div class="position-relative">
                            <textarea class="form-control" id="input-question" name="question" placeholder="Your question" data-constraints="@Required"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="offset-md">
                <button class="btn btn-lg btn-primary" type="submit">Submit</button>
            </div>
        </form>
    </div>
</section>
<!-- Google map-->
<section class="section section-lg bg-transparent text-center pb-0 novi-background" data-preset='{ldelim}"title":"Google Map","category":"map, contacts","reload":true,"id":"google-map-2"{rdelim}'>
    <h2>Google map</h2>
    <!-- Google map-->
    {literal}
    <div class="google-map" data-settings='{"center":{"lat":40.715847,"lng":-73.999925},"zoom":12,"markers":{"park":{"position":"Columbus Park, Baxter Street, New York, United State","html":"Columbus park"}},"styles":[{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#444444"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#7f75b5"},{"visibility":"on"}]}]}' id="map1"></div>
    {/literal}
</section>