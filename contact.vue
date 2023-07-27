<template>
    <section class="contactMe-section" id="contact">

      <h1 class="bold">CONTACT ME</h1>


      <div class="contact-wrap">
        <div class="contactBtn"  @click="leftMover">
           <span class="mail bold">
             Mail
           </span>
            <p class="contactC"><figure class="mailIcon"></figure>cheongyeonggg@gmail.com</p>
        </div>

        <div class="contactBtn" @click="leftMover">
           <span class="mobile bold">
             Mobile
           </span>
           <p class="contactC"><figure class="phoneIcon"></figure>010-2423-7734</p>

        </div>

        <div class="contactBtn" @click="leftMover">
           <span class="GitHub bold">
             GitHub
           </span>
           <p class="contactC"><figure class="gitIcon"></figure><a target="_blank" href="https://github.com/cheongyeong">github.com/cheongyeong</a></p>
        </div>
       
    
      </div>




    </section>
  
</template>


<script>

export default {
  setup () {
    const leftMover = function (e) {
      const spans = document.querySelectorAll('.contactBtn') 
      if (e.target.classList.contains('active')) {
        e.target.classList.remove('active') 
      } else { 
        for (let i = 0; i < spans.length; i++) { 
          spans[i].classList.remove('active') 
        } 
        e.target.classList.add('active') 
      }
    }

    return {
      leftMover
    }
  }
}


</script>

<style scoped>


</style>




