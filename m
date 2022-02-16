Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638C4B84FD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FCE10E94F;
	Wed, 16 Feb 2022 09:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2888D10E94B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645005396;
 bh=vxAilGNhIkW3A4eLRH0QPhO9uPa6cXkvfIVt5ay4pC8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YSJiUqy4KqeLOxetSXbM08lICSYfGeQ8oQkCGvut7RPx14Tdp0222eo7D17PSxe50
 JUIh6I+V0niClrjpCrZh0oeCOH6jZ5xrkDFLViEiiSP2v+wUrtFRiMIP4pEzy595nJ
 Q+VQWU12ue3pEFmoi45JDP3sgvBH/++ywzpOYXdI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1nTeic2ocs-009RoO; Wed, 16
 Feb 2022 10:56:36 +0100
Message-ID: <4231ff97-944e-7a7f-6c21-da94970549a9@gmx.de>
Date: Wed, 16 Feb 2022 10:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: au1100fb: Spelling s/palette/palette/
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220216084029.2913685-1-geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220216084029.2913685-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vSqJPc7ClD8PMCvdkq5h9fAxYxqc+8R7P6HmllNif+DMKr1adjm
 XM7lX66U4+unv3r/BkHr6l8z9iFplmk7/P+E9xDHve457ajVHOEznwoPhyuHm4uXeRdCAIn
 I8rkSQKciEJolPI3GxM4bfSqlJTkBRAvpPu+CZghaYQ2aVb4LyJV4UOslvh8WgqRlmIzuRY
 34sbTFUcr/Tc4KHMyHPWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a31ww4NVe2s=:Wpod6ZLC7gQci4U5KAebZF
 9X/WcS0lD8izXHjEm1y67QgM7gzhlUVaHCPSIihrdG75I6opniFDM12Ed4QWo7LdpFtjgRP4x
 sU84l+dhyiFgsAhq8Yctd1z5+a6I0NeHEdIeMczchok4NwZt4Be8bw5wuJIg9HHyEYTVWoz/O
 6Rhwn6KDzqY7vdGvdyHb14J3eh0+KPq4qOUkyGAmq0Bgam6wH+fmsZV0ukFBQB/Ei9jlM3UxR
 fdMhtfyff9i38kVj2Bb/NHEEvZDdPTGWE4yuP85mlnDZM1gu7Tky9macygLQMCMcIpiEKXT8j
 WIXp0NEOqma+kEHMeC1pEJHQkaHXOUzx5juBGxMzspq15ZiVafM0WPE4PqACFnvOKjCjWspp1
 dOI5nXbMHp4acKxKhUEoCe1gcM5Hwmq4I4SUndL6mFQydz7SNTnwoViu2dx/zfq1Seo3thxLQ
 a5dO82IKPivo/SCi48rTATa4+R4EZHWy/UfqjGW2YgLwI1gPA2hb5LTUYrw1H/w1oUR3i7Fg/
 FzIFXTLyj48ar+yi81i6qCrZkTYKI9Q5dW2S1v90mCrJTgB3rkTkDoJJhcFVNFFu3Q/bZaNyg
 YSYCKWDT/9p7cQRXxqPUg+ZQ/YJ71+f+XZtTo1ooGne0t4DiiHxDarHweTPlh+n/yQwqu13oD
 Zx4BLnaStqVwiY5NLmnDrrVIEhC0Qd5PcBg54itbUTD9OtHsVlvsPv/y59mXAgq0sq4IeOjDA
 nnrdgYVhgXvL+PhjaPnQpG4uMo7Km8sCrxTethfgklMgNWkkGvcjCP0d7VBHeOR2oj6L/5mWl
 onK7ITq/VgezgQNhmRoJlxt2KmeGmKM4c3FOzQoNbe4o0WyEJCLPkbQk4j+2JTQvcxy260jl8
 5yyCjmIrZwCQEcLoz/ADkzsvNuldXeym5O7YyHV2nBDaiR4LsjynJsF+1dagRgPyRUCbHGxwv
 SeeafMQYX0hPsu4TZHaj+krPZ/0L6WQxg3cceKw8srtGPGy4UYNAMNPoTFCxClMNevO8i0uUW
 hsa5iDI8YeFWiovo4EAt+GU4AaPZhtrGuFxqyOCKwGdJKdozGPoF2IepzG2Ao782cd5KivmaG
 6uvN52Q6GpnC0Y=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/22 09:40, Geert Uytterhoeven wrote:
> Fix a misspelling of "palette" in a structure member.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

applied.
Thanks!
Helge

> ---
>  drivers/video/fbdev/au1100fb.c | 2 +-
>  drivers/video/fbdev/au1100fb.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index 37a6512feda0fb20..52f731a6148210eb 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -239,7 +239,7 @@ int au1100fb_fb_setcolreg(unsigned regno, unsigned r=
ed, unsigned green, unsigned
>  	u32 value;
>
>  	fbdev =3D to_au1100fb_device(fbi);
> -	palette =3D fbdev->regs->lcd_pallettebase;
> +	palette =3D fbdev->regs->lcd_palettebase;
>
>  	if (regno > (AU1100_LCD_NBR_PALETTE_ENTRIES - 1))
>  		return -EINVAL;
> diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100=
fb.h
> index e7239bceefd3ad34..79f4048726f1af0f 100644
> --- a/drivers/video/fbdev/au1100fb.h
> +++ b/drivers/video/fbdev/au1100fb.h
> @@ -92,7 +92,7 @@ struct au1100fb_regs
>  	u32  lcd_pwmdiv;
>  	u32  lcd_pwmhi;
>  	u32  reserved[(0x0400-0x002C)/4];
> -	u32  lcd_pallettebase[256];
> +	u32  lcd_palettebase[256];
>  };
>
>  struct au1100fb_device {

