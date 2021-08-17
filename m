Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0E3EF04B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 18:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0B76E1ED;
	Tue, 17 Aug 2021 16:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8FC6E1ED
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 16:40:07 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id a20so2331040vsh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=6LI4PdwQbeyRHF1YAOAuctkxgXekaE0KN5hssMpZdfk=;
 b=dfr23caCt149GJchhzW4af7iAK4iSSbg54Wl1quEbM3f41pyx8DtiIpNH3eA3+58hY
 amYerr3hfU/YNPA9k2B8Lize8eT1oMIXTKhVcZp7S1OdcHApc5xGv9pYGc1AGVE/IYM8
 zDfZTHhB2JDJPdWiWNCtNFDWAEVOzs0Ed9GwdPdc0nGjOHZSvqoap2B8uGBMfH2yIlzy
 EO00BKyG/F7IiJhPzgSS9zwFk9+YXMT7f2EASpg9gBWXgoxzMTliyn6jQT6Yb2ne4x7x
 tir3aYnlGppToxSPYXHDr7ybyZQj1KgBzTCn1GiLtkIVetw4oHk0PW09G13buGOIm4+z
 WMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=6LI4PdwQbeyRHF1YAOAuctkxgXekaE0KN5hssMpZdfk=;
 b=eCQJ0GxiKbaEQ7r58xX8GNqQNxUoSk9Xw82NNWL+LeamrLZ+qLBgDFV/ZvHwAfd0as
 hx+F30L9naFCudWPzFt4j1FLjkdYeF+VdxhtOycYlcSPZPvTF/zjwP+JsKzUdd75KqOX
 9JOvC+AZea1toOZ9emAPH17UQvkBBwiPvUKksfEtujIc7rga8lEJ4BL4sme9YbDmnCZY
 rvU4ECjlw09gV1opvVfPIjGw4mQxVWSWbaXx5sbxenFiLqBD33NiGot4C4bCmUlXQPYz
 1JA4uy4vpHu0+ajtt2iLzHopyiA582d7i8ZfYkxj3C0K3lUVLHB4yqE+XWdwyENvtjEF
 Yvdg==
X-Gm-Message-State: AOAM533FTR2YhDab8YCbI/unjtwtrhJiVoZNvJRC+UK7e6RY72cX9qdJ
 mnv0feP+0jV4XpjRsuPE8+zpmtmJV1mkOuSOh/dblQbQdSo=
X-Google-Smtp-Source: ABdhPJx+6sXbPbN2njsHjxfOL1nFY3dvjoCOfVYwxrTxSTXFQs1UNMLv2okGFUaGFiYOkzRGRgndd2KL5pDSIMuHBtU=
X-Received: by 2002:a67:be10:: with SMTP id x16mr3938627vsq.19.1629218406088; 
 Tue, 17 Aug 2021 09:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210817163605.1077257-1-pavlica.nikola@gmail.com>
In-Reply-To: <20210817163605.1077257-1-pavlica.nikola@gmail.com>
From: Nikola Pavlica <pavlica.nikola@gmail.com>
Date: Tue, 17 Aug 2021 18:39:53 +0200
Message-ID: <CAJ6oCjGPkLeRFEq45TvZ_SHceDo48qsbS00B7CX30CJOaMXUnw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v3
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000005b454505c9c3f815"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005b454505c9c3f815
Content-Type: text/plain; charset="UTF-8"

Apologies for the spammy emails, I didn't see Sam's comment on time.

On Tue, Aug 17, 2021 at 6:36 PM Nikola Pavlica <pavlica.nikola@gmail.com>
wrote:

> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
> after the device NOT the actual panel.
>
> The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
> 1024x600 used by the aforementioned device.
>
> Version 2, as Thierry kindly suggested that I fix the order in which the
> panel was ordered compared to others.
>
> Version 3, filling in the required info suggested by Sam. Plus some
> factual issues that I've corrected myself (tested working)
>
> Thanks,
> Nikola
>
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..f6b3e58c162b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3989,6 +3989,32 @@ static const struct panel_desc
> urt_umsh_8596md_parallel = {
>         .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  };
>
> +static const struct drm_display_mode vivax_tpc9150_panel_mode = {
> +       .clock = 60000,
> +       .hdisplay = 1024,
> +       .hsync_start = 1024 + 160,
> +       .hsync_end = 1024 + 160 + 100,
> +       .htotal = 1024 + 160 + 100 + 60,
> +       .vdisplay = 600,
> +       .vsync_start = 600 + 12,
> +       .vsync_end = 600 + 12 + 10,
> +       .vtotal = 600 + 12 + 10 + 13,
> +};
> +
> +static const struct panel_desc vivax_tpc9150_panel = {
> +       .modes = &vivax_tpc9150_panel_mode,
> +       .num_modes = 1,
> +       .size = {
> +               .width = 200,
> +               .height = 115,
> +       },
> +       .bpc = 6,
> +       .bus_format = MEDIA_BUS_FMT_RGB666_1X24,
> +       .bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +
>  static const struct drm_display_mode vl050_8048nt_c01_mode = {
>         .clock = 33333,
>         .hdisplay = 800,
> @@ -4490,6 +4516,9 @@ static const struct of_device_id platform_of_match[]
> = {
>         }, {
>                 .compatible = "urt,umsh-8596md-20t",
>                 .data = &urt_umsh_8596md_parallel,
> +       }, {
> +               .compatible = "vivax,tpc9150-panel",
> +               .data = &vivax_tpc9150_panel,
>         }, {
>                 .compatible = "vxt,vl050-8048nt-c01",
>                 .data = &vl050_8048nt_c01,
> --
> 2.32.0
>
>

--0000000000005b454505c9c3f815
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies for the spammy emails, I didn&#39;t see Sam&#39;=
s comment on time.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 17, 2021 at 6:36 PM Nikola Pavlica &lt;<a=
 href=3D"mailto:pavlica.nikola@gmail.com">pavlica.nikola@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The model=
 and make of the LCD panel of the Vivax TPC-9150 is unknown,<br>
hence the panel settings that were retrieved with a FEX dump are named<br>
after the device NOT the actual panel.<br>
<br>
The LCD in question is a 50 pin MISO TFT LCD panel of the resolution<br>
1024x600 used by the aforementioned device.<br>
<br>
Version 2, as Thierry kindly suggested that I fix the order in which the<br=
>
panel was ordered compared to others.<br>
<br>
Version 3, filling in the required info suggested by Sam. Plus some<br>
factual issues that I&#39;ve corrected myself (tested working)<br>
<br>
Thanks,<br>
Nikola<br>
<br>
Signed-off-by: Nikola Pavlica &lt;<a href=3D"mailto:pavlica.nikola@gmail.co=
m" target=3D"_blank">pavlica.nikola@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 29 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c<br>
index 4e2dad314c79..f6b3e58c162b 100644<br>
--- a/drivers/gpu/drm/panel/panel-simple.c<br>
+++ b/drivers/gpu/drm/panel/panel-simple.c<br>
@@ -3989,6 +3989,32 @@ static const struct panel_desc urt_umsh_8596md_paral=
lel =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,<br>
=C2=A0};<br>
<br>
+static const struct drm_display_mode vivax_tpc9150_panel_mode =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 60000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1024,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1024 + 160,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1024 + 160 + 100,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.htotal =3D 1024 + 160 + 100 + 60,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vdisplay =3D 600,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_start =3D 600 + 12,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_end =3D 600 + 12 + 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vtotal =3D 600 + 12 + 10 + 13,<br>
+};<br>
+<br>
+static const struct panel_desc vivax_tpc9150_panel =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.modes =3D &amp;vivax_tpc9150_panel_mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_modes =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D 200,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height =3D 115,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bpc =3D 6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bus_format =3D MEDIA_BUS_FMT_RGB666_1X24,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bus_flags =3D DRM_BUS_FLAG_DE_HIGH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.connector_type =3D DRM_MODE_CONNECTOR_LVDS,<br=
>
+};<br>
+<br>
+<br>
=C2=A0static const struct drm_display_mode vl050_8048nt_c01_mode =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .clock =3D 33333,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .hdisplay =3D 800,<br>
@@ -4490,6 +4516,9 @@ static const struct of_device_id platform_of_match[] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;urt,umsh-8596md-20t&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;urt_=
umsh_8596md_parallel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &qu=
ot;vivax,tpc9150-panel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;viva=
x_tpc9150_panel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;vxt,vl050-8048nt-c01&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;vl05=
0_8048nt_c01,<br>
-- <br>
2.32.0<br>
<br>
</blockquote></div>

--0000000000005b454505c9c3f815--
