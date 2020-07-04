Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3015C2144F0
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAD36E06B;
	Sat,  4 Jul 2020 11:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk
 [IPv6:2001:41c9:1:41f::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F86E06B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 11:12:06 +0000 (UTC)
Received: from host86-182-221-233.range86-182.btcentralplus.com
 ([86.182.221.233] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jrg5b-000209-5T; Sat, 04 Jul 2020 12:12:12 +0100
To: Sam Ravnborg <sam@ravnborg.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
 <20200704072305.GA689588@ravnborg.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <02fbd875-f6fd-da20-6835-778bdd6426c3@ilande.co.uk>
Date: Sat, 4 Jul 2020 12:11:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200704072305.GA689588@ravnborg.org>
Content-Language: en-US
X-SA-Exim-Connect-IP: 86.182.221.233
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2020 08:23, Sam Ravnborg wrote:

> I tried to take a look at this - came up with the following untested
> hack.
> The idea is that we in mode_config can specify if we need the cfb
> variants. (I do not know what cfb is acronym for?)
> Then when we setup the framebuffer we select the relevant fbops.
> 
> The oops refers to drm_fb_helper_dirty_work, so I think it is the memcpy
> in drm_fb_helper_dirty_blit_real() that hits us.
> 
> For now I used fb_memcpy_tofb() - but that is a macro that is
> expanded depending on the architecture. I think we can do btter if this
> works.
> 
> 	Sam
> 
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 853081d186d5..1609ac6efbcb 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -151,6 +151,7 @@ int bochs_kms_init(struct bochs_device *bochs)
>  	bochs->dev->mode_config.preferred_depth = 24;
>  	bochs->dev->mode_config.prefer_shadow = 0;
>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> +	bochs->dev->mode_config.use_cfb_for_fbdev = true;
>  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>  
>  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 170aa7689110..44e833b2f015 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -382,8 +382,13 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y;
>  
> +	// TODO
>  	for (y = clip->y1; y < clip->y2; y++) {
> -		memcpy(dst, src, len);
> +		if (fb_helper->dev->mode_config.use_cfb_for_fbdev)
> +			fb_memcpy_tofb(dst, src, len);
> +		else
> +			memcpy(dst, src, len);
> +
>  		src += fb->pitches[0];
>  		dst += fb->pitches[0];
>  	}
> @@ -2017,6 +2022,21 @@ static const struct fb_ops drm_fbdev_fb_ops = {
>  	.fb_imageblit	= drm_fb_helper_sys_imageblit,
>  };
>  
> +static const struct fb_ops drm_fbdev_cfb_fb_ops = {
> +	.owner		= THIS_MODULE,
> +	DRM_FB_HELPER_DEFAULT_OPS,
> +	.fb_open	= drm_fbdev_fb_open,
> +	.fb_release	= drm_fbdev_fb_release,
> +	.fb_destroy	= drm_fbdev_fb_destroy,
> +	.fb_mmap	= drm_fbdev_fb_mmap,
> +	.fb_read	= drm_fb_helper_sys_read,
> +	.fb_write	= drm_fb_helper_sys_write,
> +	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
> +	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
> +	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
> +};
> +
> +
>  static struct fb_deferred_io drm_fbdev_defio = {
>  	.delay		= HZ / 20,
>  	.deferred_io	= drm_fb_helper_deferred_io,
> @@ -2057,7 +2077,11 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  	if (IS_ERR(fbi))
>  		return PTR_ERR(fbi);
>  
> -	fbi->fbops = &drm_fbdev_fb_ops;
> +	if (fb_helper->dev->mode_config.use_cfb_for_fbdev)
> +		fbi->fbops = &drm_fbdev_cfb_fb_ops;
> +	else
> +		fbi->fbops = &drm_fbdev_fb_ops;
> +
>  	fbi->screen_size = fb->height * fb->pitches[0];
>  	fbi->fix.smem_len = fbi->screen_size;
>  
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6c3ef49b46b3..dce9adf7d189 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -865,6 +865,15 @@ struct drm_mode_config {
>  	 */
>  	bool prefer_shadow_fbdev;
>  
> +	/**
> +	 * @use_cfb_for_fbdev:
> +	 *
> +	 * Use cfb variants of drm_fb_helper_cfb_{fillrect,copyarea,imageblit}
> +	 * The cfb variants are required when the CPU do not allow direct
> +	 * access to the framebuffer (for example sparc64)
> +	 */
> +	bool use_cfb_for_fbdev;
> +
>  	/**
>  	 * @quirk_addfb_prefer_xbgr_30bpp:
>  	 *

Thanks for the quick response, Sam! I tried the above diff and it stills seems to
provoke a memory access error (although now the kernel hangs rather than panicking
and continuing to boot).

Digging a bit more I can see the fault occurring in cfb_imageblit():


IN: cfb_imageblit
0x00000000007ad8c0:  ldsb  [ %i5 ], %g1
0x00000000007ad8c4:  add  %g3, 4, %i3
0x00000000007ad8c8:  sra  %g1, %g2, %g1
0x00000000007ad8cc:  and  %g1, %o5, %g1
0x00000000007ad8d0:  srl  %g1, 0, %g1
0x00000000007ad8d4:  sllx  %g1, 2, %g1
0x00000000007ad8d8:  ld  [ %o4 + %g1 ], %g1
0x00000000007ad8dc:  and  %i2, %g1, %g1
0x00000000007ad8e0:  xor  %g1, %i1, %g1
0x00000000007ad8e4:  sta  %g1, [ %g3 ] #ASI_PHYS_BYPASS_EC_WITH_EBIT
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

0x00000000007ad8e8:  cmp  %g2, 0
0x00000000007ad8ec:  bne  %icc, 0x7ad8b4
0x00000000007ad8f0:  mov  %i3, %g3


According to gdbstub the destination address in $g3 looks like this:

Breakpoint 1, 0x00000000007ad8e4 in cfb_imageblit ()
(gdb) i r $g3
g3             0x100220000      4297195520


The 0x100220000 address still isn't right. On sun4u the PCI address space is mapped
at physical address 0x1fe00000000 and adding these two together gives 0x1ff00220000
which seems closer, but still not the correct framebuffer address 0x1ff22000000 which
is reported at boot:

[    9.007161] [drm] Found bochs VGA, ID 0xb0c5.
[    9.007840] [drm] Framebuffer size 16384 kB @ 0x1ff22000000, mmio @ 0x1ff23000000.



ATB,

Mark.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
